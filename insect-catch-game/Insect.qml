import QtQuick 2.15

Item {
    id: insect
    width: 100
    height: 100
    property double centerX: 0
    property double centerY: 0
    property alias source: image.source
    property bool isKilled: false
    property double angle: 0
    x: centerX - width / 2
    y: centerY - height / 2

    transform: Rotation { origin.x: insect.width / 2; origin.y: insect.height / 2; axis { x: 0; y: 0; z: 1 } angle: insect.angle }

    Behavior on width { NumberAnimation { duration: 350 } }
    Behavior on height { NumberAnimation { duration: 350 } }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            insect.isKilled = true;
            insect.width = 0;
            insect.height = 0;
            insect.destroy(350);
        }
    }
}
