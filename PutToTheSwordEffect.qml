import QtQuick 2.0

WesterosCardEffect {
    id: root
    name: "Преданы мечу"
    description: "Владелец Валирийского меча выбирает одно из условий для этой фазы замыслов: а) не отдаются приказы обороны, б) не отдаются приказы похода +1 или в) ограничений нет."
    signal stormOfSwords()
    signal rainsOfAutumn()
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
            id: stormOfSwords
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.stormOfSwords()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/StormofSwords.png"
            }
        }
        Item
        {
            id: rainsOfAutumn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            width: Math.min(parent.width/4, parent.height)
            height: width
            MouseArea
            {
                anchors.fill: parent
                onClicked: root.rainsOfAutumn()
            }
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/westerosCards/RainsofAutumn.png"
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
