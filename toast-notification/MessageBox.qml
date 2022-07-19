import QtQuick 2.15

Rectangle {
    id: notiRect
    radius: 5
    width: text.width
    height: 50

    property alias text: text.text
    property alias textColor: text.color

    Text {
        id: text
        anchors.centerIn: parent
        color: "#663399"
        leftPadding: 30
        rightPadding: 30
        font.pixelSize: 16
    }

    function createTimer() {
        return Qt.createQmlObject("import QtQuick 2.15; Timer {}", notiRect);
    }

    Component.onCompleted: {
        var timer;
        timer = createTimer();
        timer.interval = 3000;
        timer.repeat = false;
        timer.triggered.connect(function () {
            notiRect.destroy();
        });
        timer.start();
    }
}
