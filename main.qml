import QtQuick 2.3
import QtQuick.Controls 1.2



ApplicationWindow {
    id: mainWindow
    visible: true
    width: 480
    height: 640
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
    //place holders
    Item
    {
        id: placeHolder1
        x: mainWindow.width * 1/2
        y: mainWindow.height * 1/10
    }
    Item
    {
        id: placeHolder2
        x: mainWindow.width * 3/4
        y: mainWindow.height * 3/10
    }
    Item
    {
        id: placeHolder3
        x: mainWindow.width * 3/4
        y: mainWindow.height * 7/10
    }
    Item
    {
        id: placeHolder4
        x: mainWindow.width * 2/4
        y: mainWindow.height * 9/10
    }
    Item
    {
        id: placeHolder5
        x: mainWindow.width * 1/4
        y: mainWindow.height * 7/10
    }
    Item
    {
        id: placeHolder6
        x: mainWindow.width * 1/4
        y: mainWindow.height * 3/10
    }


    //placeholder for animation
    Item
    {
        id: animationPlaceholder
        x: boxItem.x + boxItem.width/2
        y: boxItem.y + boxItem.height * 3/2
    }

    property var freeFractionPlaceholders : new Array()
    property var setedFractionPlaceholders : new Array()
    property var fractions: new Array()
    Component.onCompleted:
    {
        freeFractionPlaceholders.push(placeHolder1)
        freeFractionPlaceholders.push(placeHolder2)
        freeFractionPlaceholders.push(placeHolder3)
        freeFractionPlaceholders.push(placeHolder4)
        freeFractionPlaceholders.push(placeHolder5)
        freeFractionPlaceholders.push(placeHolder6)

        fractions.push(martell)
        fractions.push(lanister)
        fractions.push(stark)
        fractions.push(tyrell)
        fractions.push(greyJoy)
        fractions.push(baratheon)

        fractions.forEach(function(item, i, arr)
        {
            mainWindow.setFractionToken(fractions[i], freeFractionPlaceholders.pop())
        })


    }
    function setFractionToken(fraction, placeholder)
    {
        fraction.placeholder = placeholder
        fraction.x = placeholder.x - fraction.width/2;
        fraction.y = placeholder.y - fraction.height/2;


    }
    SequentialAnimation
    {
        id: choosenFractionAnimation
        property var tar
        PropertyAnimation
        {
            target: choosenFractionAnimation.tar
            properties: "scale"
            to: 3
            duration: 1000
        }
        PropertyAnimation
        {
            target: choosenFractionAnimation.tar
            properties: "scale"
            to: 1
            duration: 1000
        }
        ParallelAnimation
        {

            PropertyAnimation
            {
                target: choosenFractionAnimation.tar
                properties: "x"
                to: choosenFractionAnimation.tar.placeholder.x - choosenFractionAnimation.tar.width/2
            }
            PropertyAnimation
            {
                target: choosenFractionAnimation.tar
                properties: "y"
                to: choosenFractionAnimation.tar.placeholder.y - choosenFractionAnimation.tar.height/2
            }
        }


    }



    Item
    {
        id: boxItem
        width: 80
        height: width
        anchors.centerIn: parent
        property var array: new Array()
        function boxAnim()
        {
            rotAnimator.running = true
        }

        function fractionAnimation(frObject)
        {
            frObject.x = animationPlaceholder.x  - frObject.width/2
            frObject.y = animationPlaceholder.y - frObject.height/2
            frObject.visible = true

            frObject.placeholder = mainWindow.freeFractionPlaceholders.pop()

            choosenFractionAnimation.tar = frObject
            choosenFractionAnimation.start()
        }

        function getRandomFraction()
        {
            var Num = Math.floor(Math.random() * boxItem.array.length);
            var fraction = boxItem.array[Num];
            boxItem.array.splice(Num, 1)
            return fraction
        }

        DropArea
        {
            anchors.fill: parent
            onEntered: box.source = "qrc:/images/opened.png"
            onExited: box.source = "qrc:/images/closed.png"
            onDropped:
            {
                mainWindow.freeFractionPlaceholders.push(drag.source.placeholder)
                mainWindow.freeFractionPlaceholders[0].x
                mainWindow.freeFractionPlaceholders[0].y
                drag.placeholder = "undefined"
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
                    parent.boxAnim()

                }
            }
        }
        RotationAnimator {
            onRunningChanged:
            {
                if (running == false)
                {
                    var fraction = boxItem.getRandomFraction()
                    boxItem.fractionAnimation(fraction)
                }
            }

            id: rotAnimator
            target: boxItem;
            from: 0;
            to: 360;
            duration: 1000
            running: false
        }
    }
}
