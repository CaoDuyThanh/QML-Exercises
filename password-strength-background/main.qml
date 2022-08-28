import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Password Strength Background")
    color: "blue"

    Image {
        id: background
        anchors.fill: parent
        source: "background.jpeg"
        fillMode: Image.PreserveAspectCrop
    }

    FastBlur {
        anchors.fill: background
        source: background
        radius: Math.max(0, 90 - password.text.length * 9)
    }

    Control {
        id: control
        anchors.centerIn: parent
        padding: 40

        background: Rectangle {
            anchors.fill: parent
            color: "white"
            radius: 5
        }

        contentItem: ColumnLayout {
            id: column
            anchors.centerIn: control

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Image Password Strength"
                font.pixelSize: 30
            }

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Change the password to see the effect"
                color: "#4F4F4F"
                font.pixelSize: 14
            }

            Text {
                Layout.topMargin: 20
                Layout.bottomMargin: 10
                text: "Email:"
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40

                Rectangle {
                    anchors.fill: parent
                    border.color: email.focus ? "orange" : "lightgray"
                    border.width: email.focus ? 2 : 1
                    radius: 3
                }

                TextInput {
                    id: email
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignLeft
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: 10
                    text: ""
                }

                Text {
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignLeft
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: 10
                    color: "lightgray"
                    text: "Enter Email"
                    visible: email.text.length > 0 ? false : true
                }
            }

            Text {
                Layout.topMargin: 20
                Layout.bottomMargin: 10
                text: "Password:"

            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.bottomMargin: 30

                Rectangle {
                    anchors.fill: parent
                    border.color: password.focus ? "orange" : "lightgray"
                    border.width: password.focus ? 2 : 1
                    radius: 3
                }

                TextInput {
                    id: password
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignLeft
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: 10
                    text: ""
                    echoMode: TextInput.Password
                }

                Text {
                    anchors.fill: parent
                    horizontalAlignment: TextInput.AlignLeft
                    verticalAlignment: TextInput.AlignVCenter
                    leftPadding: 10
                    color: "lightgray"
                    text: "Enter Password"
                    visible: password.text.length > 0 ? false : true
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                color: "black"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    text: "Submit"
                    color: "white"
                }
            }


        }

    }

}
