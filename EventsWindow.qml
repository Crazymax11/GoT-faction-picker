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
                target: card
                visible: true
                x: cardHolder.x
                y: cardHolder.y
                width: cardHolder.width
                height: cardHolder.height
                isClickable: true
            }
        },
        State
        {
            name: "BackToDeck"
            PropertyChanges {
                target: card
                visible: true
                x: card.sender.x
                y: card.sender.y
                isClickable: false
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
        onCardClicked: mainItem.state = "BackToDeck"
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
                                            "description" : "Переместите жетоны на треке снабжения. Дома сокращают или распускают войска, которые не могут содержать."
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Снабжение",
                                            "description" : "Переместите жетоны на треке снабжения. Дома сокращают или распускают войска, которые не могут содержать."
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Снабжение",
                                            "description" : "Переместите жетоны на треке снабжения. Дома сокращают или распускают войска, которые не могут содержать."
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Сбор войск",
                                            "description" : "Дома создают новые отряды в крепостях и замках"
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Сбор войск",
                                            "description" : "Дома создают новые отряды в крепостях и замках"
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
                                            "description" : "Владелец Железного трона приказывает всем Домам либо а) изменить снабжение и состав войск, либо б) собрать войска, либо в) отдыхать, так как ничего не происходит.",
                                            "wilding": true,
                                            "action": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Трон из клинков",
                                            "description" : "Владелец Железного трона приказывает всем Домам либо а) изменить снабжение и состав войск, либо б) собрать войска, либо в) отдыхать, так как ничего не происходит.",
                                            "wilding": true,
                                            "action": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Зима близко",
                                            "description" : "Немедленно перетасуйте эту колоду. Затем вскройте и разыграйте новую карту.",
                                            "shuffle": true
                                        }
                                        )
                    )
        firstArray.push(
                    evComp.createObject(this, {
                                            "evName": "Последние дни лета",
                                            "description" : "Ничего не происходит.",
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
                                            "description" : "Все Дома вступают в борьбу за влияние.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Битва королей",
                                            "description" : "Все Дома вступают в борьбу за влияние.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Битва королей",
                                            "description" : "Все Дома вступают в борьбу за влияние.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Каждый дом получает по одному жетону власти за каждый знак короны в подвластных землях.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Каждый дом получает по одному жетону власти за каждый знак короны в подвластных землях.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Игра престолов",
                                            "description" : "Каждый дом получает по одному жетону власти за каждый знак короны в подвластных землях.",
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Чёрные крылья, чёрные слова",
                                            "description" : "Владелец Посыльного ворона приказывает всем Домам либо а) вступить в борьбу за влияние, либо б) собрать жетоны власти со всех подвластных земель со знаками короны, либо в) расслабляться, так как ничего не происходит.",
                                            "wilding": true,
                                            "action": true,
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Чёрные крылья, чёрные слова",
                                            "description" : "Владелец Посыльного ворона приказывает всем Домам либо а) вступить в борьбу за влияние, либо б) собрать жетоны власти со всех подвластных земель со знаками короны, либо в) расслабляться, так как ничего не происходит.",
                                            "wilding": true,
                                            "action": true,
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Зима близко",
                                            "description" : "Немедленно перетасуйте эту колоду. Затем вскройте и разыграйте новую карту.",
                                            "shuffle": true,
                                            "effect": false
                                        }
                                        )
                    )
        secondArray.push(
                    evComp.createObject(this, {
                                            "evName": "Последние дни лета",
                                            "description" : "Ничего не происходит",
                                            "wilding": true,
                                            "effect": false
                                        }
                                        )
                    )
        second.setDeck(secondArray)


        //3 дека
        var thirdArray = new Array()
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Одичалые наступают за земли Вестероса.",
                                            "effect": false
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Одичалые наступают за земли Вестероса.",
                                            "effect": false
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Нашествие одичалых",
                                            "description" : "Одичалые наступают за земли Вестероса.",
                                            "effect": false
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Море штормов",
                                            "description" : "В этой фазе замыслов нельзя отдавать приказы набега.",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Дожди осени",
                                            "description" : "В этой фазе замыслов нельзя отдавать приказы похода +1.",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Пир для ворон",
                                            "description" : "В этой фазе замыслов нельзя отдавать приказы усиления власти.",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Паутина лжи",
                                            "description" : "В этой фазе замыслов нельзя отдавать приказы подмоги.",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Буря мечей",
                                            "description" : "В этой фазе замыслов нельзя отдавать приказы обороны.",
                                            "wilding": true
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Преданы мечу",
                                            "description" : "Владелец Валирийского меча выбирает одно из условий для этой фазы замыслов: а) не отдаются приказы обороны, б) не отдаются приказы похода +1 или в) ограничений нет.",
                                            "action": true,
                                            "effect": false
                                        }
                                        )
                    )
        thirdArray.push(
                    evComp.createObject(this, {
                                            "evName": "Преданы мечу",
                                            "description" : "Владелец Валирийского меча выбирает одно из условий для этой фазы замыслов: а) не отдаются приказы обороны, б) не отдаются приказы похода +1 или в) ограничений нет.",
                                            "action": true,
                                            "effect": false
                                        }
                                        )
                    )
        third.setDeck(thirdArray)
        mainItem.state = "readyToChoose"
    }


}
