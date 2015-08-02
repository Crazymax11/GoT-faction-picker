import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.0

ApplicationWindow {
    id: mainWindow
    width: 1024
    height: 768
    title: qsTr("Game Of Thrones boardgame assister")
    visible: true



    Item
    {
        //App Window не содержит States
        id: root
        anchors.fill: parent
        property bool timerSettings: false
        property bool wildingsSettings: false
        property bool westerosCardsSettings: false

        property real turn: 1
        onTurnChanged:
        {
            if (turn === 11)
            {
                turn = 10
                state = "Game Over"
            }
        }
        function endTurn()
        {
            var castles = actionPhase6castles.getCastles()
            var maxCastles = 0
            for (var key in castles)
            {
                maxCastles = maxCastles > castles[key] ? maxCastles : castles[key]
                //обновляем
                statusTrack.updateCasltes(key, castles[key])
            }
            if (maxCastles === 7)
                root.state = "Game Over"
            else
            {
                root.state = "Westeros phase. 1 Deck."
                turn +=  1
            }
        }

        Component.onCompleted: state = "options"
        states:
            [
                State
                {
                    name: "options"
                    PropertyChanges
                    {
                        target: options
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "pick"
                    }
                    PropertyChanges
                    {
                        target: nextRoundButtonText
                        text: "Start the game"
                    }
                },
                State
                {
                    name: "pick"
                    PropertyChanges
                    {
                        target: picker
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        enabled: false
                        onClicked: root.state = "map preparation"
                    }
                    PropertyChanges
                    {
                        target: nextRoundButtonText
                        text: "Next"
                    }
                },
                State
                {
                    name: "map preparation"
                    PropertyChanges {
                        target: mapPreparation
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButtonText
                        text: "Next"
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "planning phase"
                    }
                },
                State
                {
                    name: "planning phase"
                    PropertyChanges {
                        target: planningPhaseDescription
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "action phase 1. Open orders"
                    }
                },
                State
                {
                    name: "action phase 1. Open orders"
                    PropertyChanges {
                        target: actionPhase2OpenOrders
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "action phase 2. Raid"
                    }
                },
                State
                {
                    name: "action phase 2. Raid"
                    PropertyChanges {
                        target: actionPhase3Raids
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "action phase 3. March"
                    }
                },
                State
                {
                    name: "action phase 3. March"
                    PropertyChanges {
                        target: actionPhase4marchs
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "action phase 4. Crowns"
                    }
                },
                State
                {
                    name: "action phase 4. Crowns"
                    PropertyChanges {
                        target: actionPhase5crowns
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "action phase 5. Castles"
                    }
                },
                State
                {
                    name: "action phase 5. Castles"
                    PropertyChanges {
                        target: actionPhase6castles
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.endTurn()
                    }
                },
                State
                {
                    name: "Game Over"
                    PropertyChanges {
                        target: stub
                        visible: true
                        text: "Game Over"
                    }
                },
                State
                {
                    name: "Westeros Phase. Virtual deck"
                    PropertyChanges {
                        target: stub
                        visible: true
                    }
                },
                State
                {
                    name: "Westeros phase. 1 Deck."
                    PropertyChanges {
                        target: westerosFirstDeck
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "Westeros phase. 2 Deck."
                    }
                },
                State
                {
                    name: "Westeros phase. 2 Deck."
                    PropertyChanges {
                        target: westerosSecondDeck
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "Westeros phase. 3 Deck."
                    }
                },
                State
                {
                    name: "Westeros phase. 3 Deck."
                    PropertyChanges {
                        target: westerosThirdDeck
                        visible: true
                    }
                    PropertyChanges
                    {
                        target: nextRoundButton
                        onClicked: root.state = "planning phase"
                    }
                }

            ]

        Item
        {
            id: options
            visible: false
            anchors.fill: contentBlock
            anchors.margins: 10
            z: contentBlock.z + 1
            Rectangle
            {
                anchors.fill: parent
                color: "#80F0E68C"
                ColumnLayout
                {
                    CheckBox
                    {
                        text: "timer"
                        onCheckedChanged: root.timerSettings = checked
                    }
                    CheckBox
                    {
                        text: "wildings"
                        onCheckedChanged: root.wildingsSettings = checked
                    }
                    CheckBox
                    {
                        text: "westerosCards"
                        onCheckedChanged: root.westerosCardsSettings = checked
                    }
                }
            }
        }


        Picker
        {
            id: picker
            visible: false
            anchors.fill: contentBlock
            anchors.margins: 10
            z: contentBlock.z + 1
            property var ravenPlaces :
            {
                "Lannister": 0,
                "Stark": 1,
                "Martell": 2,
                "Baratheon": 3,
                "Tyrell": 4,
                "GreyJoy": 5
            }
            property var swordPlaces :
            {
                "GreyJoy": 0,
                "Tyrell": 1,
                "Martell": 2,
                "Stark": 3,
                "Baratheon": 4,
                "Lannister": 5
            }
            property var thronePlaces :
            {
                "Baratheon": 0,
                "Lannister": 1,
                "Stark": 2,
                "Martell": 3,
                "GreyJoy": 4,
                "Tyrell": 5
            }

            function moveTokenToInfluenceTrack(name, track, place)
            {
                var token = track.factions[name]
                token.x = -token.parent.x -contentBlock.width + picker.anchors.margins + picker.animationph.x - token.width/2
                token.y = picker.anchors.margins + picker.animationph.y - token.height/2
                token.visible = true
                track.putFaction(token, ravenTrack.slots[place])
            }

            onFactionPicked:
            {
                moveTokenToInfluenceTrack(name, ravenTrack, ravenPlaces[name])
                moveTokenToInfluenceTrack(name, swordTrack, swordPlaces[name])
                moveTokenToInfluenceTrack(name, throneTrack, thronePlaces[name])
            }
            onPickFinished:
            {
                nextRoundButton.enabled = true
                picker.visible = false
            }
        }

        MapPrep
        {
            id: mapPreparation
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        PlanningPhaseDescription
        {
            id: planningPhaseDescription
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }

        ActionPhaseOpenOrders
        {
            id: actionPhase2OpenOrders
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }

        ActionPhaseRaids
        {
            id: actionPhase3Raids
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        ActionPhaseMarchs
        {
            id: actionPhase4marchs
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        ActionPhaseCrowns
        {
            id: actionPhase5crowns
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        ActionPhaseCastles
        {
            id: actionPhase6castles
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }



        WesterosPhaseFirstDeck
        {
            id: westerosFirstDeck
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        WesterosPhaseSecondDeck
        {
            id: westerosSecondDeck
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }
        WesterosPhaseThirdDeck
        {
            id: westerosThirdDeck
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
        }

        Item
        {
            id: stub
            anchors.fill: contentBlock
            anchors.margins: 10
            visible: false
            z: contentBlock.z + 1
            property string text : "В РАЗРАБОТКЕ"
            Text
            {
                height: parent.height
                width: parent.width
                text: stub.text
                font.bold: true
                fontSizeMode: Text.Fit
                font.pixelSize: height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item
        {
            id: leftColumn
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width * 0.28
            Item
            {
                id: roundBlock
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height * 0.23
                Rectangle
                {
                    anchors.fill: parent
                    color: "#915F19"
                }

                ColumnLayout
                {
                    anchors.centerIn: parent
                    width: parent.width * 0.9
                    height: parent.height * 0.8
                    Item
                    {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Text
                        {
                            height: parent.height
                            width: parent.width
                            text: "- Round " + root.turn + "-"
                            font.bold: true
                            fontSizeMode: Text.Fit
                            font.pixelSize: height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Item
                    {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Rectangle
                        {
                            color: "#29A5E3"
                            anchors.fill: parent
                            Text
                            {
                                id: nextRoundButtonText
                                height: parent.height
                                width: parent.width
                                text: "Next Round"
                                font.bold: true
                                fontSizeMode: Text.Fit
                                font.pixelSize: height
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                MouseArea
                                {
                                    id: nextRoundButton
                                    anchors.fill: parent
                                }
                            }
                        }
                    }
                }
            }
            Item
            {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: roundBlock.bottom
                ColumnLayout
                {
                    anchors.fill: parent
                    spacing: 0
                    id: statusTrack

                    function updateCasltes(name, count)
                    {
                        factions[name].castles = count
                    }

                    property var factions:
                    {
                        "Stark": starkStatusPosition,
                        "Tyrell": tyrellStatusPosition,
                        "GreyJoy": greyJoyStatusPosition,
                        "Lannister": lannisterStatusPosition,
                        "Baratheon": baratheonStatusPosition,
                        "Martell": martellStatusPosition
                    }

                    StatusPosition
                    {
                        id: greyJoyStatusPosition
                        source: "qrc:/images/Houses/greyjoy.png"
                        name: "greyJoy"
                        castles: 5
                        supplies: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    StatusPosition
                    {
                        id: starkStatusPosition
                        source: "qrc:/images/Houses/stark.png"
                        name: "stark"
                        castles: 7
                        supplies: 5
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    StatusPosition
                    {
                        id: lannisterStatusPosition
                        source: "qrc:/images/Houses/lannister.png"
                        name: "lannister"
                        castles: 6
                        supplies: 3
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    StatusPosition
                    {
                        id: martellStatusPosition
                        source: "qrc:/images/Houses/martell.png"
                        name: "martell"
                        castles: 4
                        supplies: 4
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    StatusPosition
                    {
                        id: baratheonStatusPosition
                        source: "qrc:/images/Houses/baratheon.png"
                        name: "baratheon"
                        castles: 1
                        supplies: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                    StatusPosition
                    {
                        id: tyrellStatusPosition
                        source: "qrc:/images/Houses/tyrel.png"
                        name: "Tyrell"
                        castles: 0
                        supplies: 0
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
        }
        Item
        {
            z: parent.z + 2
            id: rightColumn
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: parent.width * 0.3
            RowLayout
            {
                anchors.fill: parent
                spacing: 0

                InfluenceTrack
                {
                    id: throneTrack
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    imageSrc: "qrc:/images/throne.png"
                    verticalOrientation: true
                    Component.onCompleted: hideTokens()
                }
                InfluenceTrack
                {
                    id: swordTrack
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    imageSrc: "qrc:/images/sword.png"
                    Component.onCompleted: hideTokens()
                    verticalOrientation: true
                }
                InfluenceTrack
                {
                    id: ravenTrack
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    imageSrc: "qrc:/images/raven.png"
                    verticalOrientation: true
                    Component.onCompleted: hideTokens()
                }

            }
        }
        Item
        {
            id: contentBlock
            anchors.left: leftColumn.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: rightColumn.left
            Image
            {
                anchors.fill: parent
                source: "qrc:/images/background.png"
            }
        }

    }

















}
