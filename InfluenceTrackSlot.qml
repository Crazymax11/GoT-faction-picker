import QtQuick 2.0

Item
{
    id: slot
    x: 0
    width: 0
    height: 0
    property var house: "undefined"
    property color circleColor
    property string circleText
    signal catched (var token)
    Rectangle
    {
        color: parent.circleColor
        width: Math.min(parent.width, parent.height)
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
        DropArea
        {
            id: dropArea
            anchors.fill: parent
            onDropped: catched(drag.source)
        }
    }

}
