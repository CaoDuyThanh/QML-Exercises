import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Netflix Mobile Navigation")

    property bool openSidebar: false

    FontLoader {
        id: fa5
        source: "./fonts/fa-solid-900.ttf"
    }

    Column {
        anchors.centerIn: parent

        Text {
            text: "Logo"
        }

        Text {
            text: "MOBILE NAVIGATION"
        }
    }

    Text {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 16
        anchors.leftMargin: 16

        text: "\uf0c9"
        font.family: fa5.name
        font.styleName: "Solid"
        font.pixelSize: 25

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                window.openSidebar = true;
            }
        }
    }

    Rectangle {
        id: blackRect
        width: 433 + 50
        height: parent.height
        color: "black"
        state: window.openSidebar ? "show" : "hide"

        states: [
            State {
                name: "hide"
                PropertyChanges { target: blackRect ; x: - blackRect.width }
            },

            State {
                name: "show"
                PropertyChanges { target: blackRect ; x: 0 }
            }
        ]

        transitions: [
            Transition {
                from: "hide"; to: "show"
                SequentialAnimation {
                    PauseAnimation { duration: 0 }
                    NumberAnimation { properties: "x"; duration: 350 }
                }
            },

            Transition {
                from: "show"; to: "hide"
                SequentialAnimation {
                    PauseAnimation { duration: 500 }
                    NumberAnimation { properties: "x"; duration: 250 }
                }
            }
        ]
    }

    Rectangle {
        id: redRect
        width: 433 + 25
        height: parent.height
        color: "red"
        state: window.openSidebar ? "show" : "hide"

        Behavior on x {
            SequentialAnimation {
                PauseAnimation { duration: 250 }
                PropertyAnimation { duration: 250 }
            }
        }

        states: [
            State {
                name: "hide"
                PropertyChanges { target: redRect ; x: - blackRect.width }
            },

            State {
                name: "show"
                PropertyChanges { target: redRect ; x: 0 }
            }
        ]
    }

    Rectangle {
        id: whiteRect
        width: 433
        height: parent.height
        color: "white"
        state: window.openSidebar ? "show" : "hide"

        states: [
            State {
                name: "hide"
                PropertyChanges { target: whiteRect ; x: - blackRect.width}
            },

            State {
                name: "show"
                PropertyChanges { target: whiteRect ; x: 0 }
            }
        ]

        transitions: [
            Transition {
                from: "hide"; to: "show"
                SequentialAnimation {
                    PauseAnimation { duration: 500 }
                    NumberAnimation { properties: "x"; duration: 250 }
                }
            },

            Transition {
                from: "show"; to: "hide"
                SequentialAnimation {
                    PauseAnimation { duration: 0 }
                    NumberAnimation { properties: "x"; duration: 250 }
                }
            }
        ]

        Control {
            id: control
            anchors.fill: parent
            topPadding: 40
            bottomPadding: 40
            leftPadding: 40
            rightPadding: 40

            contentItem: Column {
                spacing: 30

                Text {
                    text: "Logo"
                }

                Text {
                    text: "TEAMS"
                }

                Text {
                    text: "LOCATIONS"
                }

                Text {
                    text: "LIFT AT NETFLIX"
                }

                Text {
                    leftPadding: 20
                    text: "NETFLIX CULTURE MEMO"
                }

                Text {
                    leftPadding: 20
                    text: "WORK LIFE BALANCE"
                }

                Text {
                    leftPadding: 20
                    text: "INCLUSIONI & DIVERSITY"
                }

                Text {
                    leftPadding: 20
                    text: "BLOG"
                }
            }
        }

        Text {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 40
            anchors.rightMargin: 20

            text: "\uf00d"
            color: "gray"
            font.family: fa5.name
            font.styleName: "Solid"
            font.pixelSize: 25

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    window.openSidebar = false;
                }
            }
        }
    }


}
