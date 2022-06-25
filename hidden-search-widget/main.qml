import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hidden Search Widget")

    Rectangle {
        anchors.fill: parent
        color: "#7158e2"

        SearchInput {
            anchors.centerIn: parent
            maxWidth: 250
        }
    }
}
