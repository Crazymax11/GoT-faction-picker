import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    id: mainVotingRect
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    visible: false
    color: "#A0FFFFFF"
    property string curentVoting
    property var votingArray :{
        "stark": 1,
        "tyrel": 1,
        "greyjoy": 1,
        "lannister": 1,
        "baratheon": 1,
        "martell": 1,
    }
    property var votingResult :{
        "stark": 0,
        "tyrel": 0,
        "greyjoy": 0,
        "lannister": 0,
        "baratheon": 0,
        "martell": 0
    }
    property var componentArray :{
        "stark": stark,
        "tyrel": tyrell,
        "greyjoy": greyjoy,
        "lannister": lannister,
        "baratheon": baratheon,
        "martell": martell
    }

    function startVoting(){
        mainVotingRect.visible = true;
        for(var key in votingArray)
        {
            componentArray[key].visible = (votingArray[key] == 1)? true : false;
            componentArray[key].checked = false
        }
    }

    function voteCall(votingId){
        if (curentVoting in votingArray)
            componentArray[curentVoting].borderVisible = false
        curentVoting = votingId
        componentArray[curentVoting].borderVisible = true
        voting.visible = true
        textInput.text = votingResult[votingId]
    }

    GridLayout {
        id: column1
        visible: true
        rows: 2
        columns:3
        columnSpacing: 3
        rowSpacing: 3
        height: parent.height*(2/3)
        width: parent.width
            VoterToken{
                id: tyrell
                source: "qrc:/images/Houses/tyrel.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("tyrel")
            }
            VoterToken{
                id: stark
                source: "qrc:/images/Houses/stark.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("stark")
            }
            VoterToken{
                id: lannister
                source: "qrc:/images/Houses/lannister.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("lannister")
            }
            VoterToken{
                id: baratheon
                source: "qrc:/images/Houses/baratheon.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("baratheon")
            }
            VoterToken{
                id: greyjoy
                source: "qrc:/images/Houses/greyjoy.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("greyjoy")
            }
            VoterToken{
                id: martell
                source: "qrc:/images/Houses/martell.png"
                Layout.fillWidth: true
                Layout.fillHeight: true
                onClicked: voteCall("martell")
            }
    }


    Item{
         id:voting
         visible : false
         width: parent.width
         height: parent.height*(1/3)
         anchors.top : column1.bottom
         TextInput {
             id: textInput
             x : parent.width*(1/4)
             autoScroll: true
             maximumLength: 2
             validator: IntValidator{bottom: 0; top: 99;}
             anchors.verticalCenter: parent.verticalCenter
             verticalAlignment: TextInput.AlignVCenter
             horizontalAlignment: TextInput.AlignHCenter
             width: parent.width*(1/4)
             height : parent.height*(1/5)
             text: qsTr("Сколько?")
             font.pixelSize: 16
             Rectangle{
                 border.width: 2
                 border.color: "black"
                 anchors.fill: parent
                 color:"transparent"
             }
        }

        Rectangle{
            id:button
            anchors.left : textInput.right
            anchors.verticalCenter: textInput.verticalCenter
            anchors.leftMargin: 2;
            width: parent.width*(1/4)
            height : parent.height*(1/5)
            color:"lightgreen"
            border.width: 2
            border.color: "black"
            Text{
                text:qsTr("Кнопочка")
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    voting.visible = false;
                    votingResult[curentVoting] = textInput.text;
                    componentArray[curentVoting].checked = true;
                    componentArray[curentVoting].borderVisible = false;
                }
            }
        }
    }
}
