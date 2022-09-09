import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Event Keycodes")
    color: "#e1e1e1"
    property var currentKey: null

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: (event) => {
            window.currentKey = event;
        }
    }

    Item {
        anchors.centerIn: parent
        height: 70
        width: txt.width + 24 * 2
        visible: window.currentKey === null

        DropShadow {
            anchors.fill: introBox
            source: introBox
            color: "lightgray"
            samples: 5
            radius: 3
        }

        Rectangle {
            id: introBox
            anchors.fill: parent
            border.color: "#999"
            color: "#eee"

            Text {
                id: txt
                anchors.centerIn: parent
                text: "Press any key to get the keyCode"
                font.pixelSize: 20
            }
        }
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 16
        visible: window.currentKey !== null

        ColumnLayout {
            width: 150

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "event.key"
                color: "#555"
                font.pixelSize: 13
            }

            Item {
                width: parent.width
                height: 70

                DropShadow {
                    anchors.fill: parent
                    source: rect1
                    color: "gray"
                    samples: 17
                    radius: 5
                }

                Rectangle {
                    id: rect1
                    anchors.fill: parent
                    border.color: "#999"
                    color: "#eee"

                    Text {
                        anchors.centerIn: parent
                        text: window.currentKey !== null ? window.currentKey.key : ""
                        font.pixelSize: 22
                    }
                }
            }
        }


        ColumnLayout {
            width: 150

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "event.nativeScanCode"
                color: "#555"
                font.pixelSize: 13
            }

            Item {
                width: parent.width
                height: 70

                DropShadow {
                    anchors.fill: parent
                    source: rect2
                    color: "gray"
                    samples: 17
                    radius: 5
                }

                Rectangle {
                    id: rect2
                    anchors.fill: parent
                    border.color: "#999"
                    color: "#eee"

                    Text {
                        anchors.centerIn: parent
                        text:  window.currentKey !== null ? window.currentKey.nativeScanCode : ""
                        font.pixelSize: 22
                    }
                }
            }
        }

        ColumnLayout {
            width: 150

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "event.text"
                color: "#555"
                font.pixelSize: 13
            }

            Item {
                width: parent.width
                height: 70

                DropShadow {
                    anchors.fill: parent
                    source: rect3
                    color: "gray"
                    samples: 17
                    radius: 5
                }

                Rectangle {
                    id: rect3
                    anchors.fill: parent
                    border.color: "#999"
                    color: "#eee"

                    Text {
                        anchors.centerIn: parent
                        text: window.currentKey !== null ? window.currentKey.text : ""
                        font.pixelSize: 22
                    }
                }
            }


        }
    }

}
