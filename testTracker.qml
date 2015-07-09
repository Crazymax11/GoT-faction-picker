import QtQuick 2.0
import QtQml 2.2

Rectangle {
    id: superParent
    color: "sienna"
    border.width: 2
    border.color: lighter(color, 1.5)
    property real swordImageWidth: width * 1/7
    property real factionPlaceholderWidth: width * 1/7
    property real factionTokerWidth: width * 1/9
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

    Component.onCompleted:
    {
        var namesArr = new Array()
        namesArr.push(
                    {
                        "source": "qrc:/images/stark.png",
                        "name": "Stark",
                        "motto": "Winter is Coming"
                    }
                    )
        namesArr.push(
                    {
                        "source": "qrc:/images/baratheon.png",
                        "name": "Baratheon",
                        "motto": "Ours is the Fury"
                    }
                    )
        namesArr.push(
                    {
                        "source": "qrc:/images/greyJoy.png",
                        "name": "Greyjoy",
                        "motto": "We Do Not Sow"
                    }
                    )
        namesArr.push(
                    {
                        "source": "qrc:/images/Tyrell.png",
                        "name": "Tyrell",
                        "motto": "Growing Strong"
                    }
                    )
        namesArr.push(
                    {
                        "source": "qrc:/images/lannister.png",
                        "name": "Lannister",
                        "motto": "Hear Me Roar"
                    }
                    )
        namesArr.push(
                    {
                        "source": "qrc:/images/martell.png",
                        "name": "Martell",
                        "motto": "Unbowed, Unbent, Unbroken"
                    }
                    )
        var placeholderComponent = Qt.createComponent("qrc:/PlaceHolder.qml");
        var factionTokerComponent = Qt.createComponent("qrc:/FactionToken.qml")
        var obj
        for (var i = 0; i < placeholdersCount; i++)
        {
            var y = height * (i  % 3) / 3
            var x = swordImageWidth * 1/4 + 0.5 * (Math.floor(i / 3))
            obj = placeholderComponent.createObject(this, {})
            obj.x = swordImageWidth * 1/4 + 0.5 * (Math.floor(i / 3))
            obj.y = height * (i  % 3) / 3
            unphs.push(obj)
            x = (width - swordImageWidth) * i / placeholdersCount
            y = height/2
            obj = placeholderComponent.createObject(this, {"x": x, "y": y})
            obj.x = (width - swordImageWidth) * i / placeholdersCount
            obj.y = height/2
            trackphs.push(obj)
        }
        for (var i = 0; i < 6; i++)
        {
            var token = factionTokerComponent.createObject(this,
                                               {

                                                   "name": namesArr[i]["name"],
                                                   "source": namesArr[i]["source"],
                                                   "motto": namesArr[i]["motto"],
                                               }
                                               )
            setTokenInphs(token, unphs[i])
        }

    }


    z: 1
    Image
    {
        id: swordImage
        width: swordImageWidth
        height: parent.height
        source: "qrc:/images/sword.png"
    }

    }
