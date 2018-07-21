import QtQuick 2.0
import VPlay 2.0

//不可破坏的墙
EntityBase{
   id:crystalWall

   entityId: "crystalWallId"
   entityType: "crystalWall"
   height: 25
   width: 50
   BoxCollider{
       id:boxCollider
       width: crystalWall.width
       height: crystalWall.height
       anchors.fill: crystalWallImage

       bodyType: Body.Static

   }

   Image {
       id: crystalWallImage
       source: "../../assets/CrystalWall2.png"
       width: boxCollider.width
       height: boxCollider.height
       anchors.fill: parent
   }
}
