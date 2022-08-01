import QtQuick 2.15

Text {
    id: text
    property bool isClose: false
    property double angle: isClose ? 270 : 0

    opacity: !isClose ? 1 : 0
    text: "Home"
    font.pixelSize: 16
    font.family: "Muli"
    transform: Rotation { origin.x: text.width / 2; origin.y: text.height / 2; axis { x: 0; y: 1; z: 0 } angle: text.angle }

    Behavior on angle { NumberAnimation { duration: 500 } }
    Behavior on opacity { PropertyAnimation { duration: 500 } }
}
