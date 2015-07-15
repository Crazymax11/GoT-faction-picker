import QtQuick 2.0

Item
{
    id: mainItem
    property bool isActive: false

    Timer
    {
        id: timer
        interval: 1000
        running: false
        repeat: false
        onTriggered:
        {
            switch(mainItem.state)
            {
            case "ChosedAnimation":
                mainItem.state = "ChosedWaiting"
                break
            case "BackToDeck":
                mainItem.state = "readyToChoose"
                break
            }
        }
    }
    onStateChanged:
    {
        console.log(mainItem.state)
        switch(mainItem.state)
        {
        case "ChosedAnimation":
            timer.start()
            break
        case "BackToDeck":
            timer.start()
            break
        }
    }
    states:
    [
        State
        {
            name: "readyToChoose"
            PropertyChanges {
                target: card
                visible: false
            }
            PropertyChanges {
                target: mainItem
                isActive: true
            }
        },
        State
        {
            name: "ChosedAnimation"
            PropertyChanges {
                target: card
                visible: true
//                x: mainItem.width/2 - card.width/2
//                y: mainItem.height/2 - card.height/2
                x: cardHolder.x
                y: cardHolder.y
                width: cardHolder.width
                height: cardHolder.height
            }
        },
        State
        {
            name: "ChosedWaiting"
            PropertyChanges {
                target: mouseAreaCard
                enabled: true
            }
            PropertyChanges {
                target: card
                visible: true
                x: cardHolder.x
                y: cardHolder.y
                width: cardHolder.width
                height: cardHolder.height
            }
        },
        State
        {
            name: "BackToDeck"
            PropertyChanges {
                target: mouseAreaCard
                enabled: false
            }
            PropertyChanges {
                target: card
                visible: true
                x: card.sender.x
                y: card.sender.y
            }
        }
    ]

    transitions: Transition {
        NumberAnimation
        {
            properties: "x,y,width,height"
            duration: 1000
        }
    }

    Transition {
        from: "ChosedWaiting"
        to: "BackToDeck"
            AnchorAnimation {
                duration: 1000
            }

        }

    EventCard
    {
        id: card
        z: 15
        visible: true
        property var sender
        MouseArea
        {
            id: mouseAreaCard
            anchors.fill: parent
            enabled: false
            onClicked:
            {
                mainItem.state = "BackToDeck"
            }
        }

    }

    function showEvent(event, sender)
    {
        card.event = event
        card.width = sender.width
        card.height = sender.height
        card.x = sender.x
        card.y = sender.y
        card.sender = sender
        mainItem.state = "ChosedAnimation"
    }

    EventsDeck
    {
        x: 5
        y: mainItem.height - 5 - height
        isClickable: mainItem.isActive
        width: parent.width * 0.3
        height: parent.height/5
        id: first
        imSrc: "qrc:/images/1stevent.png"
        onChoisenEvent: showEvent(ev, this)
    }
    EventsDeck
    {
        x: mainItem.width/2 - width/2
        y: mainItem.height - 5 - height
        isClickable: mainItem.isActive
        width: parent.width * 0.3
        height: parent.height/5
        id: second
        imSrc: "qrc:/images/2ndevent.png"
        onChoisenEvent: showEvent(ev, this)
    }
    EventsDeck
    {
        x: mainItem.width - 5 - width
        y: mainItem.height - 5 - height
        isClickable: mainItem.isActive
        width: parent.width * 0.3
        height: parent.height/5
        id: third
        imSrc: "qrc:/images/thirdevent.png"
        onChoisenEvent: showEvent(ev, this)
    }

    Item
    {
        id: cardHolder
        anchors.centerIn: parent
        width: parent.width * 0.9
        height: parent.height * 0.3
    }

    Component.onCompleted:
    {
        //1 deck
        var evComp = Qt.createComponent("Event.qml");
        var firstArray = new Array()
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Снабжение",
                                            "description" : "перераспределите снабжение"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Снабжение",
                                            "description" : "перераспределите снабжение"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Снабжение",
                                            "description" : "перераспределите снабжение"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Сбор войск",
                                            "description" : "Соберите войска во всех своих замках и крепостях"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Сбор войск",
                                            "description" : "Соберите войска во всех своих замках и крепостях"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Сбор войск",
                                            "description" : "Соберите войска во всех своих замках и крепостях"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Трон из клинков",
                                            "description" : "Владелец трона из клинков выбирает",
                                            "wilding": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Трон из клинков",
                                            "description" : "Владелец трона из клинков выбирает",
                                            "wilding": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Зима близко",
                                            "description" : "Перемешайте колоду",
                                            "shuffle": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Последние дни лета",
                                            "description" : "Ничего не происходит",
                                            "wilding": true
                                        }
                                        )
                    )
        first.setDeck(firstArray)



        //2 дека
        var secondArray = new Array()
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Битва королей",
                                            "description" : "Все дома вступают в борьбу за влияние",
                                            "action": "order"
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Битва королей",
                                            "description" : "Все дома вступают в борьбу за влияние",
                                            "action": "order"
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Битва королей",
                                            "description" : "Все дома вступают в борьбу за влияние",
                                            "action": "order"
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Соберите власть во всех подконтрольных землях",
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Соберите власть во всех подконтрольных землях",
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Соберите власть во всех подконтрольных землях",
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Черные крылья, черные слова",
                                            "description" : "Владелец черного ворона выбирает",
                                            "wilding": true
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Черные крылья, черные слова",
                                            "description" : "Владелец черного ворона выбирает",
                                            "wilding": true
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Зима близко",
                                            "description" : "Перемешайте колоду",
                                            "shuffle": true
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Последние дни лета",
                                            "description" : "Ничего не происходит",
                                            "wilding": true
                                        }
                                        )
                    )
        second.setDeck(secondArray)


        //3 дека
        var thirdArray = new Array()
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Скиньте жетоны на борьбу с одичалыми"
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Скиньте жетоны на борьбу с одичалыми"
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Скиньте жетоны на борьбу с одичалыми"
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Море штормов",
                                            "description" : "Запрещаются приказы набега",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Дожди осени",
                                            "description" : "Запрещаются приказы похода +1",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Feast for Crows",
                                            "description" : "Запрещается собирать власть",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Паутина лжи",
                                            "description" : "Запрещаются приказы подмоги",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Шторм мечей",
                                            "description" : "Запрещаются приказы обороны",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Слушайтесь меча",
                                            "description" : "Владелец валирийского меча выбирает"
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Слушайтесь меча",
                                            "description" : "Владелец валирийского меча выбирает"
                                        }
                                        )
                    )
        third.setDeck(thirdArray)
        mainItem.state = "readyToChoose"
    }


}
