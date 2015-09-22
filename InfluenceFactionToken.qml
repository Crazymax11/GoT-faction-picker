import QtQuick 2.0

FactionToken
{
    id: token
    property real speed: 20
    signal animationStopped()

    property bool isStoppedManually: false

    Behavior on x {

                NumberAnimation {
                    //This specifies how long the animation takes
                    duration: 600
                    //This selects an easing curve to interpolate with, the default is Easing.Linear
                    easing.type: Easing.OutQuad
                }
            }
    Behavior on y {

                NumberAnimation {
                    //This specifies how long the animation takes
                    duration: 600
                    //This selects an easing curve to interpolate with, the default is Easing.Linear
                    easing.type: Easing.OutQuad
                }
            }
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
            if (!isStoppedManually)
                token.animationStopped()
           isStoppedManually = false
        }
    }
    function move(xpos, ypos)
    {
        x = xpos
        y = ypos
        //старый метод
//        if (parAnim.running)
//        {
//            isStoppedManually = true
//            parAnim.stop()
//        }
//        var oldx = token.x
//        var oldy = token.y
//        var speed = token.speed
//        xAnim.to = xpos
//        var duration = Math.abs(xpos - token.x) * 1000/token.speed
//        xAnim.duration = duration
//        yAnim.to = ypos
//        duration = Math.abs(ypos - token.y)/(token.speed / 1000)
//        yAnim.duration = duration
//        parAnim.start()

    }
}
