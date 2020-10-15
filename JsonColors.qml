import QtQuick 2.0
import QtQuick.Controls 2.12
import json.colors 1.0

Item {    
    property string textColor: "#ffffff"
    property string backgoundTextColor: "#5e7575"
    property string backgoundFieldColor: "#8ca4a4"
    Rectangle{
        id: jsonBg
        width: parent.width / 2 - 3
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.left: parent.left
        anchors.leftMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 3
        color: backgoundTextColor
        Text {
            id: labelJson
            text: qsTr("Input JSON here:")
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
        }
        Rectangle{
            id: js_text_background
            anchors.top: labelJson.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0
            color: backgoundFieldColor
            TextArea{
                id: jsTextField
                wrapMode: Text.WrapAnywhere
                anchors.fill: parent
                selectByKeyboard: true
                selectByMouse: true
                onTextChanged:
                {
                    jsModel.updateData(text)
                }
            }
        }
    }
    Rectangle{
        id: colorListBg
        anchors.left: jsonBg.right
        anchors.leftMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 3
        anchors.right: parent.right
        anchors.rightMargin: 3
        color: backgoundTextColor
        Text {
            id: labelColors
            text: qsTr("Colors:")
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
        }
        Rectangle{
            id: listViewBackground
            anchors.top: labelColors.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0
            color: backgoundFieldColor
            ListView {
                anchors.fill: parent
                id: listView
                spacing: 1
                model: jsModel
                clip: true
                delegate: ColorItem {
                    implicitHeight: 20
                    implicitWidth: listView.width
                    objectName: model.objectName
                    color: model.objectColor
                    modelRef: jsModel
                }
            }
        }
    }

    JSObjectStorage {
        id: jsModel
        onJsonChanged: {
            jsTextField.text = jsStr
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
