import QtQuick 2.0

Item
{
    property string imSrc
    property var events: new Array()
    signal choisenEvent(var ev)
    property bool isClickable
    function setDeck(deck)
    {
        events = deck.slice()
        shuffleDeck()
    }
    function shuffleDeck()
    {
        console.log('deck shuffled')
        for(var j, x, i = events.length; i; j = Math.floor(Math.random() * i), x = events[--i], events[i] = events[j], events[j] = x);
    }

    function getEvent()
    {
        choisenEvent(events[0])
        events = events.slice(1).concat(events.slice(0,1));
        if (events[events.length - 1].shuffle)
            shuffleDeck()
    }

    Image
    {
        source: parent.imSrc
        anchors.fill: parent
    }
    MouseArea
    {
        anchors.fill: parent
        onClicked: getEvent()
        enabled: parent.isClickable
    }
}
