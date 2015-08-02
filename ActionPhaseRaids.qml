import QtQuick 2.0

Item
{
    id: root
    Text
    {
        id: title
        text: "Исполняются приказы набега!"
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
            source: "qrc:/images/Orders/1.png"
        }
    }
    Text
    {
        id: description
        text: "Исполните приказы набега. Приказы набега при исполнении убирают приказ поддержки, усиления власти или другой набег. Причем если набег убирает приказ усиления власти, хозяин приказа усиления власти теряет жетон власти, а игрок, исполнивший набег получает жетон власти. Улучшенный жетон набега также может сжигать приказы обороны. Внимание, приказ набега сжигает как обычные приказы, так и улучшенные. Приказы набега не работают с земли на моря, но работают с моря на землю."
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
