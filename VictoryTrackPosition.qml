import QtQuick 2.0
import QtGraphicalEffects 1.0
Item
{
    id: root
    property color castleColor: "#80989A89"
    property string count: "0"

    property alias ph: placeholder
    SmartPlaceholder
    {
        id: placeholder
        anchors.fill: parent
        positionBase: root
    }
    Rectangle
    {
        anchors.fill: root
        width: Math.min(root.width, root.height)
        border.width: 5
        border.color: castleColor
        color: "transparent"
        radius: width/2
        Item
        {
            id: castle
            y: parent.height * 0.3
            height: parent.height * 0.7
            width: parent.width
            Image
            {
                id: castleImage
                anchors.fill: parent
                source: "qrc:/images/tracks/castle.png"
            }
            ColorOverlay {
                anchors.fill: castleImage
                source: castleImage
                color: castleColor
            }
        }
        Item
        {
            id: countItem
            y: parent.height * 0.05
            height: parent.height * 0.25
            width: parent.width
            Text
            {
                width: parent.width * 7/10
                height: parent.height
                anchors.centerIn: parent
                text: root.count
                font.bold: true
                fontSizeMode: Text.VerticalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
                color: castleColor
            }
        }
    }

}
