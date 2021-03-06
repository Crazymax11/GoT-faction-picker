import QtQuick 2.0
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: root
    spacing: 0
    signal cardChoisen(string name)
    WesterosPhaseCard
    {
        name: "Битва королей"
        description: "Все Дома вступают в борьбу за влияние."
        source: "qrc:/images/westerosCards/ClashofKings.png"
        onCardChoisen: root.cardChoisen(name)
    }
    WesterosPhaseCard
    {
        name: "Игра Престолов"
        description: "Каждый дом получает по одному жетону власти за каждый знак короны в подвластных землях."
        source: "qrc:/images/westerosCards/GameofThrones.png"
        onCardChoisen: root.cardChoisen(name)
    }
    WesterosPhaseCard
    {
        name: "Чёрные крылья, чёрные слова"
        description: "Владелец Посыльного ворона приказывает всем Домам либо а) вступить в борьбу за влияние, либо б) собрать жетоны власти со всех подвластных земель со знаками короны, либо в) расслабляться, так как ничего не происходит."
        wilding: true
        source: "qrc:/images/westerosCards/DarkWingsDarkWords.png"
        onCardChoisen: root.cardChoisen(name)

    }
    WesterosPhaseCard
    {
        name: "Зима близко"
        source: "qrc:/images/westerosCards/WinterisComing.png"
        description: "Немедленно перетасуйте эту колоду. Затем вскройте и разыграйте новую карту."
        wilding: true
        onCardChoisen: root.cardChoisen(name)
    }
    WesterosPhaseCard
    {
        name: "Последние дни лета"
        description: "Ничего не происходит."
        wilding: true
        source: "qrc:/images/westerosCards/LastDaysofSummer.png"
        onCardChoisen: root.cardChoisen(name)
    }
}
