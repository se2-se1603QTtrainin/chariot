import QtQuick 2.0
import VPlay 2.0

EntityBase{
    id:chariotRed
    entityId: "chariotRedId"
    entityType: "chariotRed"
//暴露自身坐标和方向，用来判断子弹移动方向和初始创建坐标
    property  alias chariotX: chariotRed.x
    property alias chariotY: chariotRed.y
    property alias imageRotation: redChariotImage.rotation
    property alias velocity: boxCollider.linearVelocity

    //游戏结束信号
    signal gameOver

    width: 45
    height: 45


    BoxCollider{
        id:boxCollider
        width: chariotRed.width
        height: chariotRed.height
        anchors.fill: parent
        //bodyType: Body.Static

        //碰撞检测，当碰撞，坦克生命减1并初始化坦克，为0时游戏失败，移除所有敌方坦克，方便下次游戏重新创建敌方坦克
        fixture.onBeginContact: {
            //console.log(redChariotImage.rotation)
            //console.log("chariotX,y",chariotRed.x,chariotRed.y)
            var collide = other.getBody().target
            if(collide.entityType === "enemyBullet"){
 //               removeEntity()
                destory.play()
                chariotRedNumber--
                gameScene.chariotRedReset()
                if(chariotRedNumber == 0){
                    gameOver()
                    bgMusic.stop()
                    chariotRedNumber = 3
                    var toRemoveEntityTypes = ["chariotEnemy"];
                     entityManager.removeEntitiesByFilter(toRemoveEntityTypes);//游戏结束时移除所有敌方坦克

                }
            }
        }
    }

    Image {
        id: redChariotImage
        source: "../../assets/car_red.png"
        width: boxCollider.width
        height: boxCollider.height
        anchors.fill: boxCollider
        rotation: -90
    }
}
