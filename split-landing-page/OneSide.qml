import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {
    id: item
    property string imageSource: ""
    property bool isHover: false
    property string backgroundColor: "white"
    property double backgroundOpacity: 1.0
    property string buttonHoverColor: "gray"
    property alias text: text.text

    Image {
        anchors.fill: parent
        source: item.imageSource
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignLeft
    }

    Rectangle {
        anchors.fill: parent
        color: parent.backgroundColor
        opacity: parent.backgroundOpacity
    }

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        hoverEnabled: true
        onEntered: function() {
            item.isHover = true;
            mouse.accepted = false;
        }
        onExited: function() {
            item.isHover = false;
        }
    }

    Text {
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        y: button.y - 100
        color: "white"
        font.pixelSize: 60
        font.bold: true

    }

    Button {
        id: button
        anchors.centerIn: parent
        width: 240
        height: 100
        background: Rectangle {
            id: buttonBackground
            anchors.fill: button
            color: "transparent"
            border.color: "white"
            border.width: 4
        }

        contentItem: Text {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "BUY NOW"
            color: "white"
            font.pixelSize: 20
            font.bold: true
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onEntered: function() {
                item.isHover = true;
                buttonBackground.color = item.buttonHoverColor;
                buttonBackground.border.width = 0;
            }
            onExited: function() {
                buttonBackground.color = "transparent"
                buttonBackground.border.width = 4;
            }
        }
    }
}
