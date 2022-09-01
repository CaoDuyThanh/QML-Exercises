import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Custom Range Slider")

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end:  Qt.point(window.width, window.height)
        gradient: Gradient {
            GradientStop { position: 0; color: "#f5f7fa" }
            GradientStop { position: 1; color: "#c3cfe2" }
        }
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        text: "Custom Range Slider"
        font.pixelSize: 25
    }

    Slider {
        anchors.centerIn: parent
        width: 300
        height: 20
    }
}
