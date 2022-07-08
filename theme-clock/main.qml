import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Theme Clock")
    color: isDarkMode ? "#333" : "white"
    property bool isDarkMode: false;

    Rectangle {
        anchors.horizontalCenter: clock.horizontalCenter
        y: 200
        width: 90
        height: 32
        radius: 5
        color: window.isDarkMode ? "white" : "black"
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Dark mode"
            color: window.isDarkMode ? "black" : "white"
            font.family: "Heebo"
            font.pixelSize: 14
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: function() {
                window.isDarkMode = !window.isDarkMode;
            }
        }

        Behavior on color { PropertyAnimation { duration: 350 } }
    }

    Clock {
        id: clock
        anchors.centerIn: parent
        hour: 0
        minute: 13
        second: 45
        neddleColor: window.isDarkMode ? "white" : "black"
        property var dayDict: { 0: "Sunday", 1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday", 6: "Saturday" }
        property var monthDict: { 0: "Jan", 1: "Feb", 2: "Mar", 3: "Apr", 4: "May", 5: "Jun", 6: "Jul", 7: "Aug", 8: "Sep", 9: "Oct", 10: "Nov", 11: "Dec" }
        property string day: ''
        property string month: ''
        property int date: 0

        function calculateTime() {
            var today = new Date();
            clock.hour = today.getHours();
            clock.minute = today.getMinutes();
            clock.second = today.getSeconds();
            clock.day = clock.dayDict[today.getDay()];
            clock.month = clock.monthDict[today.getMonth()];
            clock.date = today.getDate();
        }

        Component.onCompleted: function() {
            calculateTime();
        }

        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: function() {
                clock.calculateTime();
            }
        }
    }

    Text {
        id: timeText
        anchors.top: clock.bottom
        anchors.horizontalCenter: clock.horizontalCenter
        text: parseInt(clock.hour) % 12 + ":" + parseInt(clock.minute) + (clock.hour > 12 ? " PM" : " AM")
        color: window.isDarkMode ? "white" : "black"
        font.family: "Heebo"
        font.pixelSize: 60
        font.weight: Font.Thin

        Behavior on color { PropertyAnimation { duration: 350 } }
    }

    Row {
        id: dateText
        anchors.top: timeText.bottom
        anchors.horizontalCenter: clock.horizontalCenter

        Text {
            text: clock.day + ", " + clock.month + " "
            color: window.isDarkMode ? "white" : "#aaa"
            font.family: "Heebo"
            font.pixelSize: 14
            font.weight: Font.Thin

            Behavior on color { PropertyAnimation { duration: 350 } }
        }

        Circle {
            r: 10
            posY: dateText.height / 2
            color: window.isDarkMode ? "white" : "black"

            Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: clock.date
                color: window.isDarkMode ? "black" : "#aaa"
                font.family: "Heebo"
                font.pixelSize: 14
                font.weight: Font.Thin

                Behavior on color { PropertyAnimation { duration: 350 } }
            }

            Behavior on color { PropertyAnimation { duration: 350 } }
        }
    }

    Behavior on color { PropertyAnimation { duration: 350 } }
}
