import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Animated Countdown")
    property QtObject currentObj: txtOne
    property int currentNumber: 3
    property double angle: 0

    Behavior on angle { NumberAnimation { duration: 1000; easing.type: Easing.InOutBack } }

    Item {
        id: countdown
        anchors.centerIn: parent
        property double scale: 1

        transform: Scale { origin.x: countdown.width / 2; origin.y: 0; xScale: countdown.scale; yScale: countdown.scale}

        Behavior on scale { NumberAnimation { duration: 100 } }

        function reset() {
            window.currentObj = txtOne;
            window.currentNumber = 3;
            txtOne.text = window.currentNumber;
            window.angle = 0;
        }

        function start() {
            timer.counter = 0;
            timer.start();
        }

        Item {
            id: number
            anchors.horizontalCenter: parent.horizontalCenter
            height: txtOne.height - 2
            width: textReady.width
            clip: true

            Text {
                id: txtOne
                anchors.horizontalCenter: parent.horizontalCenter
                text: window.currentNumber
                font.pixelSize: 40
                font.bold: true
                color: "#3498db"
                transform: Rotation { origin.x: txtOne.width / 2; origin.y: txtOne.height + 8; axis { x: 0; y: 0; z: 1 } angle: window.angle}
            }

            Text {
                id: txtTwo
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                font.bold: true
                color: "#3498db"
                transform: Rotation { origin.x: txtTwo.width / 2; origin.y: txtTwo.height + 8; axis { x: 0; y: 0; z: 1 } angle: window.angle + 180}
            }
        }

        Text {
            id: textReady
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: number.bottom
            anchors.topMargin: 8
            text: "GET READY"
            font.pixelSize: 20
            font.bold: true
            verticalAlignment: Text.AlignVCenter

            property point center: Qt.point(x + width / 2, y + height / 2)
        }

        Timer {
            id: timer
            property int counter: 0
            interval: 1000; running: true; repeat: true;

            onTriggered: {
                if (counter === 3) {
                    stop();
                    countdown.scale = 0;
                    replay.scale = 1;
                } else {
                    if (window.currentObj == txtOne) {
                        txtOne.text = window.currentNumber;
                        txtTwo.text = window.currentNumber - 1;
                        window.currentObj = txtTwo;
                    } else {
                        txtTwo.text = window.currentNumber;
                        txtOne.text = window.currentNumber - 1;
                        window.currentObj = txtOne;
                    }
                    window.currentNumber -= 1;
                    window.angle -= 180;
                    counter += 1;
                }
           }
       }
    }


    Item {
        id: replay
        anchors.centerIn: parent
        property double scale: 0

        transform: Scale { origin.x: countdown.width / 2; origin.y: 0; xScale: replay.scale; yScale: replay.scale}

        Behavior on scale { NumberAnimation { duration: 100 } }

        Text {
            id: textGo
            anchors.horizontalCenter: parent.horizontalCenter
            text: "GO"
            font.pixelSize: 25
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textGo.bottom
            anchors.topMargin: 8
            color: "lightgray"
            width: 80
            height: 20
            border.color: "gray"
            radius: 3

            Text {
                anchors.centerIn: parent
                text: "Replay"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    replay.scale = 0;
                    countdown.reset();
                    countdown.scale = 1;
                    countdown.start();
                }
            }
        }
    }
}
