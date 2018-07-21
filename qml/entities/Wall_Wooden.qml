import QtQuick 2.0
import VPlay 2.0

//木墙，可摧毁
EntityBase{
   id:woodenWall
   entityId: "woodenWallId"
   entityType: "woodenWall"
   height: 25
   width: 50
   BoxCollider{
       id:boxCollider
       width: woodenWall.width
       height: woodenWall.height
       anchors.fill: parent
       bodyType: Body.Static
       fixture.onBeginContact: {
           var collide = other.getBody().target
           if(collide.entityType === "bullet" || collide.entityType === "enemyBullet"){
//               removeEntity()
               woodenWall.visible = false
           }
       }
   }

   Image {
       id: woodenWallImage
       source: "../../assets/woodenWall.png"
       width: boxCollider.width
       height: boxCollider.height
       anchors.fill: parent
   }
}
