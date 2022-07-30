import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Form Wave")
    color: "steelblue"

    Rectangle {
        anchors.fill: form
        color: "black"
        opacity: 0.4
        radius: 5
    }

    Item {
        id: form
        anchors.centerIn: parent
        opacity: 1
        width: 380
        implicitHeight: column.implicitHeight +
                        column.anchors.topMargin +
                        column.anchors.bottomMargin

        ColumnLayout {
            id: column
            anchors.fill: parent
            anchors.leftMargin: 40
            anchors.rightMargin: 40
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            width: 380
            spacing: 30

            Text {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                text: "Please Login"
                color: "white"
                font.pixelSize: 30
                font.family: "Muli"

            }

            WaveInput {
                Layout.fillWidth: true
                Layout.topMargin: 10
                Layout.bottomMargin: 40
                placeHolder: "Email"
                color: "white"
                font.family: "Muli"
                font.pixelSize: 16
            }

            WaveInput {
                Layout.fillWidth: true
                Layout.bottomMargin: 20
                placeHolder: "Password"
                color: "white"
                echoMode: TextInput.Password
                font.family: "Muli"
                font.pixelSize: 16
            }

            Button {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                text: "Login"
                flat: true

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }

                Rectangle {
                    anchors.fill: parent
                    color: "lightblue"
                    radius: 3
                }
            }

            Text {
                Layout.fillWidth: true
                font.family: "Muli"
                text: "Don't have an account? Register"
                color: "white"
            }
        }
    }
}
