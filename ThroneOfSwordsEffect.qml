import QtQuick 2.0

WesterosCardEffect {
    id: root
    name: "Трон из клинков"
    description: "Владелец Железного трона приказывает всем Домам либо а) изменить снабжение и состав войск, либо б) собрать войска, либо в) отдыхать, так как ничего не происходит."
    signal supply()
    signal mustering()
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
            id: supply
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.supply()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/Supply.png"
            }
        }
        Item
        {
            id: mustering
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.mustering()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/Mustering.png"
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
