import QtQuick 2.0
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: root
    spacing: 0
    WesterosPhaseCard
    {
        name: "Снабжение"
        source: "qrc:/images/westerosCards/Supply.png"
        description: "Переместите жетоны на треке снабжения. Дома сокращают или распускают войска, которые не могут содержать."


    }
    WesterosPhaseCard
    {
        name: "Сбор войск"
        source: "qrc:/images/westerosCards/Mustering.png"
        description: "Дома создают новые отряды в крепостях и замках"

    }
    WesterosPhaseCard
    {

        name: "Трон из клинков"
        source: "qrc:/images/westerosCards/ThronesofBlades.png"
        description: "Владелец Железного трона приказывает всем Домам либо а) изменить снабжение и состав войск, либо б) собрать войска, либо в) отдыхать, так как ничего не происходит."
        wilding: true

    }
    WesterosPhaseCard
    {
        name: "Зима близко"
        source: "qrc:/images/westerosCards/WinterisComing.png"
        description: "Немедленно перетасуйте эту колоду. Затем вскройте и разыграйте новую карту."
        wilding: true
    }
    WesterosPhaseCard
    {
        name: "Последние дни лета"
        description: "Ничего не происходит."
        wilding: true
        source: "qrc:/images/westerosCards/LastDaysofSummer.png"

    }
}
