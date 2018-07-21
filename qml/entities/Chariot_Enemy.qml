import QtQuick 2.0
import VPlay 2.0


EntityBase{
    id:chariotEnemy

    //暴露自己的坐标
    property alias chariotX: chariotEnemy.x
    property alias chariotY: chariotEnemy.y
    property alias imageRotation: enemyImage.rotation//暴露塔克方向，用来判断子弹移动方向和初始创建坐标


    //根据坦克方向获取子弹移动方向
    function moveBulletX(){
        if(chariotEnemy.imageRotation == 0)
            return 650
        else if(chariotEnemy.imageRotation == 180)
            return 0
        else
            return
    }
    function moveBulletY(){
        if(chariotEnemy.imageRotation == 90)
            return 650
        else if(chariotEnemy.imageRotation == -90)
            return 0
        else
            return
    }

    //随机平等的返回0，1，-1，2，用于敌人坦克随机改变方向

    function direction(){
        if(0 <= Math.random() && Math.random() <=0.25)
            return 0
        else if(0.26 <= Math.random() && Math.random() <= 0.5 )
            return 1
        else if(0.51 <= Math.random() && Math.random() <= 0.75)
            return -1
        else
            return 2
    }

    //entityId: "chariotEnemyId"
    entityType: "chariotEnemy"
    height: 45
    width: 45
    transformOrigin: Item.BottomRight

    Image {
        id: enemyImage
        source: "../../assets/car_enemy.png"
        anchors.fill: parent
        width: boxCollider.width
        height: boxCollider.height
        rotation: -90
    }

    BoxCollider{
        id:boxCollider
        width: chariotEnemy.width
        height: chariotEnemy.height

//        linearVelocity:Qt.point(0,100)
//        torque: moveToPointHelper.outputXAxis * 5
//        sleepingAllowed: false
//        fixedRotation: false

//        density: 0.0005
//        friction: 0.9
//        linearDamping: 0.1
//        bodyType: Body.Static
        //linearVelocity: Qt.point(0,150)

//当碰撞的时候，根据碰撞的子弹是友军的还是敌方的，如果是敌方的就移除自己
        fixture.onBeginContact: {
            //console.log(enemyImage.rotation)

            var collide = other.getBody().target
            if(collide.entityType === "bullet"){
                removeEntity()
                //chariotEnemy.visible = false
                gameScene.enemyNumber --
                //chariotEnemy.visible = false
                //creatEnemyBullet.running = false
                console.log(gameScene.enemyNumber)
                //创建新的坦克
                gameScene.creatEnemy_new = true
                //当敌方坦克数量为0，游戏胜利，并初始化敌方坦克数量，为下次游戏做准备
                if(gameScene.enemyNumber == 0){
                    gameWindow.state = "gameWin"
                    bgMusic.stop()
                    var toRemoveEntityTypes = ["chariotEnemy"];
                     entityManager.removeEntitiesByFilter(toRemoveEntityTypes)
                    gameScene.enemyNumber = 20
                }
                destory.play()
            }

            timer.start()

            //实现根据坦克的头的方向，在该方向自动移动，碰撞一次改变一次方向
            enemyImage.rotation = direction() * 90
            if(enemyImage.rotation == 0){
                boxCollider.linearVelocity = Qt.point(0,-200)
            }
            else if(enemyImage.rotation == 90){
                boxCollider.linearVelocity = Qt.point(0,200)
            }
            else if(enemyImage.rotation == -90){
                boxCollider.linearVelocity = Qt.point(200,0)
            }
            else {
                boxCollider.linearVelocity = Qt.point(-200,0)
            }
        }
    }

    //计时器，防止坦克碰撞后改变方向与原来一致从而不动，所以加了个计时器，改变坦克方向
    Timer{
        id:timer
        running: false
        interval: 1000
        repeat: true
        onTriggered: {
            enemyImage.rotation = direction() * 90
            //console.log(enemyImage.rotation)
            if(enemyImage.rotation == 0){
                boxCollider.linearVelocity = Qt.point(150,0)
            }
            else if(enemyImage.rotation == 90){
                boxCollider.linearVelocity = Qt.point(0,150)
            }
            else if(enemyImage.rotation == -90){
                boxCollider.linearVelocity = Qt.point(0,-150)
            }
            else {
                boxCollider.linearVelocity = Qt.point(-150,0)
            }
        }
    }

//    function distanceX(){
//        return Math.abs(moveBulletX() - chariotEnemy.x)
//    }
//    function distanceY(){
//        return Math.abs(moveBulletY() - chariotEnemy.y)
//    }

    //为每个敌方坦克添加子弹实体类，并使子弹发射（移动）
    Component{
        id:enemyBulletComponent
        Bullet{
            myBulletType: "enemyBullet"
            PropertyAnimation on x{
                to: moveBulletX()
                duration: 800
            }
            PropertyAnimation on y{
                to: moveBulletY()
                duration: 800
            }
        }
    }


//    function stopLaunch(){
//        if(chariotEnemy.visible == false){
//           creatEnemyBullet.running = false
//        }
//    }

    //计时器，定时创建子弹，初始子弹坐标为坦克头的方向
    Timer{
        id:creatEnemyBullet
        running: true
        repeat: true
        interval: 1000
        onTriggered: {
            //stopLaunch()
            for(var i = 0;i<1; ++i){
                var chushiCoor = {
                    x:chariotEnemy.imageRotation == 0 ? chariotEnemy.chariotX+ 65 :
                                                       chariotEnemy.imageRotation == 180 ? chariotEnemy.chariotX -15 :
                                                                                chariotEnemy.chariotX + 22.5,

                    y:chariotEnemy.imageRotation == 90 ? chariotEnemy.chariotY + 65 :
                                                       chariotEnemy.imageRotation == -90 ? chariotEnemy.chariotY - 15 :
                                                             chariotEnemy.chariotY + 22.5
                }
                entityManager.createEntityFromComponentWithProperties(enemyBulletComponent,chushiCoor)
            }
        }
    }


}
