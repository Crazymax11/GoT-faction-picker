import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle{
    id: mainRect
    anchors.verticalCenterOffset: 0
    anchors.horizontalCenterOffset: 0
    visible: true
    color: "#A0FFFFFF"
    function switchRectVisible(n) {
           redRect1.visible = (n == 1) ? true : false;
           redRect2.visible = (n == 2) ? true : false;
           redRect3.visible = (n == 3) ? true : false;
           redRect4.visible = (n == 4) ? true : false;
           redRect5.visible = (n == 5) ? true : false;
           }

    ColumnLayout {
        id: column1
        anchors.fill: parent
        Row {
            id: row1

            Layout.fillWidth: true
            Layout.preferredHeight: (width - 20)/5
            spacing: 4
            visible: true
            clip: false

            Image {
                id: image1
                width: (column1.width-20)/5
                height: (column1.width-20)/5
                visible: true
                antialiasing: false
                clip: false
                scale: 1
                fillMode: Image.Stretch
                sourceSize.height: 100
                sourceSize.width: 100
                source: "qrc:/images/Orders/2.png"

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                    Component.onCompleted:{
                        text1.text = "Усиление власти"
                                                             text2.text = "Позволяет игроку получить жетон власти, который можно использовать для усиления влияния"
                                                             switchRectVisible(1);
                    }

                    onClicked: { text1.text = "Усиление власти"
                                 text2.text = "Позволяет игроку получить жетон власти, который можно использовать для усиления влияния"
                                 switchRectVisible(1);
                         }

                }



                Rectangle
                {
                 id: redRect1
                 color: "transparent";
                 width: parent.width
                 height: parent.height
                 border.width: 3
                 border.color: "red"
                 visible:false

                }

            }

            Image {
                id: image5
                width:  (column1.width-20)/5
                height:  (column1.width-20)/5
                sourceSize.height: 100
                antialiasing: false
                source: "qrc:/images/Orders/1.png"
                clip: false
                scale: 1
                sourceSize.width: 100

                MouseArea {
                    id: mouseArea2
                    anchors.fill: parent
                    onClicked: { text1.text = "Набег"
                                 text2.text = "Игрок может снять вражеский приказ набега, подмоги и усиления власти из соседней области"
                                   switchRectVisible(2);

                    }
                }

                Rectangle
                {
                 id:redRect2
                 color: "transparent";
                 width: parent.width
                 height: parent.height
                 border.width: 3
                 border.color: "red"
                 visible:false

                }


            }

            Image {
                id: image4
                width:  (column1.width-20)/5
                height:  (column1.width-20)/5

                sourceSize.height: 100
                antialiasing: false
                source: "qrc:/images/Orders/3.png"
                clip: false
                scale: 1
                sourceSize.width: 100

                MouseArea {
                    id: mouseArea3
                    anchors.fill: parent
                    onClicked: { text1.text = "Марш"
                                 text2.text = "Дает отрядам возможность перемещаться из одной области в другую, вступая в сражение, если там находятся отряды другого Дома"
                                    switchRectVisible(3);
                    }
                }
                Rectangle
                {
                    id:redRect3
                 color: "transparent";
                 width: parent.width
                 height: parent.height
                 border.width: 3
                 border.color: "red"
                 visible:false

                }
            }

            Image {
                id: image2
                width: (column1.width-20)/5
                height:  (column1.width-20)/5

                sourceSize.height: 100
                antialiasing: false
                source: "qrc:/images/Orders/4.png"
                clip: false
                scale: 1
                sourceSize.width: 100

                MouseArea {
                    id: mouseArea4
                    anchors.fill: parent
                    onClicked: { text1.text = "Подмога"
                                 text2.text = "Дает отрядам возможность участвовать в сражениях, проходящих в соседних регионах"
                                   switchRectVisible(4);
                    }
                }
                Rectangle
                {
                    id:redRect4
                 color: "transparent";
                 width: parent.width
                 height: parent.height
                 border.width: 3
                 border.color: "red"
                    visible:false
                }
            }

            Image {
                id: image3
                width:  (column1.width-20)/5
                height:  (column1.width-20)/5

                sourceSize.height: 100
                antialiasing: false
                source: "qrc:/images/Orders/5.png"
                clip: false
                scale: 1
                sourceSize.width: 100

                MouseArea {
                    id: mouseArea5
                    anchors.fill: parent
                    onClicked: { text1.text = "Оборона"
                                 text2.text = "Дает отрядам бонус к защите, если в их область был совершен поход вражеских отрядов"
                                    switchRectVisible(5);
                    }
                }
                Rectangle
                {
                    id:redRect5
                 color: "transparent";
                 width: parent.width
                 height: parent.height
                 border.width: 3
                 border.color: "red"
                    visible:false
                }
            }
        }

        Rectangle {
            id: row2
            color: "transparent"
            border.width: 2
            border.color: "black"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                id: text1
                height: parent.height * 0.2
                text: qsTr("НАЗВАНИЕ ПРИКАЗА")
                anchors.top : row2.top
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 70
                font.bold: true
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }

            Text {
                id: text2
                font.pointSize: 90
                anchors.top : text1.bottom
                width: parent.width
                anchors.bottom: parent.bottom
                font.bold: true
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap


            }
        }
    }
}

