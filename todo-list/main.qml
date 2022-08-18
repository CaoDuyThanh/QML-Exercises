import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Todo List")
    color: "#f5f5f5"

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.vertical.policy: contentHeight > height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff
        height: parent.height
        contentHeight: rect.y + rect.height + todoList.height + finalText.height

        Text {
            id: todos
            anchors.horizontalCenter: parent.horizontalCenter
            y: scrollView.height / 2 - height / 2
            text: "todos"
            font.pixelSize: 90
            color: "#B383E2"
            opacity: 0.4
        }

        Rectangle {
            id: rect
            anchors.top: todos.bottom
            anchors.horizontalCenter: todos.horizontalCenter
            anchors.topMargin: 40
            color: "white"
            width: 400
            height: 70
            border.color: "red"
            border.width: textInput.focus ? 2 : 0

            TextInput {
                id: textInput
                anchors.fill: parent
                verticalAlignment: TextInput.AlignVCenter
                leftPadding: 32
                rightPadding: 32
                font.pixelSize: 30
                clip: true

                Keys.onReturnPressed: {
                    if (textInput.text.length > 0) {
                        let component = Qt.createComponent("ToDo.qml");
                        if (component.status === Component.Ready){
                            let todo = component.createObject(todoList);
                            todo.Layout.alignment = Qt.AlignHCenter;
                            todo.width = todoList.width;
                            todo.text = textInput.text;
                            textInput.text = "";
                        } else {
                            console.log("Error creating new component", component.errorString());
                        }
                    }
                }
            }

            Text {
                anchors.fill: textInput
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 30
                leftPadding: 32
                rightPadding: 32
                text: "Enter your todo"
                color: "lightgray"
                visible: textInput.text.length === 0
            }
        }

        ColumnLayout {
            id: todoList
            anchors.top: rect.bottom
            anchors.horizontalCenter: todos.horizontalCenter
            anchors.topMargin: 1
            spacing: 1
            width: 400
        }

        Text {
            id: finalText
            anchors.top: todoList.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
            text: "Left click to toggle completed\nRight click to delete todo"
            color: "darkgray"
        }
    }
}
