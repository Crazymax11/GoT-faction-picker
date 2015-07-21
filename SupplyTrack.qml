import QtQuick 2.0

Item
{
    id: mainItem
    width: 10
    height: 20
    property real factionTokenSize: width/7/3
    SupplyTrackPosition
    {
        id: nullSupply
        width: parent.width* 1/7
        height: parent.height
        backgroudColor: "orange"
        count: "0"
        armies: ["2", "2"]
    }
    SupplyTrackPosition
    {
        id: oneSupply
        width: parent.width* 1/7
        height: parent.height
        x: nullSupply.x + nullSupply.width
        backgroudColor: "darkorange"
        count: "1"
        armies: ["3", "2"]
        Component.onCompleted: ph.putToken(stark)
    }
    SupplyTrackPosition
    {
        id: twoSupply
        width: parent.width* 1/7
        height: parent.height
        x: oneSupply.x + oneSupply.width
        backgroudColor: "orange"
        count: "2"
        armies: ["3", "2", "2"]
        Component.onCompleted:
        {
            ph.putToken(tyrell)
            ph.putToken(lannister)
            ph.putToken(greyjoy)
            ph.putToken(baratheon)
            ph.putToken(martell)
        }
    }
    SupplyTrackPosition
    {
        id: threeSupply
        width: parent.width* 1/7
        height: parent.height
        x: twoSupply.x + twoSupply.width
        backgroudColor: "darkorange"
        count: "3"
        armies: ["3", "2", "2", "2"]
    }
    SupplyTrackPosition
    {
        id: fourSupply
        width: parent.width* 1/7
        height: parent.height
        x: threeSupply.x + threeSupply.width
        backgroudColor: "orange"
        count: "4"
        armies: ["3", "3", "2", "2"]

    }
    SupplyTrackPosition
    {
        id: fiveSupply
        width: parent.width* 1/7
        height: parent.height
        x: fourSupply.x + fourSupply.width
        backgroudColor: "darkorange"
        count: "5"
        armies: ["4", "3", "2", "2"]
    }
    SupplyTrackPosition
    {
        id: sixSupply
        width: parent.width* 1/7
        height: parent.height
        x: fiveSupply.x + fiveSupply.width
        backgroudColor: "orange"
        count: "6"
        armies: ["4", "3", "2", "2", "2"]
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
