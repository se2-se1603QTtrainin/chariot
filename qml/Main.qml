import VPlay 2.0
import QtQuick 2.0
import "scenes"
import "entities"
import "common"


GameWindow {
    id: gameWindow
    width: 800
    height: 675

    //实体创建管理
    EntityManager{
        id:entityManager
        entityContainer: gameScene
    }


    Rectangle {
        id: backGround
        color: "white"
        anchors.left: gameScene.right
        anchors.bottom: gameScene.bottom
        anchors.fill: parent
    }
    MenuScene {
        id: menuScene
        onGameScenepressed: gameWindow.state = "gaming"
    }

    GameScene {
        id: gameScene
        sceneAlignmentX: "left"
        sceneAlignmentY: "bottom"
        onBackMenuPressed: gameWindow.state = "menuScene"
    }

    GameOver{
        id: gameOver
        onBackPressed: {
            gameWindow.state = "menuScene"
        }
        anchors.fill: parent
    }
    Win {
        id:gameWin
        onBackPressed:  {
            gameWindow.state = "menuScene"
        }
    }

    //游戏状态
    state: "menuScene"
    states: [
        State {
            name: "menuScene"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: gameScene
            }
        },
        State {
            name: "gaming"
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },
        State{
            name: "gaming2"
            PropertyChanges{
                target: gameScene2
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },

        State {
            name: "gameOver"
            PropertyChanges {
                target: gameOver
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        },
        State {
            name: "gameWin"
            PropertyChanges {
                target: gameWin
                opacity: 1
            }
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
        }

    ]

    //背景音乐
    BackgroundMusic{
        id:bgMusic
        autoPlay: false
        volume: 0.3
        source: "../assets/snd/bgMusicShort.mp3"
    }
    SoundEffectVPlay{
        id:destory
        source: "../assets/snd/sfx_hit.wav"
    }
    SoundEffectVPlay{
        id:launch
        source: "../assets/snd/sfx_point.wav"
    }
}
