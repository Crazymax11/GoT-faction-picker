import QtQuick 2.0

Item
{
    id: root
    x: 0
    y: 0
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
        console.log("freepos")
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

    property var usedPositions: []
    DropArea
    {
        id: dropArea
        anchors.fill: parent
        onDropped:
        {
            drag.source.placeholder = root
            var pos = xypositions.pop()
            console.log(pos)
            console.log(pos["x"])
            usedPositions.push({"name": drag.source.name,
                               "position": pos})
            console.log(drag.source.x)
            console.log(root.x)
            drag.source.x = root.x + root.width * pos["x"]
            drag.source.y = root.y + root.height * pos["y"]
        }
    }

}
