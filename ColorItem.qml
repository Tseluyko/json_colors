import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.0
import json.colors 1.0

Item {
    property alias color: btn.color
    property alias objectName: objectLabel.objectName
    property JSObjectStorage modelRef: null
    id: element
    Text {
        id: objectLabel
        property string objectName: "name"
        text: objectName
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        width: parent.width * 0.6
    }
    Button{
        id: btn
        property string color: "#000000"
        anchors.left: objectLabel.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        width: parent.width * 0.2
        background: Rectangle{
            anchors.fill: parent
            color: btn.color
            radius: 5
            border.width: 1
        }

        onClicked: {
            colorDialog.setColor(btn.color)
            colorDialog.open()
        }
    }
    Text {
        id: currentColor
        anchors.left: btn.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        width: parent.width * 0.2
        text: btn.color
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        font.family: "Arial"
    }
    ColorDialog {
        id: colorDialog
        title: "Please choose a color"
        visible: false
        showAlphaChannel: true
        onAccepted: {
            modelRef.setElementColor(objectLabel.objectName, color)
        }
    }
}
