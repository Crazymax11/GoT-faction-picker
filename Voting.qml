import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    id: mainVotingRect
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    visible: false
    color: "#A0FFFFFF"
    property string curentVoting: "stark"
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
        "stark": starkImage,
        "tyrel": tyrelImage,
        "greyjoy": greyjoyImage,
        "lannister": lannisterImage,
        "baratheon": baratheonImage,
        "martell": martellImage
    }

    function startVoting(){
        mainVotingRect.visible = true;
        disableChecked();
        switchVotingVisible();
    }

   function switchVotingVisible() {
         starkImage.visible = (votingArray.stark == 1)? true : false;
         baratheonImage.visible = (votingArray.baratheon == 1)? true : false;
         greyjoyImage.visible = (votingArray.greyjoy == 1)? true : false;
         lannisterImage.visible = (votingArray.lannister == 1)? true : false;
         martellImage.visible = (votingArray.martell == 1)? true : false;
         tyrelImage.visible = (votingArray.tyrel == 1)? true : false;
    }
   function disableChecked(){
        for(var key in componentArray){
            componentArray[key].checked = false
        }
   }

    function switchRectVisible(n) {
        redRect1.visible = (n == 1) ? true : false;
        redRect2.visible = (n == 2) ? true : false;
        redRect3.visible = (n == 3) ? true : false;
        redRect4.visible = (n == 4) ? true : false;
        redRect5.visible = (n == 5) ? true : false;
        redRect6.visible = (n == 6) ? true : false;
    }    



    function voteCall(votingId){
    curentVoting = votingId
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
            Item{
                property bool checked : false
                id: starkImage
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                    anchors.centerIn: parent
                    width: Math.min(parent.width,parent.height)
                    height: width
                    antialiasing: false
                    clip: false
                    scale: 1
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/Houses/stark.png"
                    MouseArea {
                        id: mouseArea1
                        anchors.fill: parent
                        onClicked: {
                        switchRectVisible(1);
                        voteCall('stark');
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
                    Image{
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        width: parent.width/2
                        source:"qrc:/images/System/check.png"
                        height: width
                        visible: starkImage.checked
                }
            }

            }
            Item{
                property bool checked : false
                id: baratheonImage
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                anchors.centerIn: parent
                width: Math.min(parent.width,parent.height)
                height: width
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.PreserveAspectFit

                source: "qrc:/images/Houses/baratheon.png"
                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(2);
                        voteCall('baratheon');
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
                Image{
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    width: parent.width/2
                    height: width
                    source:"qrc:/images/System/check.png"
                    visible: baratheonImage.checked
                }
            }

            }
            Item{
                id: greyjoyImage
                property bool checked : false
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                anchors.centerIn: parent
                width: Math.min(parent.width,parent.height)
                height: width
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.PreserveAspectFit                
                source: "qrc:/images/Houses/greyjoy.png"
                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(3);
                        voteCall('greyjoy');
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
                Image{
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    width: parent.width/2
                                    height: width
                                    visible: greyjoyImage.checked
                                    source:"qrc:/images/System/check.png"
                                }
            }}
            Item{
                id: lannisterImage
                property bool checked : false
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                anchors.centerIn: parent
                width: Math.min(parent.width,parent.height)
                height: width
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                antialiasing: false
                clip: false
                scale: 1
               fillMode: Image.PreserveAspectFit
                source: "qrc:/images/Houses/lannister.png"
                MouseArea {
                    id: mouseArea4
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(4);
                        voteCall('lannister');
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
                Image{
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    width: parent.width/2
                                    height: width
                                    source:"qrc:/images/System/check.png"
                                    visible: lannisterImage.checked
                                }
            }}
            Item{
                id: martellImage
                property bool checked : false
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                anchors.centerIn: parent
                width: Math.min(parent.width,parent.height)
                height: width
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                antialiasing: false
                clip: false
                scale: 1
               fillMode: Image.PreserveAspectFit                
                source: "qrc:/images/Houses/martell.png"
                MouseArea {
                    id: mouseArea5
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(5);
                        voteCall('martell');
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
                Image{
                                    anchors.bottom: parent.bottom
                                    anchors.right: parent.right
                                    width: parent.width/2
                                    height: width
                                    source:"qrc:/images/System/check.png"
                                    visible: martellImage.checked
                                }
            }}
            Item{
                id: tyrelImage
                property bool checked: false
                Layout.fillWidth: true
                Layout.fillHeight: true
                Image{
                anchors.centerIn: parent
                width: Math.min(parent.width,parent.height)
                height: width
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/Houses/tyrel.png"
                MouseArea {
                    id: mouseArea6
                    anchors.fill: parent
                    onClicked: {
                        switchRectVisible(6);
                        voteCall('tyrel');
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
                Image{
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    width: parent.width/2
                    height: width
                    source:"qrc:/images/System/check.png"
                    visible: tyrelImage.checked
                }
            }}








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

         }
     }
 }}
}
