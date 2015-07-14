import QtQuick 2.0

Item {
    InfluenceTrack
    {
        id: ravenTrack
        width: parent.width
        height: parent.height / 5
        y: parent.height * 2/5
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
        height: parent.height / 5
        y: parent.height * 3/5
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
        height: parent.height / 5
        y: parent.height * 4/5
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
