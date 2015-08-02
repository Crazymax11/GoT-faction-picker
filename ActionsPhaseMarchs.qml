import QtQuick 2.0

Item
{
    id: root
    Text
    {
        id: title
        text: "Исполняются приказы похода!"
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
            source: "qrc:/images/Orders/3.png"
        }
    }
    Text
    {
        id: description
        text: "Исполните приказы похода. Приказы набега позволяют армии перемещаться по карте. Армии могут перемещаться в соседние локации и в локации, путь до которых возможен по морю (ваши флоты выполняют роль моста). Приказом похода можно разделить армию. Приказом похода можно отправить разные части армии в разные локации, не нарушив при этом предела снабжения и число столкновений с армиями других игроков не превышает 1. Похода с моря на землю не работает, с земли на море тоже. Наземные войска могут находится только на земле!"
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
