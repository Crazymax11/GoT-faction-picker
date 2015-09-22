import QtQuick 2.0
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: root
    spacing: 0
    signal cardChoisen(string name)
    WesterosPhaseCard
    {
        name: "Снабжение"
        source: "qrc:/images/westerosCards/Supply.png"
        description: "Переместите жетоны на треке снабжения. Дома сокращают или распускают войска, которые не могут содержать."
        onCardChoisen: root.cardChoisen(name)
    }
    WesterosPhaseCard
    {
        name: "Сбор войск"
        source: "qrc:/images/westerosCards/Mustering.png"
        description: "Дома создают новые отряды в крепостях и замках"
        onCardChoisen: root.cardChoisen(name)

    }
    WesterosPhaseCard
    {

        name: "Трон из клинков"
        source: "qrc:/images/westerosCards/ThronesofBlades.png"
        description: "Владелец Железного трона приказывает всем Домам либо а) изменить снабжение и состав войск, либо б) собрать войска, либо в) отдыхать, так как ничего не происходит."
        wilding: true
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
