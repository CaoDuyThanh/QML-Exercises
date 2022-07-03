import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12

Window {
    id: window
    width: 1920
    height: 960
    visible: true
    title: qsTr("Blurry Loading")

    property int percentage: 0

    Image {
        id: image
        width: window.width
        height: window.height
        source: "photo.png"
        fillMode: Image.PreserveAspectCrop
    }

    FastBlur {
        anchors.fill: image
        source: image
        radius: 100 - window.percentage
    }

    Text {
        anchors.centerIn: parent
        text: window.percentage + "%"
        font.pixelSize: 60
        color: "lightgray"
        opacity: 1 - window.percentage / 100
    }

    Behavior on percentage { PropertyAnimation { duration: 4000 } }

    Component.onCompleted: function () {
        window.percentage = 100;
    }
}
