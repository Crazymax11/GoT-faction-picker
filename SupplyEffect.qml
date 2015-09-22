import QtQuick 2.0

WesterosCardEffect
{
    id: root
    name: "Снабжение"
    property alias suptr: track
    description: "Пересчитайте снабжение и сократите отряды, если ваши армии не проходят снабжение."
    Item
    {

        anchors.top: descrObj.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        SupplyTrack
        {
            id: track
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height)
            height: width/7 * (10/4)
        }
    }
}
