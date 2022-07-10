import QtQuick 2.0

Row {
    id: switcher
    property bool isEnabled: false
    property alias text: text.text
    signal clicked()
    spacing: 15

    Rectangle {
        width: 80
        height: 40
        radius: 20
        color: isEnabled ? "#8e44ad" : "darkgray"

        Circle {
            anchors.verticalCenter: parent.verticalCenter
            r: parent.height / 2 - 3
            x: switcher.isEnabled ? parent.width - r * 2 - 3 : 3

            Behavior on x { PropertyAnimation { duration: 100 } }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: function() {
                switcher.isEnabled = !switcher.isEnabled;
                switcher.clicked();
            }
        }
    }

    Text {
        id: text
        height: parent.height
        verticalAlignment: Text.AlignVCenter
    }
}
