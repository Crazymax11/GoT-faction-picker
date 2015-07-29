import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: mainWindow
    width: 1024
    height: 768
    title: qsTr("Game Of Thrones boardgame assister")
    visible: true
    Item
    {
        id: leftColumn
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width * 0.28
        Item
        {
            id: roundBlock
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.23
            Rectangle
            {
                anchors.fill: parent
                color: "#915F19"
            }

            ColumnLayout
            {
                anchors.centerIn: parent
                width: parent.width * 0.9
                height: parent.height * 0.8
                Item
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Text
                    {
                        height: parent.height
                        width: parent.width
                        text: "- Round 1 -"
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
                    Rectangle
                    {
                        color: "#29A5E3"
                        anchors.fill: parent
                        Text
                        {
                            height: parent.height
                            width: parent.width
                            text: "Next Round"
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
        Item
        {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: roundBlock.bottom
            ColumnLayout
            {
                anchors.fill: parent
                spacing: 0
                id: statusTrack
                StatusPosition
                {
                    source: "qrc:/images/greyJoy.png"
                    name: "greyJoy"
                    castles: 5
                    supplies: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                StatusPosition
                {
                    source: "qrc:/images/stark.png"
                    name: "stark"
                    castles: 7
                    supplies: 5
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                StatusPosition
                {
                    source: "qrc:/images/lannister.png"
                    name: "lannister"
                    castles: 6
                    supplies: 3
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                StatusPosition
                {
                    source: "qrc:/images/martell.png"
                    name: "martell"
                    castles: 4
                    supplies: 4
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                StatusPosition
                {
                    source: "qrc:/images/baratheon.png"
                    name: "baratheon"
                    castles: 1
                    supplies: 2
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                StatusPosition
                {
                    source: "qrc:/images/Tyrell.png"
                    name: "Tyrell"
                    castles: 0
                    supplies: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
    Item
    {
        id: rightColumn
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: parent.width * 0.3
        RowLayout
        {
            anchors.fill: parent
            spacing: 0

            InfluenceTrack
            {
                id: ravenTrack
                Layout.fillWidth: true
                Layout.fillHeight: true
                imageSrc: "qrc:/images/raven.png"
                order: [
                    "Lannister",
                    "Stark",
                    "Martell",
                    "Baratheon",
                    "Tyrell",
                    "GreyJoy"
                ]
            }
            InfluenceTrack
            {
                Layout.fillWidth: true
                Layout.fillHeight: true
                imageSrc: "qrc:/images/sword.png"
                order: [
                    "GreyJoy",
                    "Tyrell",
                    "Martell",
                    "Stark",
                    "Baratheon",
                    "Lannister"
                ]
            }
            InfluenceTrack
            {
                Layout.fillWidth: true
                Layout.fillHeight: true
                imageSrc: "qrc:/images/throne.png"
                order: [
                    "Baratheon",
                    "Lannister",
                    "Stark",
                    "Martell",
                    "GreyJoy",
                    "Tyrell"
                ]
            }
        }
    }
    Item
    {
        id: contentBlock
        anchors.left: leftColumn.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: rightColumn.left
        Image
        {
            anchors.fill: parent
            source: "qrc:/images/background.png"
        }
    }
}
