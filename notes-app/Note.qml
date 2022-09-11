import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: note
    width: 400
    height: 400

    DropShadow {
       anchors.fill: parent
       source: tempBackground
       color: "gray"
       samples: 17
       radius: 10
    }

    Rectangle {
        id: tempBackground
        anchors.fill: parent
        color: "white"
        visible: false
    }

    Rectangle {
        id: header
        width: parent.width
        height: 37
        color: "#9ec862"

        Row {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            spacing: 10

            Text {
                text: "\uf044"
                color: "white"
                font.family: fa5.name
                font.pixelSize: 20

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        textField.readOnly = !textField.readOnly;
                    }
                }
            }

            Text {
                text: "\uf2ed"
                color: "white"
                font.family: fa5.name
                font.pixelSize: 20

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        note.destroy();
                    }
                }
            }
        }
    }

    TextField {
        id: textField
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - header.height
        background: Rectangle { color: "white" }
        verticalAlignment: TextField.AlignTop
    }
}
