import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    property alias question: ques.text
    property alias answer: ans.text
    property bool isOpen: false

    id: faq
    width: parent.width
    height: rect.height

    FontLoader {
        id: fontRegular
        source: "./fonts/fa-regular-400.ttf"
    }

    FontLoader {
        id: fontSolid
        source: "./fonts/fa-solid-900.ttf"
    }

    DropShadow {
        anchors.fill: parent
        color: "lightgray"
        radius: 10
        horizontalOffset: 5
        verticalOffset: 5
        samples: 20
        source: rect
        visible: faq.isOpen
    }

    Rectangle {
        id: rect
        border.color: "gray"
        radius: 10
        width: parent.width
        height: column.height
        color: faq.isOpen ? "white" : "transparent"

        ToolButton {
            id: mess1
            width: rect.height
            height: rect.height
            visible: faq.isOpen

            background: Rectangle {
                color: "transparent"
            }

            contentItem: Text {
                topPadding: 10
                leftPadding: 10
                color: "green"
                text: "\uf075"
                font.family: fontRegular.name
                font.pixelSize: 90
                opacity: 0.2
            }
        }

        ToolButton {
            id: mess2
            width: rect.height
            height: rect.height
            clip: true
            visible: faq.isOpen

            background: Rectangle {
                color: "transparent"
            }

            contentItem: Text {
                topPadding: -10
                leftPadding: -60
                color: "steelblue"
                text: "\uf075"
                font.family: fontRegular.name
                font.pixelSize: 90
                opacity: 0.2

                transform: Rotation { origin.x: 0; origin.y: 0; axis { x: 0; y: 1; z: 0 } angle: 180 }
            }
        }

        Column {
            id: column
            spacing: 30
            leftPadding: 20
            topPadding: 20
            bottomPadding: 20

            Label {
                id: ques
                font.pixelSize: 18
                font.family: "Muli"
            }
            Label {
                id: ans
                font.family: "Muli"
                visible: faq.isOpen
            }
        }

        ToolButton {
            id: icon
            x: rect.y + rect.width - width - 30
            y: 15
            width: 30
            height: 30

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            contentItem: Text {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: faq.isOpen ? "darkgray" : "gray"
                text: faq.isOpen ? "\uf057" : "\u2304"
                font.family: fontSolid.name
                font.pixelSize: faq.isOpen ? 30 : 20
                font.styleName: "Solid"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    faq.isOpen = !faq.isOpen;
                }
            }
        }
    }


}
