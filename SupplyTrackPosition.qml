import QtQuick 2.0

Item
{
    id: root
    property real koefTrackHeight: 0.4
    property real koefCountHeight: 0.1
    property real koefBottomHeight: 0.5
    property color backgroudColor: "transparent"
    property string count: "0"
    property var armies: ["0", "0"]
    Rectangle
    {
        anchors.fill: parent
        color: backgroudColor
    }
    Item
    {
        id: track
        height: parent.height * koefTrackHeight
        width: parent.width
        SmartPlaceholder
        {
            anchors.fill: parent

        }
        Image
        {
            anchors.fill: parent
            source: "qrc:/images/tracks/supply.png"
        }
    }
    Item
    {
        id: countItem
        y: track.height
        height: parent.height * koefCountHeight
        width: parent.width
        Rectangle
        {
            opacity: 0.15
            anchors.fill: parent
        }
        Text
        {
            width: parent.width * 7/10
            height: parent.height
            anchors.centerIn: parent
            text: root.count
            fontSizeMode: Text.VerticalFit
            font.pixelSize: width
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Item
    {
        id: bottom
        y: countItem.y + countItem.height
        height: parent.height * koefBottomHeight
        width: parent.width
        Item
        {
            anchors.fill: parent
            property var armies: root.armies
            onArmiesChanged:
            {
                firstArmy.y = bottom.height/2 - firstArmy.height/2 * armies.length
                switch(armies.length)
                {
                case 2:
                    firstArmy.visible = true
                    firstArmy.count = armies[0]
                    secondArmy.visible = true
                    secondArmy.count = armies[1]
                    break
                case 3:
                    firstArmy.visible = true
                    firstArmy.count = armies[0]
                    secondArmy.visible = true
                    secondArmy.count = armies[1]
                    thirdArmy.visible = true
                    thirdArmy.count = armies[2]
                    break
                case 4:
                    firstArmy.visible = true
                    firstArmy.count = armies[0]
                    secondArmy.visible = true
                    secondArmy.count = armies[0]
                    thirdArmy.visible = true
                    thirdArmy.count = armies[2]
                    fourthArmy.visible = true
                    fourthArmy.count = armies[3]
                    break
                case 5:
                    firstArmy.visible = true
                    firstArmy.count = armies[0]
                    secondArmy.visible = true
                    secondArmy.count = armies[0]
                    thirdArmy.visible = true
                    thirdArmy.count = armies[2]
                    fourthArmy.visible = true
                    fourthArmy.count = armies[3]
                    fivethArmy.visible = true
                    fivethArmy.count = armies[4]
                    console.log("5 army")
                    break
                }
            }

            SupplyTrackArmy
            {
                id: firstArmy
            }
            SupplyTrackArmy
            {
                id: secondArmy
                y: firstArmy.y + firstArmy.height + bottom.height/6/6
            }
            SupplyTrackArmy
            {
                id: thirdArmy
                y: secondArmy.y + secondArmy.height + bottom.height/6/6
            }
            SupplyTrackArmy
            {
                id: fourthArmy
                y: thirdArmy.y + thirdArmy.height + bottom.height/6/6
            }
            SupplyTrackArmy
            {
                id: fivethArmy
                y: fourthArmy.y + fourthArmy.height + bottom.height/6/6
            }
        }
    }
}
