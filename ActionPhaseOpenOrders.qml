import QtQuick 2.0

Item
{
    id: root
    Text
    {
        id: title
        text: "Откройте свои намерения! Переверните жетоны приказов лицевой стороной вверх!"
        wrapMode: Text.WordWrap
        font.pointSize: 24
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        verticalAlignment: Text.AlignVCenter
    }
    Item
    {
        id: ravenBlock
        anchors.top: title.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Text
        {
            id: ravenText
            text: "Владелец посыльного ворона вправе либо а) поменять 1 свои приказ на карте на 1 приказ из невыставленных, либо б) посмотреть за стену (в этом случае владелец посыльного ворона смотрит верхнюю карту колоды одичалых). В случае если владелец посыльного ворона воспользовался своей возможностью, он переворачивает ворона"
            wrapMode: Text.WordWrap
            font.pointSize: 20
            fontSizeMode: Text.Fit
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: raven.top
            verticalAlignment: Text.AlignVCenter
        }
        Item
        {
            id: raven
            height: width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Image
            {
                anchors.centerIn: parent
                width: parent.width/2
                height: width
                source: "qrc:/images/raven.png"
                MouseArea
                {
                    anchors.fill: parent
                }
            }
        }
    }
}
