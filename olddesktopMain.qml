import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 768
    title: qsTr("Game Of Thrones boardgame assister")
    property var page
    Image
    {
        anchors.fill: parent
        source: "qrc:/images/background.png"
    }



    Rectangle
    {
        id: musicButton
        color: "cornflowerblue"
        border.width: 3
        border.color: "blue"
        z: 100
        width: parent.width/10
        height: parent.height/15
        Audio
        {
            id: audioBackground
            source: "qrc:/sounds/background.mp3"
            loops: Audio.Infinite
            volume: 0.5
            autoPlay: true
        }
        MouseArea
        {
            anchors.fill: parent
            property bool isAudioOn: true
            onClicked:
            {
                isAudioOn? audioBackground.pause() : audioBackground.play()
                isAudioOn = !isAudioOn
            }
            onIsAudioOnChanged:
            {
                isAudioOn? musicImage.source="qrc:/images/musicOn.png" : musicImage.source="qrc:/images/musicOff.png"
            }
        }

        Image
        {
            id: musicImage
            anchors.fill: parent
            source: "qrc:/images/musicOn.png"
        }
    }

    Item
    {
        id: wildingsAndTurn
        anchors.bottom:  tracks.top
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 5
        width: parent.width * 0.3
        Item
        {
            id: wildingTrack
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            height: parent.height /3
            Rectangle
            {
                anchors.fill: parent
                color: "darkblue"
                Text
                {
                    width: parent.width * 7/10
                    height: parent.height
                    anchors.centerIn: parent
                    text: "ЗДЕСЬ БУДЕТ ТРЕК ОДИЧАЛЫХ"
                    font.bold: true
                    fontSizeMode: Text.Fit
                    font.pixelSize: width
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
        }
        Item
        {
            id: wildingDeck
            anchors.top: wildingTrack.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height /3
            Rectangle
            {
                anchors.fill: parent
                color: "blue"
                Text
                {
                    width: parent.width * 7/10
                    height: parent.height
                    anchors.centerIn: parent
                    text: "ЗДЕСЬ БУДЕТ КОЛОДА ОДИЧАЛЫХ"
                    font.bold: true
                    fontSizeMode: Text.Fit
                    font.pixelSize: width
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
        }
        Turn
        {
            id: turn
            width: Math.min(parent.height/3, parent.width)
            height: width
            anchors.top: wildingDeck.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: parent.isActive
        }
    }
    Item
    {
        id: actionZone
        anchors.left: decks.right
        anchors.top: parent.top
        anchors.bottom: tracks.top
        anchors.right: wildingsAndTurn.left
        anchors.margins: 15
        Rectangle
        {
            anchors.fill: parent
            color: "transparent"
            border.width: 1
            border.color: "violet"
            Text
            {
                width: parent.width * 7/10
                height: parent.height
                anchors.centerIn: parent
                text: "ЗДЕСЬ БУДУТ СОБЫТИЯ (КАРТЫ, ПИК ДОМОВ, ГОЛОСОВАНИЕ, ОДИЧАЛЫЕ) А ТАКЖЕ ПОМОЩЬ ПО ИГРЕ (ПРАВИЛА, ПРИКАЗЫ)"
                font.bold: true
                fontSizeMode: Text.Fit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
            }
        }
    }

    Item
    {
        id: decks
        anchors.left: parent.left
        anchors.top: musicButton.bottom
        anchors.bottom: tracks.top
        width: parent.width * 0.2
        anchors.margins: 10
        EventsDeck
        {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 2
            isClickable: false
            height: parent.height/3
            id: first
            imSrc: "qrc:/images/1stevent.png"
        }
        EventsDeck
        {
            anchors.top: first.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 2
            isClickable: false
            height: parent.height/3
            id: second
            imSrc: "qrc:/images/2ndevent.png"
        }
        EventsDeck
        {
            anchors.top: second.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 2
            isClickable: false
            height: parent.height/3
            id: third
            imSrc: "qrc:/images/thirdevent.png"
        }
    }

    Item
    {
        id: tracks
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.4
        Item
        {
            id: influenceTracks
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            width: parent.width * 0.6
            InfluenceTrack
            {
                id: throneTrack
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: parent.height /3
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
            InfluenceTrack
            {
                id: swordTrack
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: throneTrack.bottom
                imageSrc: "qrc:/images/sword.png"
                height: parent.height /3
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
                id: ravenTrack
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: swordTrack.bottom
                height: parent.height /3
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
        }
        Item
        {
            id: victoryTracks
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.width * 0.4
            SupplyTrack
            {
                id: supplyTrack
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                height: parent.height - victoryTrack.height
            }
            VictoryTrack
            {
                id: victoryTrack
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                twoRows: true
            }

        }
    }
}
