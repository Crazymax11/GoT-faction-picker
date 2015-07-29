import QtQuick 2.0

Rectangle
{
    id: root
    property string source
    property string name
    property real castles
    property real supplies
    color: "#915F19"
    FactionStatus
    {
        source: root.source
        name: root.name
        castles: root.castles
        supplies: root.supplies
        anchors.fill: parent
        anchors.margins: root.height/15
    }
    onCastlesChanged:
    {
        switch (castles)
        {
        case 0:
            root.color = "#915F19"
            break;
        case 1:
            root.color = "#915F19"
            break;
        case 2:
            root.color = "#915F19"
            break;
        case 3:
            root.color = "#915F19"
            break;
        case 4:
            root.color = "#915F19"
            break;
        case 5:
            root.color = "#C98422"
            break;
        case 6:
            root.color = "#ED9B28"
            break;
        case 7:
            root.color = "#FFA72B"
            break;
        default:
            root.color = "#915F19"
            break;
        }
    }


}
