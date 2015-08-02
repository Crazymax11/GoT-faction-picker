import QtQuick 2.0

Item
{
    id: root
    Text
    {
        id: title
        text: "Исполняются приказы усиления власти!"
        wrapMode: Text.WordWrap
        font.pointSize: 24
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        verticalAlignment: Text.AlignVCenter
    }
    Item
    {
        id: imitem
        width: parent.width
        height: width
        anchors.top: title.bottom
        Image
        {
            anchors.centerIn: parent
            width: parent.width/2
            height: width
            source: "qrc:/images/Orders/2.png"
        }
    }
    Text
    {
        id: description
        text: "Исполните приказы усиления власти. Приказ усиления власти в порту дает 1 жетон власти, приказ в море не имеет эффекта, приказ усиления власти в наземных областях дает 1 жетон власти + еще 1 за каждую корону в области. Особый приказ усиления власти позволяет собирать войска в замках и крепостях взамен получения жетонов влияния. В замке собирается армия с одним очком сбора войск, в крепости собирается армия с двумя очками сбора войск. Если локация, в которой проводится сбор войск граничит с морем, а море не занятно вражескими судами, то можно проводить сбор кораблей в этом море. При сборе войск сверяйтесь с собственным снабжением. Также при наборе войск можно улучшить пешего война либо до рыцаря либо до осадной башни за 1 очко сбора, однако нельзя улучшить рыцаря до башни и наоборот."
        wrapMode: Text.WordWrap
        font.pointSize: 24
        fontSizeMode: Text.Fit
        anchors.top: imitem.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        verticalAlignment: Text.AlignVCenter
    }
}
