import QtQuick 2.0
import QtQuick.Layouts 1.1
Item
{
    id: root
    property real factionTokenBlockWidth: width * 0.3
    property string source
    property string name
    property real castles
    property real supplies
    Rectangle
    {
        anchors.fill: parent
        color: "#856D20"
    }

    Item
    {
        id: factionTokenBlock
        height: parent.height
        width: root.factionTokenBlockWidth
        Image
        {
            anchors.centerIn: parent
            width: Math.min(parent.height,parent.width)
            height: width
            source: root.source
        }
    }
    Item
    {
        anchors.right: parent.right
        anchors.left: factionTokenBlock.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        ColumnLayout
        {
            anchors.fill: parent
            Text
            {
                Layout.maximumHeight: parent.height * 0.3
                Layout.fillWidth: true
                text: root.name
                font.bold: true
                fontSizeMode: Text.Fit
                font.pixelSize: height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            RowLayout
            {
                Layout.fillWidth: true
                Layout.fillHeight: true
                //supply and zamki
                Item
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Item
                    {
                        width: parent.width/2
                        height: parent.height
                        Image
                        {
                            anchors.centerIn: parent
                            width: Math.min(parent.height,parent.width)
                            height: width
                            source: "qrc:/images/westerosCards/Mustering.png"
                        }
                    }
                    Text
                    {
                        x: parent.width/2
                        width: parent.width/2
                        height: parent.height
                        text: "x"+ root.castles
                        font.bold: true
                        fontSizeMode: Text.Fit
                        font.pixelSize: height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                }
                Item
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Item
                    {
                        width: parent.width/2
                        height: parent.height
                        Image
                        {
                            anchors.centerIn: parent
                            width: Math.min(parent.height,parent.width)
                            height: width
                            source: "qrc:/images/westerosCards/Supply.png"
                        }
                    }
                    Text
                    {
                        x: parent.width/2
                        width: parent.width/2
                        height: parent.height
                        text: "x"+ root.supplies
                        font.bold: true
                        fontSizeMode: Text.Fit
                        font.pixelSize: height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                }
            }
        }
    }
}
