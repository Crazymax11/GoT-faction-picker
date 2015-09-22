import QtQuick 2.0
import QtQml 2.2

Rectangle {
    id: superParent
    width: 100
    height: 62
    color: "sienna"
    border.width: 2
    border.color: lighter(color, 1.5)

    property real trackImageWidth: contentLength * 1/5
    property real factionPlaceholderWidth: (contentLength - trackImageWidth) / 6
    property real factionTokenWidth: Math.min(factionPlaceholderWidth * 0.9,  contentHeight * 0.9)

    property string imageSrc

    property var factions: new Array()
    property var slots: new Array()

    property var order: new Array()

    property real contentLength: (verticalOrientation? height: width) - border.width*2
    property real contentHeight: (verticalOrientation? width: height) - border.width*2
    property real slotWidth: verticalOrientation? contentHeight: factionPlaceholderWidth
    property real slotHeight: verticalOrientation? factionPlaceholderWidth: contentHeight

    property bool verticalOrientation: false

    function hideTokens()
    {
        stark.visible = false
        baratheon.visible = false
        greyjoy.visible = false
        tyrell.visible = false
        lannister.visible = false
        martell.visible = false
    }

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

        if (order.length === 0)
            return

        for(var i = 0; i < 6; i++)
        {
            putFaction(factions[order[i]], slots[i])
        }
    }


    function setFaction(name, slotnum)
    {
        factions[name].visible = true
        putFaction(factions[name], slots[slotnum])
    }

    function putFaction(faction, slot)
    {
        if (slot)
            console.log(slot.house)
        console.log(faction)
        slot.house = faction
        faction.placeholder = slot
        faction.move(slot.x + slot.width/2 - faction.width/2, slot.y + slot.height/2 - faction.height/2)
    }

    function bindXY(faction)
    {
        faction.x = faction.placeholder.x + faction.placeholder.width/2 - faction.width/2
        faction.y = faction.placeholder.y + faction.placeholder.height/2 - faction.height/2
        // вариант с бингингом, вернуть когда будет скейлебл делать
        //faction.x = Qt.binding(function() { return this.placeholder.x + this.placeholder.width/2 - this.width/2} )
        //faction.y = Qt.binding(function() { return this.placeholder.y + this.placeholder.height/2 - this.height/2} )
    }

    function catched(faction, slot)
    {
        console.log("catched")
        if (slot.house && (slot.house !== faction) && (slot.house !== "undefined"))
        {
            console.log("inif")
            putFaction(slot.house, faction.placeholder)
        }
        console.log("afterif")
        putFaction(faction, slot)
    }

    //Factions Tokens
    InfluenceFactionToken
    {
        id: stark
        source: "qrc:/images/Houses/stark.png"
        name: "Stark"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        //speed: parent.contentLength/2
        speed: 400
        z: parent.z + 2
    }
    InfluenceFactionToken
    {
        id: baratheon
        source: "qrc:/images/Houses/baratheon.png"
        name: "Baratheon"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: 400
        z: parent.z + 2
    }
    InfluenceFactionToken
    {
        id: greyjoy
        source: "qrc:/images/Houses/greyjoy.png"
        name: "GreyJoy"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: 400
        z: parent.z + 2
    }
    InfluenceFactionToken
    {
        id: tyrell
        source: "qrc:/images/Houses/tyrel.png"
        name: "Tyrell"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: 400
        z: parent.z + 2
    }
    InfluenceFactionToken
    {
        id: lannister
        source: "qrc:/images/Houses/lannister.png"
        name: "Lannister"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: 400
        z: parent.z + 2
    }
    InfluenceFactionToken
    {
        id: martell
        source: "qrc:/images/Houses/martell.png"
        name: "Martell"
        width: factionTokenWidth
        onAnimationStopped: superParent.bindXY(this)
        speed: 400
        z: parent.z + 2
    }

    Item
    {
        id: trackImage
        width: superParent.verticalOrientation ? parent.contentHeight : trackImageWidth
        height: superParent.verticalOrientation ? trackImageWidth : contentHeight
        Image
        {
            width: Math.min(parent.height, parent.width)
            height: width
            anchors.centerIn: parent
            source: superParent.imageSrc
        }
    }

    InfluenceTrackSlot
    {
        id: firstSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height : superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "1"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
    InfluenceTrackSlot
    {
        id: secondSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width + factionPlaceholderWidth
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height + factionPlaceholderWidth : superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "2"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
    InfluenceTrackSlot
    {
        id: thirdSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width + factionPlaceholderWidth * 2
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height + factionPlaceholderWidth * 2: superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "3"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
    InfluenceTrackSlot
    {
        id: fourthSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width + factionPlaceholderWidth * 3
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height + factionPlaceholderWidth * 3: superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "4"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
    InfluenceTrackSlot
    {
        id: fivethSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width + factionPlaceholderWidth * 4
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height + factionPlaceholderWidth * 4: superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "5"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
    InfluenceTrackSlot
    {
        id: sixthSlot
        x: superParent.verticalOrientation ? superParent.border.width : trackImage.x + trackImage.width + factionPlaceholderWidth * 5
        y: superParent.verticalOrientation ? trackImage.y + trackImage.height + factionPlaceholderWidth * 5: superParent.border.width
        width: slotWidth
        height: slotHeight
        circleColor: "lightgray"
        circleText: "6"
        onCatched: superParent.catched(token, this)
        z: parent.z + 1
    }
}

