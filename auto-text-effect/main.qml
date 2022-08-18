import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Auto Text Effect")
    color: "darksalmon"
    property string text: "We Love Programming!"
    property int curIdx: 10
    property int speed: 1

    Text {
        anchors.centerIn: parent
        text: window.text.slice(0, window.curIdx)
        color: "black"
        font.pixelSize: 30
        font.bold: true
    }

    Timer {
        repeat: true
        running: true
        interval: 500 / window.speed
        onTriggered: {
            window.curIdx = (window.curIdx + 1) % (window.text.length + 1);
        }
    }

    Item {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        width: 150
        height: 50

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: 0.1
        }

        Row {
            anchors.centerIn: parent
            spacing: 5

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "Speed:"
                font.pixelSize: 20
            }

            Rectangle {
                width: 50
                height: 31
                color: "darksalmon"

                Row {
                    anchors.centerIn: parent
                    spacing: 5

                    Text {
                        text: window.speed
                        font.pixelSize: 20
                    }

                    Column {
                        anchors.verticalCenter: parent.verticalCenter
                        Rectangle {
                            id: up
                            width: 15
                            height: 10
                            color: "#F9F9F9"

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    up.color = "lightgray";
                                }
                                onExited: {
                                    up.color = "#F9F9F9";
                                }
                                onClicked: {
                                    window.speed = Math.min(10, window.speed + 1);
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                text: "\uf0d8"
                            }
                        }

                        Rectangle {
                            id: down
                            width: 15
                            height: 10
                            color: "#F9F9F9"

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    down.color = "lightgray";
                                }
                                onExited: {
                                    down.color = "#F9F9F9";
                                }
                                onClicked: {
                                    window.speed = Math.max(1, window.speed - 1);
                                }
                            }

                            Text {
                                anchors.centerIn: parent
                                text: "\uf0d7"
                            }
                        }
                    }
                }
            }
        }
    }
}
