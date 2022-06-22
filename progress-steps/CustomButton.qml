import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: cusButton
    color: "lightblue"
    property string t: ""
    property string textColor: "white"
    radius: 5

    Button {
        anchors.centerIn: cusButton
        flat: true
        text: cusButton.t

        contentItem: Text {
            text: cusButton.t
            color: cusButton.textColor
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
