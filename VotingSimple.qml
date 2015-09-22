import QtQuick 2.0

Item
{
    id: root

    property var tokens: new Array()

    signal tokenChosed(var token)

    signal votingFinished()


    function getTokenFrom(token)
    {
        tokens.splice(tokens.indexOf(token), 1)
        token.onClicked.disconnect(tokenChosed)
        for(var i=0; i<tokens.length; i++)
        {
            var tok = tokens[i]
            tok.move(tok.parent.width * 0.4 * Math.cos(i*2*Math.PI/tokens.length) + tok.parent.width * 0.4,
                     tok.parent.height * 0.4 * Math.sin(i*2*Math.PI/tokens.length)+ tok.parent.height * 0.4)
        }
        if (tokens.length === 0 )
            votingFinished()
        return token
    }

    function startVoting()
    {
        rotator.start()
        tokensRotator.start()
    }

    function putTokenList(tokenList)
    {
        console.log("tokenList.length " + tokenList.length)
        for(var key in tokenList)
        {
            putTokenInto(tokenList[key])
        }
    }

    function putTokenInto(token)
    {
        token.parent = circleph
        token.dragEnabled = false
        tokens.push(token)
        tokensRotator.target = token
        for(var i=0; i<tokens.length; i++)
        {
            var tok = tokens[i]
            tok.move(tok.parent.width * 0.4 * Math.cos(i*2*Math.PI/tokens.length) + tok.parent.width * 0.4,
                     tok.parent.height * 0.4 * Math.sin(i*2*Math.PI/tokens.length)+ tok.parent.height * 0.4)
        }
        token.onClicked.connect(tokenChosed)
        //token.move(token.parent.width*3/4, token.parent.height*3/4)
    }



    property var voters :{
        "1": 1
    }
    Item
    {
        id: circleph
        anchors.centerIn: parent
        width: height
        height: Math.min(parent.width, parent.height)

        RotationAnimation
        {
            id: rotator
            target: circleph
            duration: 10000
            from: 0;
            to: 360;
            running: false
            loops: Animation.Infinite
        }
        RotationAnimation
        {
            id: tokensRotator
            duration: 10000
            from: 360;
            to: 0;
            loops: Animation.Infinite
            running: true
            direction: RotationAnimation.Counterclockwise
        }
    }



}
