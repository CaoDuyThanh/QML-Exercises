import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Image Carousel")
    property int currentIndex: 0

    Timer {
        id: timer
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            window.currentIndex = (window.currentIndex + 1) % 4;
        }
    }

    ScrollView {
        id: scrollView
        anchors.centerIn: parent
        width: 500
        height: 500
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOff
        ScrollBar.horizontal.position: window.currentIndex * 1 / 4
        clip: true

        ListView {
            model: 4
            orientation: ListView.Horizontal
            delegate: Image {
                width: 500
                height: 500
                source: "photo_" + (index + 1) + ".png"
                fillMode: Image.PreserveAspectCrop
            }
        }

        Behavior on ScrollBar.horizontal.position { NumberAnimation { duration: 1000 } }
    }

    Rectangle {
        anchors.top: scrollView.bottom
        anchors.left: scrollView.left
        width: 245
        height: 20
        color: "#663399"

        Text {
            anchors.centerIn: parent
            text: "Prev"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                timer.restart();
                window.currentIndex = (window.currentIndex - 1 + 4) % 4;
            }
        }
    }

    Rectangle {
        anchors.top: scrollView.bottom
        anchors.right: scrollView.right
        width: 245
        height: 20
        color: "#663399"

        Text {
            anchors.centerIn: parent
            text: "Prev"
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                timer.restart();
                window.currentIndex = (window.currentIndex + 1) % 4;
            }
        }
    }
}
