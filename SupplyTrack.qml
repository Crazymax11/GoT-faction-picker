import QtQuick 2.0

Item
{
    id: mainItem
    width: 10
    height: 20
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
}
