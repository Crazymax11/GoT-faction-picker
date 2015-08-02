import QtQuick 2.0

Item
{
    id: root
    function getCastles()
    {
        return track.getStatus()
    }

    signal updateCastles(string name, real count)
    Text
    {
        id: title
        text: "Подсчет замков!"
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
        height: width/2
        anchors.top: title.bottom
        Image
        {
            anchors.centerIn: parent
            width: parent.width/2
            height: width
            source: "qrc:/images/tracks/castle.png"
        }
    }
    Text
    {
        id: description
        text: "Подсчитайте количество замков у каждого игрока и поместите жетон на нужную позицию. Затем нажмите Далее"
        wrapMode: Text.WordWrap
        font.pointSize: 24
        fontSizeMode: Text.Fit
        anchors.top: imitem.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: track.top
        verticalAlignment: Text.AlignVCenter
    }
    VictoryTrack
    {
        id: track
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        twoRows: true
    }
}

