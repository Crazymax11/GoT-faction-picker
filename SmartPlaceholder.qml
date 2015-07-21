import QtQuick 2.0

Item
{
    id: root
    x: 0
    y: 0
    property var positionBase: root
    property var xypositions: [
        {"x": 0.25, "y": 1/6},
        {"x": 0.75, "y": 1/6},
        {"x": 0.25, "y": 3/6},
        {"x": 0.75, "y": 3/6},
        {"x": 0.25, "y": 5/6},
        {"x": 0.75, "y": 5/6}
    ]

    function freePos(name)
    {
        for(var i = 0; i < usedPositions.length; i++)
        {
            if (usedPositions[i]["name"] === name)
            {
                xypositions.push(usedPositions[i]["position"])
                usedPositions.splice(i,1)
                return;
            }
        }
    }

    function putToken(token)
    {
        token.placeholder = root
        var pos = xypositions.pop()
        usedPositions.push({"name": token.name,
                           "position": pos})
        token.x = Qt.binding( function()
        {
            return positionBase.x + root.width * pos["x"]
        }
            )
        //token.x = positionBase.x + root.width * pos["x"]
        token.y = Qt.binding( function()
        {
            return positionBase.y + root.height * pos["y"]
        }
            )
        //token.y = positionBase.y + root.height * pos["y"]
    }

    property var usedPositions: []
    DropArea
    {
        id: dropArea
        anchors.fill: parent
        onDropped: putToken(drag.source)

    }

}
