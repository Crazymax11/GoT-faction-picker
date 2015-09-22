import QtQuick 2.0
import QtQuick.Layouts 1.1

ColumnLayout
{
    id: root
    spacing: 0
    signal cardChoisen(string name)
    WesterosPhaseCard
    {
        name: "Нашествие одичалых"
        source: "qrc:/images/westerosCards/WildingAttack.png"
        description: "Одичалые наступают за земли Вестероса."
        onCardChoisen: root.cardChoisen(name)
    }
    WesterosPhaseCard
    {
        wilding: true
        name: "Море штормов"
        source: "qrc:/images/westerosCards/SeaofStorms.png"
        description: "В этой фазе замыслов нельзя отдавать приказы набега."
        onCardChoisen: root.cardChoisen(name)

    }
    WesterosPhaseCard
    {
        name: "Дожди осени"
        source: "qrc:/images/westerosCards/RainsofAutumn.png"
        description: "В этой фазе замыслов нельзя отдавать приказы похода +1."
        onCardChoisen: root.cardChoisen(name)
        wilding: true
    }
    WesterosPhaseCard
    {
        name: "Пир для ворон"
        source: "qrc:/images/westerosCards/FeastforCrows.png"
        description: "В этой фазе замыслов нельзя отдавать приказы усиления власти."
        onCardChoisen: root.cardChoisen(name)
        wilding: true
    }
    WesterosPhaseCard
    {
        name: "Паутина лжи"
        description : "В этой фазе замыслов нельзя отдавать приказы подмоги."
        onCardChoisen: root.cardChoisen(name)
        wilding: true
        source: "qrc:/images/westerosCards/WebofLies.png"
    }
    WesterosPhaseCard
    {
        name: "Буря мечей"
        description: "В этой фазе замыслов нельзя отдавать приказы обороны."
        onCardChoisen: root.cardChoisen(name)
        wilding: true
        source: "qrc:/images/westerosCards/StormofSwords.png"
    }
    WesterosPhaseCard
    {
        name: "Преданы мечу"
        description : "Владелец Валирийского меча выбирает одно из условий для этой фазы замыслов: а) не отдаются приказы обороны, б) не отдаются приказы похода +1 или в) ограничений нет."
        source: "qrc:/images/westerosCards/PuttotheSword.png"
        onCardChoisen: root.cardChoisen(name)
    }
}
