import QtQuick 2.3

Item
{
    id: root
    width: 0
    height: 0
    property real tokenWidth: 80
    property real tokenHeight: tokenWidth

    property string name: "default"
    property string source: "default-image.png"
    property var placeholder: undefined

    property var oldPh: null
    Drag.hotSpot.x: width/2
    Drag.hotSpot.y: height/2
    Drag.active: dragArea.drag.active

    onPlaceholderChanged:
    {
        if ((oldPh !== undefined) && (oldPh !== null))
            oldPh.freePos(name)
        oldPh = placeholder
    }
    Behavior on x
    {
        NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 1000
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.Linear
                    }
    }
    Behavior on y
    {
        NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 1000
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.Linear
                    }
    }
    Item
    {
        id: token

        width: root.tokenWidth
        height: root.tokenHeight

        anchors.centerIn: root



        Image
        {
            source: root.source
            anchors.fill: token
        }
        MouseArea
        {
            id: dragArea
            anchors.fill: token
            drag.target: root
            drag.minimumY: 0
            drag.maximumY: root.parent.height - root.height
            drag.minimumX: 0
            drag.maximumX: root.parent.width - root.width
            onReleased:
            {
                var newx = root.x
                var newy = root.y
                root.x = newx
                root.y = newy
                root.Drag.drop()
            }
        }
    }
}


