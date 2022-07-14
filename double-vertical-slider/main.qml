import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 1280
    height: 960
    visible: true
    title: qsTr("Double Vertical Slider")
    property int currentPage: 0

    onCurrentPageChanged: {
        leftScroll.ScrollBar.vertical.position = window.currentPage *  1.0 / 4.0;
        rightScroll.ScrollBar.vertical.position = (3 - window.currentPage) *  1.0 / 4.0;
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: -1

        ScrollView {
            id: leftScroll
            Layout.preferredWidth: window.width / 3.0
            Layout.fillHeight: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            Column {
                width: leftScroll.width
                height: window.height * 4.0

                Rectangle {
                    width: parent.width
                    height: window.height
                    color: "#FD3555"

                    Text {
                        id: text1
                        anchors.centerIn: parent
                        text: "Nature flower"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 40
                    }

                    Text {
                        anchors.horizontalCenter: text1.horizontalCenter
                        anchors.top: text1.bottom
                        topPadding: 10
                        text: "all in pink"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 14
                    }
                }

                Rectangle {
                    width: parent.width
                    height: window.height
                    color: "#2A86BA"

                    Text {
                        id: text2
                        anchors.centerIn: parent
                        text: "Blue Sky"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 40
                    }

                    Text {
                        anchors.horizontalCenter: text2.horizontalCenter
                        anchors.top: text2.bottom
                        topPadding: 10
                        text: "with it's mountains"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 14
                    }
                }

                Rectangle {
                    width: parent.width
                    height: window.height
                    color: "#252E33"

                    Text {
                        id: text3
                        anchors.centerIn: parent
                        text: "Lonely castle"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 40
                    }

                    Text {
                        anchors.horizontalCenter: text3.horizontalCenter
                        anchors.top: text3.bottom
                        topPadding: 10
                        text: "in the wilderness"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 14
                    }
                }

                Rectangle {
                    width: parent.width
                    height: window.height
                    color: "#FFB866"

                    Text {
                        id: text4
                        anchors.centerIn: parent
                        text: "Flying eagle"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 40
                    }

                    Text {
                        anchors.horizontalCenter: text4.horizontalCenter
                        anchors.top: text4.bottom
                        topPadding: 10
                        text: "in the sunset"
                        color: "white"
                        font.family: "Open Sans"
                        font.pixelSize: 14
                    }
                }
            }

            Behavior on ScrollBar.vertical.position { PropertyAnimation { duration: 600; easing.type: Easing.OutQuart } }
        }

        ScrollView {
            id: rightScroll
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOff

            Column {
                id: col
                width: rightScroll.width
                height: window.height * 4.0

                Image {
                    source: "photo4.jpeg"
                    width: parent.width
                    height: window.height
                    fillMode: Image.PreserveAspectCrop
                }

                Image {
                    source: "photo3.jpeg"
                    width: parent.width
                    height: window.height
                    fillMode: Image.PreserveAspectCrop

                }

                Image {
                    source: "photo1.jpeg"
                    width: parent.width
                    height: window.height
                    fillMode: Image.PreserveAspectCrop
                }

                Image {
                    source: "photo2.jpeg"
                    width: parent.width
                    height: window.height
                    fillMode: Image.PreserveAspectCrop
                }
            }

            Component.onCompleted: {
                ScrollBar.vertical.position = (3 - window.currentPage) *  1.0 / 4.0 - 0.0000001;
            }

            Behavior on ScrollBar.vertical.position { PropertyAnimation { duration: 600; easing.type: Easing.OutQuart } }
        }
    }

    FontLoader {
        id: fontLoader
        source: "./fonts/fa-solid-900.ttf"
    }

    RRectangle {
        anchors.top: rowLayout.verticalCenter
        x: window.width / 3.0 - width - 1
        width: 45
        height: 50
        color: "white"
        borderColor: "transparent"
        r: { "r1": 5, "r2": 0, "r3": 0, "r4": 5 }

        Text {
            id: textDown
            anchors.centerIn: parent
            text: "\uf063"
            color: "#aaa"
            font.pixelSize: 15
            font.bold: true
            font.family: fontLoader.name
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onClicked: {
                window.currentPage = (window.currentPage + 3) % 4;
            }

            onEntered: {
                textDown.color = "black";
            }

            onExited: {
                textDown.color = "#aaa"
            }
        }
    }

    RRectangle {
        anchors.bottom: rowLayout.verticalCenter
        x: window.width / 3.0 - 1
        width: 45
        height: 50
        color: "white"
        borderColor: "transparent"
        r: { "r1": 0, "r2": 5, "r3": 5, "r4": 0 }

        Text {
            id: textUp
            anchors.centerIn: parent
            text: "\uf062"
            color: "#aaa"
            font.pixelSize: 15
            font.bold: true
            font.family: fontLoader.name
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onClicked: {
                window.currentPage = (window.currentPage + 1) % 4;
            }

            onEntered: {
                textUp.color = "black";
            }

            onExited: {
                textUp.color = "#aaa"
            }
        }
    }
}
