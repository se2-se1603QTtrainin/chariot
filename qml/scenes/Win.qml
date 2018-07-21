import QtQuick 2.0
import VPlay 2.0
import "../common"
import "../entities"

//游戏胜利界面
SceneBase {
    id: gameWin
    signal backPressed

    Image {
        id: gameWin1
        anchors.fill: parent
        source: "../../assets/win.png"
    }
    MenuButton {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "YOU WIN"
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
