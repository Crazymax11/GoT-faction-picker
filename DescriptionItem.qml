import QtQuick 2.0
import QtQuick.Layouts 1.1
Item
{
    id: root
    property string source
    property string description
    property string additionalDescription

    Layout.minimumWidth: 100
    Layout.minimumHeight: 100
    state: "shorted"


    states:
        [
            State
            {
                name: "detailed"
                PropertyChanges
                {
                    target: image
                    width: Math.min(root.height, root.width)
                    height: width
                    opacity: 0.3
                }
                AnchorChanges
                {
                    target: image
                    anchors.horizontalCenter: root.horizontalCenter
                    anchors.verticalCenter: root.verticalCenter
                }

                PropertyChanges
                {
                    target: text
                    text: description + additionalDescription
                }
                AnchorChanges
                {
                    target: text
                    anchors.left: root.left
                }

                PropertyChanges
                {
                    target: root
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.4
                }
            },
            State
            {
                name: "shorted"
                PropertyChanges
                {
                    target: image
                    width: Math.min(root.width/3, root.height)
                }
                AnchorChanges
                {
                    target: image
                    anchors.left: root.left
                    anchors.top: root.top
                }
                PropertyChanges
                {
                    target: text
                    text: root.description
                }
                AnchorChanges
                {
                    target: text
                    anchors.left: image.right
                }

                PropertyChanges
                {
                    target: root
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        ]
    transitions:
        [
            Transition
            {
                PropertyAnimation { properties: "x,y,width,height,Layout.preferredWidth,Layout.preferredHeight"; duration: 1000; easing.type: Easing.InOutQuad }
                AnchorAnimation { duration: 1000; targets: [root, image] }
            }
        ]
    Image
    {
        id: image
        source: root.source
        height:width
    }

    Text
    {
        id: text
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        font.bold: true
        fontSizeMode: Text.Fit
        font.pixelSize: height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {

            if (root.state === "shorted")
            {
                root.state = "detailed"
                text.text = description + additionalDescription
            }
            else
            {
                root.state = "shorted"
                text.text = description
            }
        }
    }
    Rectangle
    {
        anchors.fill: parent
        color: "transparent"
        border.width: 2
        border.color: "black"
    }
}
