import QtQuick 2.0

Item
{
    id: root
    property real count: 1
    signal gameOver ()
    Rectangle
    {
        anchors.fill: parent
        radius: width/2
        color: "lightgrey"
        border.width: 2
        border.color: "grey"
        Image
        {
            id: image
            anchors.fill: parent
            anchors.margins: 5
            source: "qrc:/images/turn.png"
            RotationAnimation
            {
                target: image
                id: animation
                from: 0
                to: 360
                duration: 1000
                onStopped:
                {
                    root.count += 1
                    marea.enabled = true
                    if (root.count == 11)
                        root.gameOver()
                }
            }
            Text
            {
                anchors.centerIn: parent
                width: parent.width * 5/10
                height: parent.height * 5/10
                text: root.count
                fontSizeMode: Text.VerticalFit
                font.pixelSize: width
                horizontalAlignment: Text.AlignHCenter
            }
        }
        MouseArea
        {
            id: marea
            anchors.fill: parent
            enabled: true
            onClicked:
            {
                console.log("clicked")
                animation.start()
                enabled = false
            }
        }
    }

}
