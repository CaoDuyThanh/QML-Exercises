import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 600
    visible: true
    title: qsTr("Content Placeholder")
    color: "#ecf0f1"

    DropShadow {
        anchors.fill: rect
        cached: true
        source: rect
        radius: 10
        samples: 17
        color: "gray"
    }

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: 350
        height: column.height
        radius: 12
        color: "white"

        ColumnLayout {
            id: column
            width: parent.width

            Image {
                id: image
                Layout.fillWidth: parent
                Layout.preferredHeight: 200
                source: "photo.jpeg"

                // Rounded top-left and top-right corners
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: image.width
                        height: image.height
                        color: "transparent"
                        clip: true

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height
                            width: parent.width - 20
                        }

                        Rectangle {
                            anchors.bottom: parent.bottom
                            height: parent.height - 10
                            width: parent.width
                        }

                        Circle {
                            anchors.top: parent.top
                            anchors.left: parent.left
                            r: 10
                        }
                        Circle {
                            anchors.top: parent.top
                            anchors.right: parent.right
                            r: 10
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: parent.width
                Layout.leftMargin: 30
                Layout.rightMargin: 30
                Layout.topMargin: 30
                Layout.bottomMargin: 30
                spacing: 15

                Text {
                    Layout.alignment: Qt.AlignLeft
                    text: "Lorem ipsum dolor sit amet"
                    font.bold: true
                    font.family: "Roboto"
                    font.pixelSize: 16
                }

                Text {
                    Layout.preferredWidth: parent.width
                    text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore perferendis"
                    wrapMode: Text.WordWrap
                    font.family: "Roboto"
                    font.pixelSize: 14
                    color: "gray"
                }

                RowLayout {
                    spacing: 15

                    Image {
                        id: icon
                        Layout.preferredHeight: 40
                        Layout.preferredWidth: 40
                        source: "icon.jpg"
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Item {
                                width: icon.width
                                height: icon.height
                                Rectangle {
                                    anchors.fill: parent
                                    radius: parent.width / 2
                                }
                            }
                        }
                    }

                    Column {
                        spacing: 8
                        Text {
                            text: "John Doe"
                            font.family: "Roboto"
                            font.bold: true
                        }

                        Text {
                            text: "Oct 08, 2020"
                            font.family: "Roboto"
                            font.pixelSize: 12
                            color: "darkgray"
                        }
                    }
                }
            }
        }
    }
}
