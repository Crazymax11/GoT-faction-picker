import QtQuick 2.0

Rectangle {
    property int wildingsPower: 0;
    property int const_increase_in_force : 2;
    property int offensive_force : 12;
    Component.onCompleted: wildingsPowerNum.text = wildingsPower;
    onWildingsPowerChanged: {
        if(wildingsPower === offensive_force){
            wildingsPowerNum.text = wildingsPower;
            wildingsOffensive(wildingsPower);
        }else{
            wildingsPowerNum.text = wildingsPower;
        }
    }

   function setWildingsPower(power){
        wildingsPower = power;
   }

   function wildingsPowerGrow(){
       if (wildingsPower < offensive_force)
           setWildingsPower(wildingsPower + const_increase_in_force)
   }

   signal wildingsOffensive(int power)

   Image {
       id: image1
       width: parent.width
       height: parent.height
       source: "qrc:/images/westerosCards/WildingAttack.png"

       Text {
           id: wildingsPowerNum
           x: 36
           y: 34
           color: "#ffffff"
           text: qsTr("0")
           anchors.horizontalCenter: image1.horizontalCenter
           anchors.verticalCenter: image1.verticalCenter
           textFormat: Text.AutoText
           style: Text.Outline
           styleColor: "black"
           font.family: "Times New Roman"
           font.pixelSize: 28           
       }
   }



}

