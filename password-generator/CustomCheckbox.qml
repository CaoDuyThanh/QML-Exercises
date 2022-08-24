import QtQuick 2.0
import QtQuick.Controls 2.15

CheckBox {
    id: control
    indicator: Item {
        implicitWidth: 26
        implicitHeight: 26
        property int radius: 3

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: "white"
            opacity: 0.3
        }

        Rectangle {
            z: 1
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: parent.height * 0.8
            radius: parent.radius
            color: control.checked ? "orange" : "white"
        }

        Text {
            id: text
            z: 3
            anchors.centerIn: parent
            text: "✔"
            font.pixelSize: parent.height - 2
            color: "white"
            visible: control.checked
        }
    }
}
