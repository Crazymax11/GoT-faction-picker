import QtQuick 2.0

Item {
    ThroneTrack
    {
        width: parent.width
        height: parent.height / 5
        y: parent.height * 2/5
        x: 0
    }
    SwordTrack
    {
        width: parent.width
        height: parent.height / 5
        y: parent.height * 3/5
        x: 0
    }
    RavenTrack
    {
        width: parent.width
        height: parent.height / 5
        y: parent.height * 4/5
        x: 0
    }
}
