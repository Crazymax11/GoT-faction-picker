import QtQuick 2.0
import QtQml 2.2

Rectangle {
    id: superParent
    width: 100
    height: 62
    color: "sienna"
    border.width: 2
    border.color: lighter(color, 1.5)
    property real swordImageWidth: width * 1/7
    property real factionPlaceholderWidth: width * 1/7
    property real factionTokenWidth: width * 1/9
    property int placeholdersCount: 6
    //placeholders
    property var unphs: new Array()
    property var trackphs: new Array()
    property var tokens: new Array()
    function setTokenInphs(token, phs)
    {
        token.x = phs.x + token.width/2
        token.y = phs.y + token.height/2
        phs.it = token
    }

    //unused tokens placeholders
    PlaceHolder
    {
        id: firstunphs
        x: swordImage.x + 1/4 * swordImage.width
        y: swordImage.y + 1/6 * swordImage.height
    }

    PlaceHolder
    {
        id: secondunphs
        x: swordImage.x + 1/4 * swordImage.width
        y: swordImage.y + 3/6 * swordImage.height
    }

    PlaceHolder
    {
        id: thirdunphs
        x: swordImage.x + 1/4 * swordImage.width
        y: swordImage.y + 5/6 * swordImage.height
    }

    PlaceHolder
    {
        id: fourthunphs
        x: swordImage.x + 3/4 * swordImage.width
        y: swordImage.y + 1/6 * swordImage.height
    }

    PlaceHolder
    {
        id: fivethunphs
        x: swordImage.x + 1/4 * swordImage.width
        y: swordImage.y + 3/6 * swordImage.height
    }

    PlaceHolder
    {
        id: sixthunphs
        x: swordImage.x + 1/4 * swordImage.width
        y: swordImage.y + 5/6 * swordImage.height
    }

    //Factions Tokens
    FactionToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "Stark"
        motto: "Winter is Coming"
        width: factionTokenWidth
    }
    FactionToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "Baratheon"
        motto: "Ours is the Fury"
        width: factionTokenWidth
    }
    FactionToken
    {
        id: greyjoy
        source: "qrc:/images/greyJoy.png"
        name: "Greyjoy"
        motto: "We Do Not Sow"
        width: factionTokenWidth
    }
    FactionToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "Tyrell"
        motto: "Growing Strong"
        width: factionTokenWidth
    }
    FactionToken
    {
        id: lanister
        source: "qrc:/images/lannister.png"
        name: "Lannister"
        motto: "Hear Me Roar"
        width: factionTokenWidth
    }
    FactionToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "Martell"
        motto: "Unbowed, Unbent, Unbroken"
        width: factionTokenWidth
    }




    Component.onCompleted:
    {
        tokens.push(martell)
        tokens.push(lanister)
        tokens.push(stark)
        tokens.push(tyrell)
        tokens.push(greyjoy)
        tokens.push(baratheon)

        unphs.push(firstunphs)
        unphs.push(secondunphs)
        unphs.push(thirdunphs)
        unphs.push(fourthunphs)
        unphs.push(fivethunphs)
        unphs.push(sixthunphs)

        for(var i = 0; i < 6; i++)
        {
            setTokenInphs(tokens[i], unphs[i])
        }
    }

    Image
    {
        id: swordImage
        width: swordImageWidth
        height: parent.height
        source: "qrc:/images/throne.png"
    }


    Item
    {
        id: firstSwordPlaceholder
        x: swordImage.x + swordImage.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "1"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }

    }
    Item
    {
        id: secondSwordPlaceholder
        x: firstSwordPlaceholder.x + firstSwordPlaceholder.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "2"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }
    }
    Item
    {
        id: thirdSwordPlaceholder
        x: secondSwordPlaceholder.x + secondSwordPlaceholder.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "3"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }

    }
    Item
    {
        id: fourthSwordPlaceholder
        x: thirdSwordPlaceholder.x + thirdSwordPlaceholder.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "4"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }

    }
    Item
    {
        id: fivethSwordPlaceholder
        x: fourthSwordPlaceholder.x + fourthSwordPlaceholder.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "5"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }

    }
    Item
    {
        id: sixthSwordPlaceholder
        x: fivethSwordPlaceholder.x + fivethSwordPlaceholder.width
        width: factionPlaceholderWidth
        height: parent.height
        property var house: "undefined"
        Rectangle
        {
            color: "lightgray"
            width: Math.min(parent.width, parent.height)
            height: width
            anchors.centerIn: parent
            radius: width/2
            Text
            {
                width: parent.width * 7/10
                anchors.centerIn: parent
                text: "6"
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
            DropArea
            {
                anchors.fill: parent
                onDropped:
                {
                    drag.source.x = parent.parent.x + parent.parent.width/2 - drag.source.width/2
                    drag.source.y = parent.parent.height/2 - drag.source.height/2
                    if (parent.parent.house !== "undeifned")
                    {
                        if (parent.parent.house.name !== drag.source.name)
                        {
                            parent.parent.house.x = 0
                            parent.parent.house.y = 0
                        }
                    }
                    parent.parent.house = drag.source
                }
                onExited:
                {
                    if (parent.parent.house)
                    {
                        if (drag.source.name === parent.parent.house.name)
                        {
                            parent.parent.house = "undefined"
                        }
                    }
                }
            }
        }

    }
}
