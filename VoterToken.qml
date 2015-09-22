import QtQuick 2.3

InfluenceFactionToken
{
    id: root
    property bool checked: false
    property bool borderVisible: false
    signal clicked()
    Rectangle
    {
        id: redborder
        color: "transparent";
        anchors.fill: parent
        border.width: 3
        border.color: "red"
        visible: root.borderVisible
    }
    Image
    {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width/2
        height: width
        source:"qrc:/images/System/check.png"
        visible: root.checked
    }
}
