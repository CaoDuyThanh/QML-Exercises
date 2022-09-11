import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 1000
    height: 900
    visible: true
    title: qsTr("Notes App")
    color: "#7bdaf3"

    FontLoader {
        id: fa5
        source: "./fonts/fa-solid-900.ttf"
    }

    Rectangle {
        id: button
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 16
        anchors.topMargin: 16

        color: "#9ec862"
        width: 100
        height: 32

        Text {
            anchors.centerIn: parent
            color: "white"
            text: "+ Add note"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                scrollView.addNote();
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.top: button.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.bottomMargin: 20

        Flow {
            id: flow
            width: scrollView.width
            spacing: 20
        }

        function addNote() {
            var component;
            var note;
            component = Qt.createComponent("Note.qml");
            if (component.status === Component.Ready){
                note = component.createObject(flow);
                note.width = 400;
                note.height = 400;
            } else {
                console.log("Error creating new component", component.errorString());
            }
        }

        Component.onCompleted: {
            addNote();
        }
    }
}
