import QtQuick 2.0

Rectangle {
    width: text.width + 5 * 2
    height: text.height + 5 * 2
    property alias text: text.text

    Text {
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        font.pixelSize: 14
    }
}
