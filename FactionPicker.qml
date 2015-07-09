import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0

Item
{
    id: factionPicker
    anchors.fill: parent
    FactionToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "Stark"
        motto: "Winter is Coming"
        width: factionPicker.width /4.5
    }
    FactionToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "Baratheon"
        motto: "Ours is the Fury"
        width: factionPicker.width /4.5
    }
    FactionToken
    {
        id: greyjoy
        source: "qrc:/images/greyJoy.png"
        name: "Greyjoy"
        motto: "We Do Not Sow"
        width: factionPicker.width /4.5
    }
    FactionToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "Tyrell"
        motto: "Growing Strong"
        width: factionPicker.width /4.5
    }
    FactionToken
    {
        id: lanister
        source: "qrc:/images/lannister.png"
        name: "Lannister"
        motto: "Hear Me Roar"
        width: factionPicker.width /4.5
    }
    FactionToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "Martell"
        motto: "Unbowed, Unbent, Unbroken"
        width: factionPicker.width /4.5
    }
    //place holders
    Item
    {
        id: placeHolder1
        x: factionPicker.width * 1/2
        y: factionPicker.height * 3/10
    }
    Item
    {
        id: placeHolder2
        x: factionPicker.width * 3/4
        y: factionPicker.height * 4/10
    }
    Item
    {
        id: placeHolder3
        x: factionPicker.width * 3/4
        y: factionPicker.height * 6/10
    }
    Item
    {
        id: placeHolder4
        x: factionPicker.width * 2/4
        y: factionPicker.height * 7/10
    }
    Item
    {
        id: placeHolder5
        x: factionPicker.width * 1/4
        y: factionPicker.height * 6/10
    }
    Item
    {
        id: placeHolder6
        x: factionPicker.width * 1/4
        y: factionPicker.height * 4/10
    }


    //placeholder for animation
    Item
    {
        id: animationPlaceholder
        x: factionPicker.width * 5/10
        y: factionPicker.height * 7/10
        z: 15

    }

    //placeholder for motto
    Item
    {
        id: mottoPlaceholder
        x: factionPicker.width * 5/10
        y: factionPicker.height * 9.5/10
        z: 15
        Text
        {
            anchors.centerIn: parent
            id: mottoText
            width: factionPicker.width * 8/10
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 90
            horizontalAlignment: Text.AlignHCenter
        }
    }

    //placeholder for name
    Item
    {
        id: namePlaceholder
        x: factionPicker.width * 5/10
        y: factionPicker.height * 1/10
        z: 15
        Text
        {
            anchors.centerIn: parent
            id: nameText
            width: factionPicker.width * 8/10
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 90
            horizontalAlignment: Text.AlignHCenter
        }
    }

    property var freeFactionPlaceholders : new Array()
    property var setedFactionPlaceholders : new Array()
    property var factions: new Array()
    Component.onCompleted:
    {
        freeFactionPlaceholders.push(placeHolder1)
        freeFactionPlaceholders.push(placeHolder2)
        freeFactionPlaceholders.push(placeHolder3)
        freeFactionPlaceholders.push(placeHolder4)
        freeFactionPlaceholders.push(placeHolder5)
        freeFactionPlaceholders.push(placeHolder6)

        factions.push(martell)
        factions.push(lanister)
        factions.push(stark)
        factions.push(tyrell)
        factions.push(greyjoy)
        factions.push(baratheon)

        factions.forEach(function(item, i, arr)
        {
            factionPicker.setFactionToken(factions[i], freeFactionPlaceholders.pop())
        })
    }
    function setFactionToken(faction, placeholder)
    {
        faction.placeholder = placeholder

        faction.x = placeholder.x - faction.width/2;
        faction.y = placeholder.y - faction.height/2;
    }

    SequentialAnimation
    {
        id: choosenFactionAnimation
        property var tar
        PropertyAnimation
        {
            target: choosenFactionAnimation.tar
            properties: "scale"
            to: 3
            duration: 1000
        }
        PropertyAnimation
        {
            target: choosenFactionAnimation.tar
            properties: "scale"
            to: 1
            duration: 1000
        }
        ParallelAnimation
        {
            PropertyAnimation
            {
                target: choosenFactionAnimation.tar
                properties: "x"
                to: choosenFactionAnimation.tar.placeholder.x - choosenFactionAnimation.tar.width/2
            }
            PropertyAnimation
            {
                target: choosenFactionAnimation.tar
                properties: "y"
                to: choosenFactionAnimation.tar.placeholder.y - choosenFactionAnimation.tar.height/2
            }
        }
        onStopped:
        {
            boxMouseArea.enabled = true
            mottoText.text = ""
            nameText.text = ""
            choosenFactionAnimation.tar.z = 10
        }

    }
    Image
    {
        id: backgroundImage
        source: "qrc:/images/background.png"
        anchors.fill: parent
    }

    Item
    {
        id: audioDriver

        Audio
        {
            id: audioBoxClosing
            source: "qrc:/sounds/chest_closing.wav"
        }
        Audio
        {
            id: audioBoxOpening
            source: "qrc:/sounds/chest_opening.wav"
        }
        Audio
        {
            id: audioBoxFactionChosed
            source: "fractionChosed"
        }
    }



    Item
    {
        id: boxItem
        width: factionPicker.width / 4
        z: 5
        height: width
        anchors.centerIn: parent
        property var array: new Array()
        function boxAnim()
        {
            rotAnimator.running = true
        }

        function factionAnimation(frObject)
        {
            frObject.x = animationPlaceholder.x  - frObject.width/2
            frObject.y = animationPlaceholder.y - frObject.height/2
            frObject.visible = true

            frObject.placeholder = factionPicker.freeFactionPlaceholders.pop()

            choosenFactionAnimation.tar = frObject

            mottoText.text = frObject.motto
            nameText.text = frObject.name
            frObject.z = 11
            choosenFactionAnimation.start()
        }

        function getRandomFaction()
        {
            var Num = Math.floor(Math.random() * boxItem.array.length);
            var fraction = boxItem.array[Num];
            boxItem.array.splice(Num, 1)
            return fraction
        }

        DropArea
        {
            anchors.fill: parent
            onEntered:
            {
                audioBoxOpening.play()
                box.source = "qrc:/images/opened.png"
            }
            onExited:
            {
                audioBoxClosing.play()
                box.source = "qrc:/images/closed.png"
            }
            onDropped:
            {
                factionPicker.freeFactionPlaceholders.push(drag.source.placeholder)
                factionPicker.freeFactionPlaceholders[0].x
                factionPicker.freeFactionPlaceholders[0].y
                drag.placeholder = "undefined"
                drag.source.visible = false;
                boxItem.array.push(drag.source);
                box.source = "qrc:/images/closed.png";
                audioBoxClosing.play()
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
            id: boxMouseArea
            anchors.fill: parent
            onClicked:
            {
                if (boxItem.array.length > 0)
                {
                    parent.boxAnim()
                    enabled = false

                }
            }
        }
        RotationAnimator {
            onRunningChanged:
            {
                if (running == false)
                {
                    var fraction = boxItem.getRandomFaction()
                    boxItem.factionAnimation(fraction)
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
