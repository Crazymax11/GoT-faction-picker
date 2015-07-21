import QtQuick 2.0

Item {

    VictoryTrack
    {
        id: victoryTrack
        width: parent.width
        height: width/8
        anchors.bottom: supplyTrack.top
    }
    SupplyTrack
    {
        id: supplyTrack
        width: parent.width
        height: parent.height / 6
        y: parent.height * 2/6
        x: 0
    }

    InfluenceTrack
    {
        id: ravenTrack
        width: parent.width
        height: parent.height / 6
        y: parent.height * 3/6
        x: 0
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
        width: parent.width
        height: parent.height / 6
        y: parent.height * 4/6
        x: 0
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
        width: parent.width
        height: parent.height / 6
        y: parent.height * 5/6
        x: 0
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
