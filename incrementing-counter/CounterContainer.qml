import QtQuick 2.0
import QtQuick.Layouts 1.15

ColumnLayout {
    id: column
    property string icon: ""
    property int numFollower: 0
    property string textContainer: ""

    spacing: 10

    FontLoader {
        id: fontLoader
        source: "./fonts/fa-brands-400.ttf"
    }

    FontLoader {
        id: robotoMono
        source: "./fonts/RobotoMono-VariableFont_wght.ttf"
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        text: column.icon
        color: "white"
        font.pixelSize: 48
        font.family: fontLoader.name
        font.styleName: "Solid"
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        text: column.numFollower
        color: "white"
        font.pixelSize: 60
        font.family: robotoMono.name
        font.styleName: "Regular"
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        text: column.textContainer
        color: "white"
        font.pixelSize: 16
        font.family: robotoMono.name
        font.styleName: "Regular"
    }

    Behavior on numFollower { NumberAnimation { duration: 2000 } }
}
