import QtQuick 2.0

Item
{
    id: root
    width: 10
    height: 20
    property real factionTokenSize: width/8/3
    Rectangle
    {
        id: backgroundRect
        anchors.fill: parent
        color: "lightgrey"
        border.width: 3
        border.color: "darkgrey"
    }

    VictoryTrackPosition
    {
        id: nullCastle
        x: backgroundRect.border.width
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        count: "0"
    }
    VictoryTrackPosition
    {
        id: oneCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: nullCastle.x + nullCastle.width
        count: "1"
        Component.onCompleted:
        {
            ph.putToken(tyrell)
            ph.putToken(lannister)
            ph.putToken(greyjoy)
            ph.putToken(baratheon)
            ph.putToken(martell)
        }
    }
    VictoryTrackPosition
    {
        id: twoCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: oneCastle.x + oneCastle.width
        count: "2"
        Component.onCompleted: ph.putToken(stark)
    }
    VictoryTrackPosition
    {
        id: threeCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: twoCastle.x + twoCastle.width
        count: "3"
    }
    VictoryTrackPosition
    {
        id: fourCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: threeCastle.x + threeCastle.width
        count: "4"

    }
    VictoryTrackPosition
    {
        id: fiveCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: fourCastle.x + fourCastle.width
        count: "5"
    }
    VictoryTrackPosition
    {
        id: sixCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: fiveCastle.x + fiveCastle.width
        count: "6"
    }
    VictoryTrackPosition
    {
        id: sevenCastle
        y: backgroundRect.border.width
        width: (parent.width - backgroundRect.border.width*2) * 1/8
        height: parent.height - backgroundRect.border.width*2
        x: sixCastle.x + sixCastle.width
        castleColor: "#C0EFFF00"
        count: "7"
    }

    //tokens
    SmartToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "Stark"
        tokenWidth: factionTokenSize
    }
    SmartToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "Baratheon"
        tokenWidth: factionTokenSize
    }
    SmartToken
    {
        id: greyjoy
        source: "qrc:/images/greyJoy.png"
        name: "GreyJoy"
        tokenWidth: factionTokenSize
    }
    SmartToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "Tyrell"
        tokenWidth: factionTokenSize
    }
    SmartToken
    {
        id: lannister
        source: "qrc:/images/lannister.png"
        name: "Lannister"
        tokenWidth: factionTokenSize
    }
    SmartToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "Martell"
        tokenWidth: factionTokenSize
    }



}
