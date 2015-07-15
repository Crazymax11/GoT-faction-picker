import QtQuick 2.0
import QtQml 2.2

Rectangle {
    id: superParent
    width: 100
    height: 62
    color: "sienna"
    border.width: 2
    border.color: lighter(color, 1.5)

    property real trackImageWidth: width * 1/5
    property real factionPlaceholderWidth: (width - trackImageWidth) / 6
    property real factionTokenWidth: Math.min(factionPlaceholderWidth * 0.9,  height * 0.9)

    property string imageSrc

    property var factions: new Array()
    property var slots: new Array()

    property var order: new Array()

    DropArea
    {
        anchors.fill: parent
        onDropped:
        {
            if (!drag.target)
                putFaction(drag.source, drag.source.placeholder)
        }
    }



    Component.onCompleted:
    {
        factions["Stark"] = stark
        factions["Baratheon"] = baratheon
        factions["GreyJoy"] = greyjoy
        factions["Tyrell"] = tyrell
        factions["Lannister"] = lannister
        factions["Martell"] = martell

        slots.push(firstSlot)
        slots.push(secondSlot)
        slots.push(thirdSlot)
        slots.push(fourthSlot)
        slots.push(fivethSlot)
        slots.push(sixthSlot)

        for(var i = 0; i < 6; i++)
        {
            putFaction(factions[order[i]], slots[i])

        }
    }


    function putFaction(faction, slot)
    {
        slot.house = faction
        faction.placeholder = slot
        faction.move(slot.x + slot.width/2 - faction.width/2, slot.y + slot.height/2 - faction.height/2)
    }

    function bindXY(faction)
    {
        faction.x = Qt.binding(function() { return this.placeholder.x + this.placeholder.width/2 - this.width/2} )
        faction.y = Qt.binding(function() { return this.placeholder.y + this.placeholder.height/2 - this.height/2} )
    }

    function catched(faction, slot)
    {
        if (slot.house && (slot.house !== faction))
        {
            var phs = faction.placeholder
            var hs = slot.house
            putFaction(slot.house, faction.placeholder)
        }
        putFaction(faction, slot)
    }

    //Factions Tokens
    InfluenceFactionToken
    {
        id: stark
        source: "qrc:/images/stark.png"
        name: "Stark"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }
    InfluenceFactionToken
    {
        id: baratheon
        source: "qrc:/images/baratheon.png"
        name: "Baratheon"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }
    InfluenceFactionToken
    {
        id: greyjoy
        source: "qrc:/images/greyJoy.png"
        name: "GreyJoy"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }
    InfluenceFactionToken
    {
        id: tyrell
        source: "qrc:/images/Tyrell.png"
        name: "Tyrell"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }
    InfluenceFactionToken
    {
        id: lannister
        source: "qrc:/images/lannister.png"
        name: "Lannister"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }
    InfluenceFactionToken
    {
        id: martell
        source: "qrc:/images/martell.png"
        name: "Martell"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: parent.width/5
    }

    Image
    {
        id: trackImage
        width: trackImageWidth
        height: parent.height
        source: parent.imageSrc
    }

    InfluenceTrackSlot
    {
        id: firstSlot
        x: trackImage.x + trackImage.width
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "1"
        onCatched: superParent.catched(token, this)
    }
    InfluenceTrackSlot
    {
        id: secondSlot
        x: trackImage.x + trackImage.width + factionPlaceholderWidth
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "2"
        onCatched: superParent.catched(token, this)
    }
    InfluenceTrackSlot
    {
        id: thirdSlot
        x: trackImage.x + trackImage.width + factionPlaceholderWidth * 2
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "3"
        onCatched: superParent.catched(token, this)
    }
    InfluenceTrackSlot
    {
        id: fourthSlot
        x: trackImage.x + trackImage.width + factionPlaceholderWidth * 3
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "4"
        onCatched: superParent.catched(token, this)
    }
    InfluenceTrackSlot
    {
        id: fivethSlot
        x: trackImage.x + trackImage.width + factionPlaceholderWidth * 4
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "5"
        onCatched: superParent.catched(token, this)
    }
    InfluenceTrackSlot
    {
        id: sixthSlot
        x: trackImage.x + trackImage.width + factionPlaceholderWidth * 5
        width: factionPlaceholderWidth
        height: parent.height
        circleColor: "lightgray"
        circleText: "6"
        onCatched: superParent.catched(token, this)
    }
}

