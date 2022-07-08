import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Button Ripple Effect")
    color: "#000"

    Rectangle {
        anchors.centerIn: parent
        color: "purple"
        height: 60
        width: 140
        clip: true

        Circle {
            id: circle
            r: 0
            color: "white"
        }

        Text {
            text: "CLICK ME"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: function() {
                if (!toLarge.running) {
                    circle.posX = mouseX;
                    circle.posY = mouseY;
                    toLarge.start();
                    toFade.start();
                }
            }
        }

        PropertyAnimation {id: toLarge; target: circle; properties: "r"; from: 0; to: 200; duration: 400}
        PropertyAnimation {id: toFade; target: circle; properties: "opacity"; from: 1; to: 0; duration: 400}
    }
}
