import QtQuick 2.0

Item {
    id: clock
    width: 200
    height: 200

    property string neddleColor: "black"
    property int hour: 0
    property int minute: 0
    property int second: 0

    property int timeHour: 0
    property int timeMinute: 0
    property int timeSecond: 0

    property double hourRun: 0
    property double minuteRun: 0
    property double secondRun: 0

    onHourChanged: function() {
        if (hour % 12 == 0) { timeHour += 1; }
        hourRun = timeHour * 24 + hour;
    }

    onMinuteChanged: function() {
        if (minute % 60 == 0) { timeMinute += 1; }
         minuteRun = timeMinute * 60 + minute;
    }

    onSecondChanged: function() {
        if (second % 60 == 0) { timeSecond += 1; }
        secondRun = timeSecond * 60 + second;
    }

    Rectangle {
        id: neddleHour
        x: (parent.width - width) / 2
        y: parent.height / 2
        height: 65
        width: 3
        color: clock.neddleColor
        antialiasing: true

        transform: Rotation { origin.x: neddleHour.width / 2; origin.y: 0; axis { x: 0; y: 0; z: 1 } angle: clock.hourRun / 12 * 360 + 180 }
        Behavior on color { PropertyAnimation { duration: 350 } }
    }

    Rectangle {
        id: neddleMinute
        x: (parent.width - width) / 2
        y: parent.height / 2
        height: 95
        width: 3
        color: clock.neddleColor
        antialiasing: true

        transform: Rotation { origin.x: neddleMinute.width / 2; origin.y: 0; axis { x: 0; y: 0; z: 1 } angle: clock.minuteRun / 60 * 360 + 180 }
        Behavior on color { PropertyAnimation { duration: 350 } }
    }

    Rectangle {
        id: neddleSecond
        x: (parent.width - width) / 2
        y: parent.height / 2
        height: 90
        width: 3
        color: "#e74c3c"
        antialiasing: true

        transform: Rotation { origin.x: neddleSecond.width / 2; origin.y: 0; axis { x: 0; y: 0; z: 1 } angle: clock.secondRun / 60 * 360 + 180 }
    }

    Circle{
        anchors.centerIn: parent
        r: 5
        color: "#e74c3c"
    }

    Circle{
        anchors.centerIn: parent
        r: 2
        color: clock.neddleColor

        Behavior on color { PropertyAnimation { duration: 350 } }
    }

    Behavior on hourRun { PropertyAnimation { duration: 350 } }
    Behavior on minuteRun { PropertyAnimation { duration: 350 } }
    Behavior on secondRun { PropertyAnimation { duration: 350 } }
}
