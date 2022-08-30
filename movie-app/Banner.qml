import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: banner
    property alias title: title.text
    property alias background: background.source
    property double score: 0
    property alias overview: overviewText.text
    clip: true
    radius: 3

    Image {
        id: background
        width: parent.width
        height: parent.height - 100
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 100
        color: "#373b69"

        Item {
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            anchors.topMargin: 8
            anchors.bottomMargin: 8

            Text {
                id: title
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.right: parent.right
                font.pixelSize: 22
                color: "white"
                wrapMode: Text.WordWrap
                lineHeight: 1.2
            }

            Rectangle {
                id: scoreRect
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                height: 32
                color: "#22254b"
                width: score.width + 16
                radius: 3

                Text {
                    id: score
                    anchors.centerIn: parent
                    text: banner.score
                    color: banner.score < 8.0 ? "orange" : "lightgreen"
                    font.pixelSize: 18
                }
            }
        }
    }

    Rectangle {
        id: overview
        color: "white"
        radius: 3
        width: parent.width
        height: control.implicitHeight
        state: "hide"

        Behavior on y { PropertyAnimation { duration: 350 } }

        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: overview
                    y: banner.height - overview.height
                }
            },

            State {
                name: "hide"
                PropertyChanges {
                    target: overview
                    y: banner.height
                }
            }
        ]

        Control {
            id: control
            anchors.fill: parent
            topPadding: 32
            bottomPadding: 32
            leftPadding: 32
            rightPadding: 32

            contentItem: Column {
                Text {
                    text: "Overview"
                    topPadding: 16
                    bottomPadding: 16
                    font.pixelSize: 20
                }

                Text {
                    id: overviewText
                    width: parent.width
                    wrapMode: Text.WordWrap
                    lineHeight: 1.2
                    font.pixelSize: 17
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: {
            overview.state = "show";
        }
        onExited: {
            overview.state = "hide";
        }
    }


}
