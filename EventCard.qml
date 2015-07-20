import QtQuick 2.0
import QtQuick.Layouts 1.1

Item
{
    id: mainItem
    property var event

    signal cardClicked()

    signal wildingPowerGrow()

    property var actions : {
    "Снабжение" : supply,
    "Сбор войск" : mustering,
    "Битва королей":  clashOfKings,
    "Игра престолов": gameOfThrones,
    "Нашествие одичалых": wildingAttack,
    }

    property var effects: [
    "Море штормов",
    "Дожди осени",
    "Пир для ворон",
    "Паутина лжи",
    "Буря мечей"
    ]

    property var imageNames : {
    "Снабжение" : "qrc:/images/westerosCards/Supply.png",
    "Сбор войск" :"qrc:/images/westerosCards/Mustering.png",
    "Трон из клинков": "qrc:/images/westerosCards/ThronesofBlades.png",
    "Зима близко" : "qrc:/images/westerosCards/WinterisComing.png",
    "Последние дни лета" : "qrc:/images/westerosCards/LastDaysofSummer.png",
    "Битва королей" : "qrc:/images/westerosCards/ClashofKings.png",
    "Игра престолов" : "qrc:/images/westerosCards/GameofThrones.png",
    "Чёрные крылья, чёрные слова" : "qrc:/images/westerosCards/DarkWingsDarkWords.png",
    "Нашествие одичалых" : "qrc:/images/westerosCards/WildingAttack.png",
    "Море штормов" : "qrc:/images/westerosCards/SeaofStorms.png",
    "Дожди осени" : "qrc:/images/westerosCards/RainsofAutumn.png",
    "Пир для ворон" : "qrc:/images/westerosCards/FeastforCrows.png",
    "Паутина лжи" : "qrc:/images/westerosCards/WebofLies.png",
    "Буря мечей" :"qrc:/images/westerosCards/StormofSwords.png",
    "Преданы мечу" : "qrc:/images/westerosCards/PuttotheSword.png"
    }

    property var choiseEvents :
    {
        "Трон из клинков" : ["Снабжение", "Сбор войск"],
        "Чёрные крылья, чёрные слова" : ["Битва королей", "Игра престолов"],
        "Преданы мечу" : ["Дожди осени", "Буря мечей"]
    }

    function cardClick()
    {
        //посылаем эффект и действие
        if (cardEffect)
        {
            westerosCardEffect(cardEffect)
            console.log("эффект вестероса" + cardEffect)
        }
        if (cardAction)
        {
            console.log("экшн карты")
            cardAction()
        }
        cardEffect = ""
        cardAction = null

        if (event.wilding)
            wildingPowerGrow()

        cardClicked()
    }

    //мгновенные действия
    signal mustering()
    signal supply()
    signal clashOfKings()
    signal wildingAttack()
    signal gameOfThrones()

    // эффекты на ход
    property string cardEffect: undefined
    property var cardAction: undefined
    signal westerosCardEffect(string effectName)

    property bool isClickable

    onEventChanged:
    {
        if (event.evName in imageNames)
            infoTokenImage.source = imageNames[event.evName]
        if (event.evName in actions)
            cardAction = actions[event.evName]
        if (effects.indexOf(event.evName) > -1)
            cardEffect = event.evName
        if (event.evName in choiseEvents)
        {
            firstAction.effectName = choiseEvents[event.evName][0]
            firstAction.imgSrc = imageNames[firstAction.effectName]
            secondAction.effectName = choiseEvents[event.evName][1]
            secondAction.imgSrc = imageNames[secondAction.effectName]
        }
    }

    Rectangle
    {
        z: 5
        anchors.fill: parent
        border.color: "cadetblue"
        border.width: 2
        color: "transparent"
    }


    MouseArea
    {
        id: cardMouseArea
        anchors.fill: parent
        enabled: mainItem.isClickable * (!event.action)
        onClicked: mainItem.cardClick()
    }

    Item
    {
        id: nameBlock
        width: parent.width
        height: parent.height * 0.2
        anchors.top : parent.top
        Rectangle
        {
            anchors.fill: parent
            color: "orange"
        }
        Text
        {
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            text: event.evName
            wrapMode: Text.WordWrap
            font.pointSize: 16

        }
    }
    Item
    {
        id: contentBlock
        width: parent.width
        height: parent.height * 0.8
        anchors.top : nameBlock.bottom
        Rectangle
        {
            anchors.fill: parent
            color: "brown"
        }
        Item
        {
            id: desctiptionBlock
            width: parent.width
            height: parent.height * 0.4
            Text
            {
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                text: event.description
                wrapMode: Text.WordWrap
                font.pointSize: 10
            }
        }
        Item
        {
            id: bottomBlock
            width: parent.width
            height: parent.height - desctiptionBlock.height
            anchors.bottom: parent.bottom
            Item
            {
                id: wildingPower
                width: Math.min(parent.width, parent.height)
                height: width
                visible: event.wilding
                anchors.right: parent.right
                Rectangle
                {
                    anchors.fill: parent
                    color: "lightsteelblue"
                    border.width: 2
                    border.color: "mediumslateblue"
                    Image
                    {
                        anchors.fill: parent
                        source: "qrc:/images/westerosCards/WildingAttack.png"
                    }
                }
            }
            Item
            {
                id: infoToken
                width: Math.min(parent.width, parent.height)
                height: width
                anchors.left: parent.left
                Rectangle
                {
                    anchors.fill: parent
                    color: "goldenrod"
                    border.width: 2
                    border.color: "darkorange"
                    Image
                    {
                        id: infoTokenImage
                        anchors.fill: parent
                    }
                }
            }
            Item
            {
                id: actionBlock
                anchors.left: infoToken.right
                anchors.right: wildingPower.left
                anchors.bottom : parent.bottom
                anchors.top: parent.top
                anchors.margins: 10
                visible: event.action
                property real actionWidthK: 0.3
                Item
                {
                    id: firstAction
                    width: parent.width * parent.actionWidthK
                    height: parent.height
                    property string imgSrc: "qrc:/images/placeHolder.png"
                    property string effectName
                    Image
                    {
                        anchors.fill: parent
                        source: firstAction.imgSrc
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        enabled: mainItem.isClickable && event.action
                        onClicked:
                        {
                            if (parent.effectName in mainItem.actions)
                                mainItem.cardAction = mainItem.actions[parent.effectName]
                            if (mainItem.effects.indexOf(parent.effectName) > -1)
                                mainItem.cardEffect = parent.effectName
                            mainItem.cardClick()

                        }
                    }
                }
                Item
                {
                    id: secondAction
                    width: parent.width * parent.actionWidthK
                    height: parent.height
                    x: width + (parent.width - width * 3)/2
                    property string imgSrc: "qrc:/images/placeHolder.png"
                    property string effectName
                    Image
                    {
                        anchors.fill: parent
                        source: parent.imgSrc
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        enabled: mainItem.isClickable && event.action
                        onClicked:
                        {
                            if (parent.effectName in mainItem.actions)
                                mainItem.cardAction = mainItem.actions[parent.effectName]
                            if (mainItem.effects.indexOf(parent.effectName) > -1)
                                mainItem.cardEffect = parent.effectName
                            mainItem.cardClick()
                        }
                    }
                }
                Item
                {
                    id: noAction
                    x: width * 2 + (parent.width - width * 3)
                    width: parent.width * parent.actionWidthK
                    height: parent.height
                    Image
                    {
                        anchors.fill: parent
                        source: "qrc:/images/westerosCards/LastDaysofSummer.png"
                    }
                    MouseArea
                    {
                        anchors.fill: parent
                        enabled: mainItem.isClickable && event.action
                        onClicked: mainItem.cardClick()
                    }
                }
            }
        }
    }

}
