import QtQuick 2.0

Item
{
    property var event
    signal wildingAttack()
    onEventChanged:
    {

        switch (event.evName)
        {

            case "Снабжение":
                infoTokenImage.source = "qrc:/images/westerosCards/Supply.png"
                break
            case "Сбор войск":
                infoTokenImage.source = "qrc:/images/westerosCards/Mustering.png"
                break
            case "Трон из клинков":
                infoTokenImage.source = "qrc:/images/westerosCards/ThronesofBlades.png"
                break
            case "Зима близко" :
                infoTokenImage.source = "qrc:/images/westerosCards/WinterisComing.png"
                break
            case "Последние дни лета" :
                infoTokenImage.source = "qrc:/images/westerosCards/LastDaysofSummer.png"
                break

            //2nd deck
            case "Битва королей" :
                infoTokenImage.source = "qrc:/images/westerosCards/ClashofKings.png"
                break
            case "Игра престолов" :
                infoTokenImage.source = "qrc:/images/westerosCards/GameofThrones.png"
                break
            case "Черные крылья, черные слова" :
                infoTokenImage.source = "qrc:/images/westerosCards/DarkWingsDarkWords.png"
                break

            //3rd deck
            case "Нашествие одичалых" :
                infoTokenImage.source = "qrc:/images/westerosCards/WildingAttack.png"
                wildingAttack()
                break
            case "Море штормов" :
                infoTokenImage.source = "qrc:/images/westerosCards/SeaofStorms.png"
                break
            case "Дожди осени" :
                infoTokenImage.source = "qrc:/images/westerosCards/RainsofAutumn.png"
                break
            case "Feast for Crows" :
                infoTokenImage.source = "qrc:/images/westerosCards/FeastforCrows.png"
                break
            case "Паутина лжи" :
                infoTokenImage.source = "qrc:/images/westerosCards/WebofLies.png"
                break
            case "Шторм мечей" :
                infoTokenImage.source = "qrc:/images/westerosCards/StormofSwords.png"
                break
            case "Слушайтесь меча" :
                infoTokenImage.source = "qrc:/images/westerosCards/PuttotheSword.png"
                break
        default:
            console.log("name dont recognized " + event.evName)
            infoTokenImage.source = "qrc:/images/placeHolder.png"
            break;
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
                }
                Text
                {
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    text: "Сила одичалых"
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
        }
    }

}
