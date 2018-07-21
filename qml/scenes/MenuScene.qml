import QtQuick 2.0
import VPlay 2.0
import "../common"

//菜单界面
SceneBase {
    id: startScene
    signal gameScenepressed

    Rectangle{
        anchors.fill: parent
        color: "white"
    }
    MenuButton {
        Image {
            id: buttonbg1
            source: "../../assets/buttonbg.png"
            anchors.fill: parent
            opacity: 0.5
        }
        anchors.bottom: startScene.bottom
        anchors.left: startScene.left
        anchors.leftMargin: 50
        text: "单人游戏"
        onClicked: {
            bgMusic.play()
            gameScenepressed()
        }
    }
    MenuButton {
        Image {
            id: buttonbg2
            source: "../../assets/buttonbg.png"
            anchors.fill: parent
            opacity: 0.5
        }
        anchors.bottom: startScene.bottom
        anchors.right: startScene.right
        anchors.rightMargin: 50
        text: "双人游戏"
    }

    Image {
        id: bg
        source: "../../assets/bg.png"
        anchors.centerIn: parent
    }
}
