import QtQuick 2.0

Item
{
    property real factionTokenWidth: 80
    SmartPlaceholder
    {
        id: ph
        x: parent.width * 0.1
        width: parent.width * 0.3
        y: parent.height * 0.5
        height: parent.height * 0.45
        Rectangle
        {
            anchors.fill: parent
            color: "blue"
        }
    }

    SmartPlaceholder
    {
        id: ph2
        x: parent.width * 0.6
        width: parent.width * 0.3
        y: parent.height * 0.5
        height: parent.height * 0.45
        Rectangle
        {
            anchors.fill: parent
            color: "red"
        }
    }

    //Factions Tokens
    SmartToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "Stark"
        tokenWidth: factionTokenWidth
        x: 50
    }
    SmartToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "Baratheon"
        tokenWidth: factionTokenWidth
    }
    SmartToken
    {
        id: greyjoy
        source: "qrc:/images/greyJoy.png"
        name: "GreyJoy"
        tokenWidth: factionTokenWidth
    }
    SmartToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "Tyrell"
        tokenWidth: factionTokenWidth
    }
    SmartToken
    {
        id: lannister
        source: "qrc:/images/lannister.png"
        name: "Lannister"
        tokenWidth: factionTokenWidth
    }
    SmartToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "Martell"
        tokenWidth: factionTokenWidth
    }
}
