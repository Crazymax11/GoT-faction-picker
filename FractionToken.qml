import QtQuick 2.3

Item
{
    id: defId
    property string name: "default"
    property string source: "default-image.png"
    width: 80
    height: width
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
        onReleased:
        {
            parent.Drag.drop()
        }
    }
}
