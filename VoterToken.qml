import QtQuick 2.3

Item
{
    id: root
    property bool checked: false
    property string name
    property string source
    property bool borderVisible: false
    signal clicked()
    Image
    {
        anchors.centerIn: parent
        width: Math.min(parent.width,parent.height)
        height: width
        antialiasing: false
        clip: false
        scale: 1
        fillMode: Image.PreserveAspectFit
        source: root.source
        MouseArea
        {
            id: marea
            anchors.fill: parent
            onClicked: root.clicked();
        }
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
}
