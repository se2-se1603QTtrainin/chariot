import QtQuick 2.0
import VPlay 2.0

EntityBase{
    id:chariotBlue
    entityId: "chariotBlueId"
    entityType: "chariotBlue"

        property  alias chariotX: chariotBlue.x
        property alias chariotY: chariotBlue.y
        property alias imageRotation: blueChariotImage.rotation
    property alias velocity: boxCollider.linearVelocity

    width: 45
    height: 45

    BoxCollider{
        id:boxCollider
        width: chariotBlue.width
        height: chariotBlue.height
        anchors.fill: blueChariotImage
        //bodyType: Body.Static
    }

    Image {
        id: blueChariotImage
        source: "../../assets/car_blue.png"
        width: boxCollider.width
        height: boxCollider.height
        anchors.fill: boxCollider
    }

}
