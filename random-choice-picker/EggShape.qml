import QtQuick 2.0

Item {
    id: egg
    width: 100
    height: 20
    property string color: "white"

    Rectangle {
        x: egg.height / 2
        width: egg.width - egg.height
        height: egg.height
        color: egg.color
    }

    Circle {
        r: egg.height / 2
        centerX: r
        centerY: r
        color: egg.color
    }

    Circle {
        r: egg.height / 2
        centerX: egg.width - r
        centerY: r
        color: egg.color

    }
}
