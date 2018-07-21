import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"


//游戏场景，主要游戏功能在此实现
SceneBase{
    id:gameScene
    width: 650
    height: 650

    //敌方坦克初始数量
    property int enemyNumber: 20
    property int chariotRedNumber: 3
    signal backMenuPressed
    property alias creatEnemy_new: creatEnemy_new.running


    //初始游戏函数
    function gameReset()
    {
        chariotRed.x = 203
        chariotRed.y = 605
        chariotRed.imageRotation = - 90
        home.visible = true
        woodenWall1.visible = true
        woodenWall2.visible =true
        woodenWallCry1.visible = true
        woodenWallCry2.visible = true
        woodenWallHL.visible = true
        woodenWallHR.visible = true
        woodenWallHTL.visible = true
        woodenWallHTR.visible = true
        creatWallBC.restart()
        creatWallBL.restart()
        creatWallBR.restart()
        creatWallCC.restart()
        creatWallCCL.restart()
        creatWallCCR.restart()
        creatWallTC.restart()
        creatWallTL.restart()
        creatWallTR.restart()
    }

    function chariotRedReset(){
        chariotRed.x = 203
        chariotRed.y = 605
        chariotRed.imageRotation = - 90
    }

    function chariotEnemyReset(){
        creatEnemy.running = true
    }


    PhysicsWorld{
        id:physicsWorld

        updatesPerSecondForPhysics: 60

        velocityIterations: 5
        positionIterations: 5

        debugDrawVisible: false
        z:10
    }

    //返回按钮
    MenuButton{
        text: "返回主菜单"
        id:mainMenu
        anchors.left: gameScene.right
        anchors.leftMargin: 20
        anchors.bottom: gameScene.bottom
        anchors.bottomMargin: 20
        onClicked: {
            backMenuPressed()
            gameReset()
        }
    }
    //记分板
    Text {
        id: level
        font.pixelSize: 30
        color: "blue"
        text: qsTr("第一关")
        anchors.left: gameScene.right
        anchors.leftMargin: 30
    }
    Image {//敌人
        id: enemyIamge
        width: 45
        height: 45
        z:12
        source: "../../assets/car_enemy.png"
        anchors.left: gameScene.right
        anchors.leftMargin: 10
        anchors.top: gameScene.top
        anchors.topMargin: 100
    }
    Text {
        id: enemyNumbers
        text: "  × " + enemyNumber
        font.pixelSize: 25
        anchors.left: enemyIamge.right
        anchors.top: enemyIamge.top
    }

    Image {//玩家1
        id: chariotRedImage
        width: 45
        height: 45
        z:12
        source: "../../assets/car_red.png"
        anchors.left: gameScene.right
        anchors.leftMargin: 10
        anchors.top: gameScene.top
        anchors.topMargin: 200
    }
    Text {
        id: chariotRedNumbers
        text: "  × " + chariotRedNumber
        font.pixelSize: 25
        anchors.left: chariotRedImage.right
        anchors.top: chariotRedImage.top
    }

    //游戏背景
    MultiResolutionImage{
        id:bg
        source: "../../assets/gamebg.jpg"
        anchors.fill: parent
    }

    //在游戏场景创建墙
    //边框墙
    Wall{
        id:topWall
        width: gameScene.width
        anchors.bottom: gameScene.top
    }
    Wall{
        id:bottomWall
        width: gameScene.width
        anchors.top: gameScene.bottom
    }
    Wall{
        id:leftWall
        height: gameScene.height
        anchors.right: gameScene.left
    }
    Wall{
        id:rightWall
        height: gameScene.height
        anchors.left: gameScene.right
    }


    //木墙组件，用于一次创建多个墙
    Component{
        id:wallComponent
        Wall_Wooden{}
    }

    //创建有规律可用循环创建的木墙，用计时器创建可以在初始游戏时重新启动计时器，创建墙
    Timer{
        id:creatWallTL
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <9; ++ j){
                var chushiy = {
                        x: gameScene.x + 50 + i * 100,
                        y: gameScene.y + 50 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }

    Timer{
        id:creatWallTC
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <7; ++ j){
                var chushiy = {
                        x: gameScene.x + 250 + i * 100,
                        y: gameScene.y + 50 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }

    Timer{
        id:creatWallTR
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <9; ++ j){
                var chushiy = {
                        x: gameScene.x + 450 + i * 100,
                        y: gameScene.y + 50 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }

    Timer{
        id:creatWallBL
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <7; ++ j){
                var chushiy = {
                        x: gameScene.x + 50 + i * 100,
                        y: gameScene.y + 425 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }
    Timer{
        id:creatWallBC
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <6; ++ j){
                var chushiy = {
                        x: gameScene.x + 250 + i * 100,
                        y: gameScene.y + 375 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }
    Timer{
        id:creatWallBR
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <7; ++ j){
                var chushiy = {
                        x: gameScene.x + 450 + i * 100,
                        y: gameScene.y + 425 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }
    Timer{
        id:creatWallCC
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <2; ++ j){
                var chushiy = {
                        x: gameScene.x + 250 + i * 100,
                        y: gameScene.y + 275 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }

    Timer{
        id:creatWallCCL
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <2; ++ j){
                var chushiy = {
                        x: gameScene.x + 100 + i * 50,
                        y: gameScene.y + 325 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }
    Timer{
        id:creatWallCCR
        running: true
        onTriggered:{
            for(var i = 0; i < 2;++i){
                for(var j = 0; j <2; ++ j){
                var chushiy = {
                        x: gameScene.x + 450 + i * 50,
                        y: gameScene.y + 325 + j * 25
                    }
                entityManager.createEntityFromComponentWithProperties(wallComponent,chushiy)
                }
            }
        }
    }

//无法用循环创建的木墙
    Wall_Wooden{
        id:woodenWallHTL
        x:275
        y:575
    }
    Wall_Wooden{
        id:woodenWallHTR
        x:325;y:575
    }
    Wall_Wooden{
        id:woodenWallHL
        rotation: 90;x:300;y:600
    }
    Wall_Wooden{
        id:woodenWallHR
        rotation: 90;x:375;y:600
    }
    Wall_Wooden{
        id:woodenWallCry1
        y:325
    }
    Wall_Wooden{
        id:woodenWallCry2
        x:600;y:325
    }
    Wall_Wooden{
        id:woodenWall1
        x:300;y:400
    }
    Wall_Wooden{
        id:woodenWall2
        x:300;y:425
    }

//不可破坏的墙
    Wall_Crystal{
        id:crystalL
        y:350
    }
    Wall_Crystal{
        id:crystalR
        x:600;y:350
    }
    Wall_Crystal{
        id:crystalC1
        x:300;y:150
    }
    Wall_Crystal{
        id:crystalC2
        x:300;y:175
    }

//家
    Home{
        id:home
        x:300;y:600
        onGameOver: gameWindow.state = "gameOver"
    }

//红车子弹移动，根据坦克的头判断方向
    function moveRedX(){
        if(chariotRed.imageRotation == 0)
            return 650
        else if(chariotRed.imageRotation == 180)
            return 0
    }
    function moveRedY(){
        if(chariotRed.imageRotation == 90)
            return 650
        else if(chariotRed.imageRotation == -90)
            return 0
    }

//红坦克
    Chariot_Red{
        id:chariotRed
        x:203;y:605
        onGameOver: gameWindow.state = "gameOver"
    }

//    Chariot_Blue{
//        id:chariotBlue
//        x:375
//        y:650
//        rotation: -90
//    }



//玩家控制红坦克移动的四个按钮，只需要4个方向，所以没用JoystickControllerHUD类
    Image {
        id: top
        source: "../../assets/dicretion.png"
        width: 25
        height: 25
        x:25
        y:575
        rotation: 90
        MouseArea{
            anchors.fill: parent
            onPressed: {
                chariotRed.velocity = Qt.point(0,-200)
                chariotRed.imageRotation = -90
            }
            onReleased: {chariotRed.velocity = Qt.point(0,0)}
    }
    }
    Image {
        id: bottom
        source: "../../assets/dicretion.png"
        width: 25
        height: 25
        x:25
        y:625
        rotation: -90
        MouseArea{
            anchors.fill: parent
            onPressed: {
                chariotRed.velocity = Qt.point(0,200)
                chariotRed.imageRotation = 90

            }
            onReleased: {chariotRed.velocity = Qt.point(0,0)}
        }
    }
    Image {
        id: left
        source: "../../assets/dicretion.png"
        width: 25
        height: 25
        y:600
        MouseArea{
            anchors.fill: parent
            onPressed: {
                chariotRed.velocity = Qt.point(-200,0)
                chariotRed.imageRotation = 180
            }
            onReleased: {chariotRed.velocity = Qt.point(0,0)}
        }
    }
    Image {
        id: right
        source: "../../assets/dicretion.png"
        width: 25
        height: 25
        x:50
        y:600
        rotation: 180
        MouseArea{
            anchors.fill: parent
            onPressed: {
                chariotRed.velocity = Qt.point(200,0)
                chariotRed.imageRotation = 0
            }
            onReleased: {chariotRed.velocity = Qt.point(0,0)}
        }
    }


    //创建红坦克子弹的组件
    Component{
        id:bulletRedCompoent
        Bullet{
            myBulletType: "bullet"
            id:chariotRedBullet
            //移动子弹
            PropertyAnimation on x{
                to: moveRedX()
                duration: 800
            }
            PropertyAnimation on y{
                to: moveRedY()
                duration: 800
            }
       }
    }


    //红坦克发射子弹按钮
    Image {
        id:launchImage
        width: 100
        height: 100
        x:550
        y:550
        z:12
        opacity: 0.5
        source: "../../assets/FireEasy.png"
        MouseArea{
            anchors.fill: parent
            onPressed: {
                //根据红坦克的头的方向，初始子弹发射坐标
                var chushiCoor = {
                    x:chariotRed.imageRotation == 0 ? chariotRed.chariotX+ 70 :
                                                       chariotRed.imageRotation == 180 ? chariotRed.chariotX -20 :
                                                                                chariotRed.chariotX + 22.5,

                    y:chariotRed.imageRotation == 90 ? chariotRed.chariotY + 70 :
                                                       chariotRed.imageRotation == -90 ? chariotRed.chariotY - 20 :
                                                             chariotRed.chariotY + 22.5
                }

                launch.play()
                //console.log("onClicked")
                entityManager.createEntityFromComponentWithProperties(bulletRedCompoent,chushiCoor)
            }
        }
    }

    //一次创建多个敌方坦克的组件
    Component{
        id:enemyComponent
        Chariot_Enemy{
        }
    }
    //创建3个敌方坦克，计时器可用来再次创建
    Timer{
        id:creatEnemy
        running: true
        onTriggered: {

            for(var i = 0;i< 4; ++i){
                var chushiCoor = {
                    x: 200 * i
                }
                entityManager.createEntityFromComponentWithProperties(enemyComponent,chushiCoor)
            }
        }
    }
    Timer{
        id:creatEnemy_new
        running: false
        onTriggered: {
            var chushiCoor = { x: 600 * Math.random()}
            entityManager.createEntityFromComponentWithProperties(enemyComponent,chushiCoor)
        }
    }

}
