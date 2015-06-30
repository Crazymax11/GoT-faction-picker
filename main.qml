import QtQuick 2.3
import QtQuick.Controls 1.2



ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Fraction picker")

    FractionToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "stark"
    }
    FractionToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "baratheon"
    }
    FractionToken
    {
        id: greyJoy
        source: "qrc:/images/greyJoy.png"
        name: "greyJoy"
    }
    FractionToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "tyrell"
    }
    FractionToken
    {
        id: lanister
        source: "qrc:/images/lanister.png"
        name: "lanister"
    }
    FractionToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "martell"
    }
    Item
    {
        x: 200; y: 200
        id: boxItem
        width: 80
        height: width
        property var array: new Array()
        DropArea
        {
            anchors.fill: parent
            onEntered: box.source = "qrc:/images/opened.png"
            onExited: box.source = "qrc:/images/closed.png"
            onDropped:
            {
                drag.source.visible = false;
                boxItem.array.push(drag.source);
                box.source = "qrc:/images/closed.png";
            }
            Image
            {
                id: box
                source: "qrc:/images/closed.png"
                anchors.fill: parent
            }
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if (boxItem.array.length > 0)
                {
                    var Num = Math.floor(Math.random() * boxItem.array.length);
                    var fraction = boxItem.array[Num];
                    boxItem.array.splice(Num, 1);
                    fraction.x = parent.x - 60
                    fraction.y = parent.y - 60
                    fraction.visible = true
                }
            }
        }
    }
}
