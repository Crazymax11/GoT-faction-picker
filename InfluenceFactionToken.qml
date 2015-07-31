import QtQuick 2.0

FactionToken
{
    id: token
    property real speed: 20
    signal animationStopped()

    Drag.onActiveChanged:
    {
        if (Drag.active)
        {
            parAnim.stop()
        }
    }

    ParallelAnimation
    {
        id: parAnim
        running: false
        NumberAnimation { id: xAnim ; target: token; property: "x"; to: 50; duration: 1000; easing.type: Easing.OutQuad}
        NumberAnimation { id: yAnim ; target: token; property: "y"; to: 50; duration: 1000; easing.type: Easing.OutQuad}
        onStarted: parent.z = 100
        onStopped:
        {
            parent.z = 0
            token.animationStopped()
        }
    }
    function move(xpos, ypos)
    {
        var oldx = token.x
        var oldy = token.y
        xAnim.to = xpos
        xAnim.duration = Math.abs(xpos - token.x) * 1000/token.speed
        yAnim.to = ypos
        yAnim.duration = Math.abs(ypos - token.y)/(token.speed / 1000)
        parAnim.start()
    }
}
