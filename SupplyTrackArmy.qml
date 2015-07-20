import QtQuick 2.0

Item
{
    id: root
    x: parent.width * 0.1
    width: parent.width * 0.8
    height: parent.height * 1/6
    visible: false
    property string count
    Rectangle
    {
        anchors.fill: parent
        color: "crimson"
        Text
        {
            width: parent.width * 7/10
            height: parent.height
            anchors.centerIn: parent
            text: root.count
            fontSizeMode: Text.VerticalFit
            font.pixelSize: width
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
