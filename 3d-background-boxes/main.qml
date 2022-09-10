import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    width: 800
    height: 800
    visible: true
    title: qsTr("3D Background Boxes")

    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 4
        rows: 4
        spacing: 32
        property double angle: 0

        Behavior on spacing { NumberAnimation { duration: 350 } }
        Behavior on angle { NumberAnimation { duration: 350 } }

        Repeater {
            model: 16

            delegate: Item {
                width: 125
                height: 125

                transform: Rotation { origin.x: 125 / 2; origin.y:  125 / 2; axis { x: 0; y: 0; z: 1 } angle: grid.angle }

                FilterGif {
                    id: gif
                    width: 125
                    height: 125

                    gifWidth: 125 * 4
                    gifHeight: 125 * 4

                    xStart: (index % 4) * 0.25
                    yStart: Math.floor(index / 4) * 0.25
                }

                Rectangle {
                    anchors.left: gif.right
                    height: 125
                    width: 16
                    color: "#f6e58d"

                    transform: Matrix4x4 {
                        property real a: Math.PI / 4
                        matrix: Qt.matrix4x4(1, 0, 0, 0,
                                             1, 1, 0, 0,
                                             0, 0, 1, 0,
                                             0, 0, 0, 1)
                    }
                }

                Rectangle {
                    anchors.top: gif.bottom
                    height: 16
                    width: 125
                    color: "#f9ca24"

                    transform: Matrix4x4 {
                        property real a: Math.PI / 4
                        matrix: Qt.matrix4x4(1, 1, 0, 0,
                                             0, 1, 0, 0,
                                             0, 0, 1, 0,
                                             0, 0, 0, 1)
                    }
                }
            }
        }
    }

    DropShadow {
        anchors.fill: buttonMagic
        source: buttonMagic
        color: "#f6e58d"
        radius: 5
        samples: 5
    }

    Rectangle {
        id: buttonMagic
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        color: "#f9ca24"
        height: magicText.height + 12 * 2
        width: magicText.width + 20 * 2

        Text {
            id: magicText
            anchors.centerIn: parent
            text: "Magic 🎩"
            color: "white"
            font.pixelSize: 18
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if (grid.spacing === 32) {
                    grid.spacing = 0;
                    grid.angle = 360;
                } else {
                    grid.spacing = 32;
                    grid.angle = 0;
                }
            }
        }
    }
}
