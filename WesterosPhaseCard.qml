import QtQuick 2.0
import QtQuick.Layouts 1.1
Item
{
    id: root
    property bool wilding: false
    property string name
    property string description
    property string source

    property real nameFontSize: 24
    property real descriptionFontSize: 18
    signal cardChoisen(string name)

    property alias descriptionObj: descriptionText
    property alias mouseArea: marea

    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.preferredHeight: parent.height/parent.children.length

    MouseArea
    {
        id: marea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: root.cardChoisen(root.name)
        onEntered:
        {
            descriptionObj.visible = true
            root.Layout.preferredHeight = root.parent.height/root.parent.children.length + descriptionObj.contentHeight
        }
        onExited:
        {
            descriptionObj.visible = false
            root.Layout.preferredHeight = root.parent.height/root.parent.children.length
        }
    }

    Rectangle
    {
        anchors.fill: parent
        color: "firebrick"
        border.width: 2
        border.color: "darkred"
        Item
        {
            id: imageBlock
            width: Math.min(parent.width/4, parent.height)
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Image
            {
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height)
                height: width
                source: root.source
            }
        }
        Item
        {
            id: textBlock
            anchors.left: imageBlock.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            Text
            {
                id: nameText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                text: root.name
                wrapMode: Text.WordWrap
                font.pointSize: root.nameFontSize
            }
            Text
            {
                id: descriptionText
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: nameText.bottom
                text: root.description
                wrapMode: Text.WordWrap
                font.pointSize: root.nameFontSize
                visible: false
            }
        }


    }

}
