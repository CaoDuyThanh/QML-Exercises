import QtQuick 2.15

Item {
    id: closeButton
    width: 70
    height: 70
    property bool isClose: false;
    property string color: "black"
    property double angleLine1: !isClose ? 45 : 180 + 540
    property double angleLine2: !isClose ? -45 : -180 - 540

    Behavior on angleLine1 { NumberAnimation { duration: 500 } }
    Behavior on angleLine2 { NumberAnimation { duration: 500 } }

    Rectangle {
        id: line1
        x: (parent.width - width) / 2
        y: !closeButton.isClose ? (parent.height - height) / 2 : (parent.height - height) / 2 - 5
        width: parent.width * 0.9
        height: 2
        color: parent.color
        transform: Rotation { origin.x: line1.width / 2; origin.y: line1.height / 2; axis { x: 0; y: 0; z: 1 } angle: closeButton.angleLine1 }
        Behavior on y { NumberAnimation { duration: 500 } }
    }

    Rectangle {
        id: line2
        x: (parent.width - width) / 2
        y: !closeButton.isClose ? (parent.height - height) / 2 : (parent.height - height) / 2 + 5
        width: parent.width * 0.9
        height: 2
        color: parent.color
        transform: Rotation { origin.x: line2.width / 2; origin.y: line2.height / 2; axis { x: 0; y: 0; z: 1 } angle: closeButton.angleLine2 }
        Behavior on y { NumberAnimation { duration: 500 } }
    }
}
