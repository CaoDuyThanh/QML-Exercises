import QtQuick 2.15

Rectangle {
    id: rect
    property alias text: text.text
    height: text.height + 16 * 2

    Text {
        id: text
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 30
        leftPadding: 32
        rightPadding: 32
        color: font.strikeout ? "lightgray" : "black"
        wrapMode: Text.WordWrap
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                text.font.strikeout = !text.font.strikeout;
            } else if (mouse.button === Qt.RightButton) {
                rect.destroy();
            }
        }
    }
}
