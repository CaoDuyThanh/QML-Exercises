import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 700
    height: 700
    visible: true
    title: qsTr("Mobile Tab Navigation")
    color: "#9B59B6"
    property int currentInd: 0
    property variant icons: [{icon: "\uf015", text: "Home"},
                             {icon: "\uf466", text: "Work"},
                             {icon: "\uf518", text: "Blog"},
                             {icon: "\uf0c0", text: "About Us"}]

    FontLoader {
        id: fa5
        source: "./fonts/fa-solid-900.ttf"
    }

    Rectangle {
        anchors.centerIn: parent
        width: 340
        height: 600
        radius: 10
        color: "#EEE"

        FadedImage {
            id: image
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "photo_" + (window.currentInd + 1) + ".png"
            fillMode: Image.PreserveAspectCrop
            visible: false
        }

        OpacityMask {
            anchors.centerIn: parent
            width: parent.width - 6
            height: parent.height - 6
            source: image
            maskSource: Rectangle {
                width: image.width
                height: image.height
                radius: 10
            }
        }

        NavBar {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            width: parent.width - 6
            height: 60
            color: "#FFF"

            RowLayout {
                anchors.fill: parent

                Repeater {
                    model: 4
                    delegate: Rectangle {
                        Layout.alignment: Qt.AlignHCenter || Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        ColumnLayout {
                            anchors.centerIn: parent

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: window.icons[index]["icon"]
                                color: window.currentInd === index ? "#8e44ad" : "#777"
                                font.family: fa5.name
                            }

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: window.icons[index]["text"]
                                color: window.currentInd === index ? "#8e44ad" : "#777"
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                window.currentInd = index;
                            }
                        }
                    }
                }
            }
        }
    }
}
