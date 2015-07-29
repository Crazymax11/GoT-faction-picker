import QtQuick 2.0

Item
{
    id: root
    property int count: 0
    property string name
    onNameChanged:
    {
    }

    Image
    {
        id: house
        source : "qrc:/images/" + root.name + ".png"
    }

    Rectangle
    {
        id: plusOne
        MouseArea
        {

        }
    }
}
