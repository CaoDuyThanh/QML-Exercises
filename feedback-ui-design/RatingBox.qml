import QtQuick 2.0
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    width: 100
    height: 85

    property alias icon: icon.text
    property alias text: text.text

    FontLoader {
        id: fa5
        source: "./fonts/fa-regular-400.ttf"
    }

    DropShadow {
        anchors.fill: parent
        source: rect
        color: "gray"
        samples: 17
        radius: 10
        visible: mouseArea.hover
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "white"
    }

    Control {
        anchors.fill: parent
        leftPadding: 20
        rightPadding: 20
        topPadding: 20
        bottomPadding: 20

        contentItem: ColumnLayout {
            Text {
                Layout.fillWidth: true
                id: icon
                horizontalAlignment: Text.AlignHCenter
                font.family: fa5.name
                font.styleName: "Regular"
                font.pixelSize: 30
            }

            Text {
                Layout.fillWidth: true
                id: text
                horizontalAlignment: Text.AlignHCenter
                color: "gray"
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        property bool hover: false
        onEntered: {
            hover = true;
        }
        onExited: {
            hover = false;
        }
    }
}
