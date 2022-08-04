import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Background Slider")
    property int currentInd: 2

    FontLoader {
        id: fontLoader
        source: "./fonts/fa-solid-900.ttf"
    }

    Item {
        id: background
        anchors.fill: parent

        Item {
            anchors.fill: background

            FadeInOutImage {
                id: image
                anchors.fill: parent
                source: "./image" + (window.currentInd + 1) + ".jpg"
                fillMode: Image.PreserveAspectCrop
                duration: 350
            }

            BrightnessContrast {
               anchors.fill: parent
               source: image
               brightness: -0.5
               contrast: 0.2
            }

            Rectangle {
                id: blurMask
                visible: false
                anchors.fill: parent
                color: "transparent"

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width * 0.7
                    height: parent.height * 0.7
                    color: "white"
                }
            }

            OpacityMask {
                id: opacityMask
                anchors.fill: parent
                source: image
                maskSource: blurMask
            }
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width / 2 * 0.3 - width
            width: 70
            height: 78
            border.color: "orange"
            border.width: 2
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    window.currentInd = (window.currentInd - 1 + 5) % 5;
                    console.log(window.currentInd);
                }
            }

            Text {
                anchors.centerIn: parent
                text: "\uf060"
                color: "white"
                font.family: fontLoader.name
                font.styleName: "Solid"
                font.pixelSize: 30
            }
        }

        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width - parent.width / 2 * 0.3
            width: 70
            height: 78
            border.color: "orange"
            border.width: 2
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    window.currentInd = (window.currentInd + 1) % 5;
                    console.log(window.currentInd);
                }
            }

            Text {
                anchors.centerIn: parent
                text: "\uf061"
                color: "white"
                font.family: fontLoader.name
                font.styleName: "Solid"
                font.pixelSize: 30
            }
        }
    }
}
