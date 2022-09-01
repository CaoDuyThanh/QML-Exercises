import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: slider
    color: "white"
    property int start: 0
    property int end: 100
    property int currentValue: 0

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.height * 0.8
        color: "purple"
        radius: 5
    }

    Rectangle {
        id: circle
        anchors.verticalCenter: parent.verticalCenter
        width: parent.height * 1.5
        height: parent.height * 1.5
        radius: parent.height * 1.5 / 2
        border.color: "purple"

        onXChanged: {
            x = Math.max(0, Math.min(slider.width - height, x));
            slider.currentValue = x / (slider.width - height) * (slider.end - slider.start) + slider.start
        }

        Drag.active: dragArea.drag.active

        MouseArea {
            id: dragArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            drag.target: parent
        }
    }

    DropShadow {
        anchors.fill: showValue
        source: showValue
        samples: 17
        radius: 10
        color: "gray"
    }

    Rectangle {
        id: showValue
        x: circle.x - (width - circle.width) / 2
        y: -(circle.height + height) / 2 - 15
        width: 80
        height: 30
        radius: 5

        Text {
            anchors.centerIn: parent
            text: slider.currentValue
        }
    }
}
