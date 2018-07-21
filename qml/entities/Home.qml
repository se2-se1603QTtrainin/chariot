import QtQuick 2.0
import VPlay 2.0
//家，当该类被子弹击中，游戏结束
EntityBase{
    id:home

    signal gameOver

    entityId: "homeId"
    entityType: "home"

    width: 50
    height: 50

    BoxCollider{
        id:boxCollider
        width: home.width
        height: home.height
        anchors.fill: blueChariotImage
        bodyType: Body.Static
//游戏结束，移除敌方坦克
        fixture.onBeginContact: {
            var collide = other.getBody().target
            if(collide.entityType === "bullet" || collide.entityType === "enemyBullet"){
 //               removeEntity()
                home.visible = false
                gameOver()
                bgMusic.stop()
                var toRemoveEntityTypes = ["chariotEnemy"];
                 entityManager.removeEntitiesByFilter(toRemoveEntityTypes);
            }
        }

    }

    Image {
        id: blueChariotImage
        source: "../../assets/home.png"
        rotation: 180
        width: boxCollider.width
        height: boxCollider.height
        anchors.fill: boxCollider
    }

}
