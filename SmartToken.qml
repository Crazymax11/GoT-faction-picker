import QtQuick 2.3

Item
{
    id: root
    property string name: "default"
    property string source: "default-image.png"
    property var placeholder: undefined

    property var oldPh: null
    width: 80
    height: width
    Drag.hotSpot.x: width/2
    Drag.hotSpot.y: height/2
    Drag.active: dragArea.drag.active

    onPlaceholderChanged:
    {
        if (oldPh)
            oldPn.freePos()
        oldPh = placeholder
    }

    Behavior on x
    {
        NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 1000
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.OutBounce
                    }
    }
    Behavior on y
    {
        NumberAnimation {
                        //This specifies how long the animation takes
                        duration: 1000
                        //This selects an easing curve to interpolate with, the default is Easing.Linear
                        easing.type: Easing.OutBounce
                    }
    }

    Image
    {
        source: parent.source
        anchors.fill: parent
    }
    MouseArea
    {
        id: dragArea
        anchors.fill: parent
        drag.target: parent
        drag.minimumY: 0
        drag.maximumY: parent.parent.height - parent.height
        drag.minimumX: 0
        drag.maximumX: parent.parent.width - parent.width
        onReleased:
        {
            var newx = root.x
            var newy = root.y
            root.x = newx
            root.y = newy
            parent.Drag.drop()
        }
    }
}
