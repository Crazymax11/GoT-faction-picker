import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 768
    property bool isStarted: false
    property var factions : ["Stark", "Lannister", "Baratheon", "Martell", "GreyJoy", "Tyrell"]
    Rectangle
    {
        id: btn
        width: 200
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "red"
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                if (mainWindow.isStarted == false)
                {
                    votecomp.startVoting()
                    mainWindow.isStarted = true
                }
                var token = swordTrack.factions[mainWindow.factions.pop()]

                votecomp.putTokenInto(token)
            }
        }
    }
    InfluenceTrack
    {
        id: swordTrack
        width: parent.width/5
        height: parent.height
        anchors.right: parent.right
        imageSrc: "qrc:/images/sword.png"
        verticalOrientation: true
    }
    VotingSimple
    {
        id:  votecomp
        anchors.left: btn.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: swordTrack.left
        property int chosNum: 0
        onVotingFinished: console.log("finished")
        onChosNumChanged:
        {
            if (chosNum===6)
                votecomp.votingFinished()
        }

        onTokenChosed:
        {
            console.log("CHOSED")
            var tok = votecomp.getTokenFrom(token)
            tok.placeholder = undefined
            tok.parent = swordTrack
            tok.dragEnabled = true
            //дичь код
            swordTrack.putFaction(tok, swordTrack.slots[chosNum])
            chosNum = chosNum + 1
        }
    }
}
