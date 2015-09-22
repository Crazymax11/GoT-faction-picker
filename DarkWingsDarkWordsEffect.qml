import QtQuick 2.0

WesterosCardEffect {
    id: root
    name: "Чёрные крылья, чёрные слова"
    description: "Владелец Посыльного ворона приказывает всем Домам либо а) вступить в борьбу за влияние, либо б) собрать жетоны власти со всех подвластных земель со знаками короны, либо в) расслабляться, так как ничего не происходит."
    signal clashOfKings()
    signal gameOfThrones()
    signal lastDaysOfSummer()
    Item
    {
        id: contentBlock
        anchors.top: descrObj.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Item
        {
            id: calshOfKings
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.clashOfKings()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/ClashofKings.png"
            }
        }
        Item
        {
            id: gameOfThrones
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.gameOfThrones()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/GameofThrones.png"
            }
        }
        Item
        {
            id: lastDaysOfSummer
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.lastDaysOfSummer()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/LastDaysofSummer.png"
            }
        }
    }
}
