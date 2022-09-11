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

            ColumnLayout {
                id: note
                width: 400
                height: 400
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 37
                    color: "#9ec862"

                    Row {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        spacing: 10

                        Text {
                            text: "\uf044"
                            color: "white"
                            font.family: fa5.name
                            font.pixelSize: 20

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    textField.readOnly = !textField.readOnly;
                                }
                            }
                        }

                        Text {
                            text: "\uf2ed"
                            color: "white"
                            font.family: fa5.name
                            font.pixelSize: 20

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    note.destroy();
                                }
                            }
                        }
                    }
                }

                TextField {
                    id: textField
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    background: Rectangle { color: "white" }
                    verticalAlignment: TextField.AlignTop
                }
            }

        }
    }
}
