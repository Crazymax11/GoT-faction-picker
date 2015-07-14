import QtQuick 2.3

Item
{
    id: defId
    property string name: "default"
    property string source: "default-image.png"
    property var placeholder
    property string motto: "default"

    width: 80
    height: width
    z: 10
    Drag.hotSpot.x: width/2
    Drag.hotSpot.y: height/2
    Drag.active: dragArea.drag.active

    Image
    {
        source: parent.source
        anchors.fill: parent
    }
    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: parent
        drag.minimumY: 0
        drag.maximumY: parent.parent.height - parent.height
        drag.minimumX: 0
        drag.maximumX: parent.parent.width - parent.width
        onReleased:
        {
            var newx = defId.x
            var newy = defId.y
            defId.x = newx
            defId.y = newy
            parent.Drag.drop()
        }
    }
}
