import QtQuick 2.0

Item
{
    id: slot
    property var house: "undefined"
    property color circleColor
    property string circleText
    signal catched (var token)
    DropArea
    {
        id: dropArea
        anchors.fill: slot
//        width: Math.min(slot.width, slot.height)
//        height: Math.min(slot.width, slot.height)
        onDropped: catched(drag.source)
        onWidthChanged: console.log("drop area width " + width)
        onHeightChanged: console.log("drop area height " + height)
    }
    Rectangle
    {
        id: rect
        color: parent.circleColor
        width: Math.min(slot.width, slot.height)
        height: width
        anchors.centerIn: parent
        radius: width/2
        Text
        {
            width: parent.width * 7/10
            anchors.centerIn: parent
            text: circleText
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: width
            horizontalAlignment: Text.AlignHCenter
        }

    }

}
