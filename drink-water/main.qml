import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 1280
    height: 960
    visible: true
    title: qsTr("Drink Water")
    color: "#3494e4"
    property int choice: -1
    property double percentage: Math.max(choice + 1, 0) * 1.0 / 8

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "Drink Water"
            color: "white"
            font.pixelSize: 40
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "Goal: 2 Liters"
            color: "white"
            font.pixelSize: 20
        }

        Glass {
            Layout.alignment: Qt.AlignHCenter
            width: 142
            height: 322
            radius: 40
            color: "#6ab3f8"
            borderColor: "#144fc6"
            borderWidth: 5
            percentage: window.percentage
            textRemain: (1 - percentage).toFixed(2) * 2 + "L\nRemained"
            textRemainColor: "#144fc6"
            text: (percentage * 100).toFixed(2) + "%"
            textColor: "#144fc6"
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "Select how many glasses of water that you have drank"
            color: "white"
            font.pixelSize: 16
        }

        Flow {
            id: flow
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 280
            spacing: (280 - 50 * 4) / 3

            property int rowCount: parent.width / (elements.itemAt(0).width + spacing)
            property int rowWidth: rowCount * elements.itemAt(0).width + (rowCount - 1) * spacing
            property int mar: (parent.width - rowWidth) / 2

            Repeater {
                id: elements
                model: 8
                delegate: Glass {
                    width: 50
                    height: 95
                    color: index <= window.choice ? "#6ab3f8" : "white"
                    borderColor:  "#144fc6"
                    text: "250\nml"
                    textColor: index <= window.choice ? "white" : "#144fc6"
                    borderWidth: 4

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            window.choice = index;
                        }
                    }
                }
            }
        }
    }
}
