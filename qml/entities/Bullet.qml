import QtQuick 2.0
import VPlay 2.0
//实体子弹
EntityBase{
    id: bullet

    readonly property alias bulletVelocity: boxCollider.linearVelocity
    readonly property alias bullelActive: boxCollider.active
    property alias myBulletType : bullet.entityType

    entityId: "bulletId"

    height: 8
    width: 6


    BoxCollider{
        id:boxCollider
        width: bullet.width
        height: bullet.heigh
        anchors.fill: bulletImage
        active: true

        //当和任意实体碰撞，隐藏自己
        fixture.onBeginContact: {
            //console.log("remove")
            //removeEntity()
            bullet.visible = false
        }
    }

    Image {
        id: bulletImage
        source: "../../assets/rocket_green_small.png"
        anchors.fill: parent
        width: bullet.width
        height: bullet.height
    }

}
