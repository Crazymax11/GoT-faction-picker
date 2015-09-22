import QtQuick 2.0

Item
{
    id: root
    property string name
    property alias titleObj: title
    property alias descrObj: descriptionText
    property string description: ""

    Text
    {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        font.pointSize: 14
        text: root.name
    }
    Text
    {
        id: descriptionText
        anchors.top: titleObj.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        font.pointSize: 14
        text: description
        wrapMode: Text.WordWrap
    }
}
