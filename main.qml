import QtQuick 2.12
import QtQuick.Window 2.12


Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("JSON colors")
    Rectangle{
        id: background
        anchors.fill: parent
        color: "#354a4a"
    }
    JsonColors{
        anchors.rightMargin: 3
        anchors.leftMargin: 3
        anchors.bottomMargin: 3
        anchors.topMargin: 3
        anchors.fill: parent
    }
}
