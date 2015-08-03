import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    id: mainVotingRect
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    visible: true
    color: "#A0FFFFFF"
    property int numbersOfVoting: 0;
    property int starkVote: 0
    property int baratheonVote: 0
    property int greyjoyVote: 0
    property int lannisterVote: 0
    property int martellVote: 0
    property int tyrelVote: 0
    property real squareWidth: 0;
    property var votingArray : new Array()


    Component.onCompleted: {
        votingArray.stark = 1; starkImage.visible = (votingArray.stark == 1)? true : false;
        votingArray.baratheon = 1; baratheonImage.visible = (votingArray.baratheon == 1)? true : false;
        votingArray.greyjoy = 1; greyjoyImage.visible = (votingArray.greyjoy == 1)? true : false;
        votingArray.lannister = 1; lannisterImage.visible = (votingArray.lannister == 1)? true : false;
        votingArray.martell = 1; martellImage.visible = (votingArray.martell == 1)? true : false;
        votingArray.tyrel = 1; tyrelImage.visible = (votingArray.tyrel == 1)? true : false;
        getNumberOfVoting(votingArray);

    }

    function switchRectVisible(n) {
        redRect1.visible = (n == 1) ? true : false;
        redRect2.visible = (n == 2) ? true : false;
        redRect3.visible = (n == 3) ? true : false;
        redRect4.visible = (n == 4) ? true : false;
        redRect5.visible = (n == 5) ? true : false;
        redRect6.visible = (n == 6) ? true : false;
    }
    function getNumberOfVoting(votingArray){
        votingArray.forEach(function(item, i, votingArray) {
            if(item != 0) {
                numbersOfVoting = numbersOfVoting + 1 ;
            }
            squareWidth = (mainVotingRect.width-20)/numbersOfVoting;
            Text1.text = numbersOfVoting;
        })
    }
    function voteCall(votingId){
        // Здесь будет раскрывать формочка с кнопкой и текстинпутом
    }




    ColumnLayout {
        id: column1
        anchors.fill: parent
        Row {
            id: row1
            spacing: 4
            visible: true
            clip: false

            Image{
                id: starkImage
                //width: squareWidth
                //height: squareWidth
                width: 100
                height: 100

                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/stark.png"

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(1);
                        voteCall(1);
                    }
                }
                Rectangle{
                    id: redRect1
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }

            Image{
                id: baratheonImage
                width: squareWidth
                height: squareWidth
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/baratheon.png"
                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(2);
                        voteCall(2);
                    }
                }
                Rectangle{
                    id: redRect2
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }

            Image{
                id: greyjoyImage
                width: squareWidth
                height: squareWidth
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/greyjoy.png"
                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(3);
                        voteCall(3);
                    }
                }
                Rectangle{
                    id: redRect3
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }
            Image{
                id: lannisterImage
                width: squareWidth
                height: squareWidth
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/lannister.png"
                MouseArea {
                    id: mouseArea4
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(4);
                        voteCall(4);
                    }
                }
                Rectangle{
                    id: redRect4
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }
            Image{
                id: martellImage
                width: squareWidth
                height: squareWidth
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/martell.png"
                MouseArea {
                    id: mouseArea5
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(5);
                        voteCall(5);
                    }
                }
                Rectangle{
                    id: redRect5
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }
            Image{
                id: tyrelImage
                width: squareWidth
                height: squareWidth
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 200
                sourceSize.width: 200
                source: "qrc:/images/Houses/tyrel.png"
                MouseArea {
                    id: mouseArea6
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(6);
                        voteCall(6);
                    }
                }
                Rectangle{
                    id: redRect6
                    color: "transparent";
                    width: parent.width
                    height: parent.height
                    border.width: 3
                    border.color: "red"
                    visible:false
                }
            }




        }




    }

    Text {
        id: text1
        x: 32
        y: 49
        text: qsTr("asd");
        font.pixelSize: 12
    }
}
