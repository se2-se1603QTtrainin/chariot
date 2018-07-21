import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"

//游戏结束场景
SceneBase {
    id: gameOver
    signal backPressed

    Image {
        id: gameOver1
        anchors.fill: parent
        source: "../../assets/gameover.png"
    }
    MenuButton {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "返回主菜单"
        onClicked: {
            backPressed()
            gameScene.gameReset()
            gameScene.chariotEnemyReset()
        }
        Image {
            id: buttonbg3
            source: "../../assets/buttonbg.png"
            anchors.fill: parent
            opacity: 0.3
        }
    }
}
