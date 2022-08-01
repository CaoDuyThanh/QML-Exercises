import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Animated Navigation")
    property bool isClose: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 50
            color: "#eafbff"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 50
            color: "#5290f9"
        }
    }

    Rectangle {
        id: menu
        anchors.centerIn: parent
        color: "white"
        height: 70
        implicitWidth: window.isClose ? 70 : row.implicitWidth + row.anchors.leftMargin + row.anchors.rightMargin + 50

        Behavior on implicitWidth { PropertyAnimation { duration: 500 } }

        Row {
            id: row
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            spacing: 10
            height: 16
            width: window.isClose ? 20 : implicitWidth

            TextMenu {
                isClose: window.isClose
                leftPadding: 10
                rightPadding: 10
                text: "Home"
            }

            TextMenu {
                isClose: window.isClose
                leftPadding: 10
                rightPadding: 10
                text: "Works"
            }

            TextMenu {
                isClose: window.isClose
                leftPadding: 10
                rightPadding: 10
                text: "About"
            }

            TextMenu {
                isClose: window.isClose
                leftPadding: 10
                text: "Contact"
            }
        }

        Cross {
            anchors.right: menu.right
            anchors.verticalCenter: menu.verticalCenter
            anchors.rightMargin: 20
            id: cross
            height: 30
            width: 30
            color: "#5290f9"
            isClose: window.isClose

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    window.isClose = !window.isClose;
                }
            }
        }
    }
}
