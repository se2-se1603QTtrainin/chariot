import QtQuick 2.0
import VPlay 2.0

//边框墙，防止坦克跑出游戏场景
EntityBase{
   id:wall
   entityId: "WallId"
   entityType: "Wall"
   height: 0.1
   width: 0.1

   Rectangle{
       id:rectangle
       color:"black"
       anchors.fill: parent
   }

   BoxCollider{
       id:boxCollider
       width: wall.width
       height: wall.height
       anchors.fill: rectangle

       bodyType: Body.Static

   }

}


