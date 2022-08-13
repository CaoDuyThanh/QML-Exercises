import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Kinetic Loader")
    color: "#2c3e50"
    property double triAngle1: 0
    property double triAngle2: 90
    property int count: 0

    Behavior on triAngle1 { NumberAnimation { duration: 1500 } }
    Behavior on triAngle2 { NumberAnimation { duration: 1500 } }

    Timer {
        repeat: true
        running: true
        interval: 1500
        onTriggered: {
            window.count += 1;
            if (window.count % 2 === 0) {
                window.triAngle1 += 180;
            } else {
                window.triAngle2 += 180;
            }
        }
    }

    Triangle {
        anchors.centerIn: parent
        width: 80
        height: 80
        color: "white"

        transform: Rotation { origin.x: 40; origin.y: 40; angle: window.triAngle1 }
    }

    Triangle {
        anchors.centerIn: parent
        width: 80
        height: 80
        color: "white"

        transform: Rotation { origin.x: 40; origin.y: 40; angle: window.triAngle2 }
    }
}
