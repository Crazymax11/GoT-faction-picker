import QtQuick 2.0

WesterosCardEffect {
    id: root
    name: "Битва королей"
    description: "Все дома вступают в борьбу за влияние"
    property alias voting : votingElement
    property var tracks: []
    property int currenttrackIndex: 0
    property int numOfChosen: 0
    signal votingFinished()

    function startVoting()
    {
        numOfChosen = 0
        votingElement.putTokenList(tracks[currenttrackIndex].factions)
        votingElement.startVoting()
    }
    function finishVoting()
    {
        currenttrackIndex++
        if (currenttrackIndex < tracks.length)
            startVoting()
        else
            root.votingFinished()
    }

    function returnToken(token)
    {
        votingElement.getTokenFrom(token)
        token.parent = tracks[currenttrackIndex]
        token.placeholder = undefined
        token.dragEnabled = true
        tracks[currenttrackIndex].putFaction(token, tracks[currenttrackIndex].slots[numOfChosen])
        numOfChosen++
        console.log("numOfChosen " + numOfChosen)
        console.log("tracks[currenttrackIndex].factions.length " + tracks[currenttrackIndex].factions.length)
        if (numOfChosen === Object.keys(tracks[currenttrackIndex].factions).length)
            finishVoting()
    }

    states:
    [
        State
        {
            name: "throne track voting"
        },
        State
        {
            name: "sword track voting"
        },
        State
        {
            name: "raven track voting"
        }
    ]
    Item
    {

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        VotingSimple
        {
            id: votingElement
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height)
            height: width
            onTokenChosed: root.returnToken(token)
        }
    }
}
