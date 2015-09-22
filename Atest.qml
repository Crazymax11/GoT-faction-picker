import QtQuick 2.3
import QtQuick.Controls 1.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1

ApplicationWindow {
    id: mainWindow
    width: 1024
    height: 768
    title: qsTr("TEST")
    visible: true
    WesterosPhaseFirstDeck
    {
        anchors.fill: parent
    }
}
