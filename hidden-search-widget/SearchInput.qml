import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle {
    id: searchInput
    property bool isEnable: true
    property int maxWidth: 150
    width: isEnable ? maxWidth : 50
    height: 50

    Behavior on width { PropertyAnimation { duration: 400; easing.type: Easing.OutCubic } }

    FontLoader {
        id: cFontLoader
        source: "./fonts/fontello.ttf"
    }

    ToolButton {
        id: icon
        anchors.right: parent.right
        text: "\uE800"
        width: 50
        height: 50

        font.family: cFontLoader.name
        font.pixelSize: 25
        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function() {
                searchInput.isEnable = !searchInput.isEnable;
            }

            cursorShape: Qt.PointingHandCursor
        }
    }

    Text {
        id: text
        height: parent.height
        width: searchInput.width - icon.width - 20
        x: 15
        text: "Search..."
        color: "gray"
        verticalAlignment: Text.AlignVCenter
        visible: textEdit.text.length == 0 && searchInput.isEnable
        clip: true
        font.pixelSize: 20

        Behavior on visible { PropertyAnimation { duration: 100 } }
    }

    TextEdit {
        id: textEdit
        width: text.width
        height: text.height
        x: text.x
        visible: searchInput.isEnable
        verticalAlignment: TextEdit.AlignVCenter
        font.pixelSize: 20
        clip: true
    }



}
