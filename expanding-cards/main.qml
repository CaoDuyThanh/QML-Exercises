import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Expanding Cards")

    Control {
        anchors.fill: parent
        topPadding: height * 0.1
        bottomPadding: height * 0.1
        leftPadding: width * 0.05
        rightPadding: width * 0.05

        contentItem: RowLayout {
            id: content
            spacing: width * 0.02
            property int chosenId: 1

            Image {
                id: rect1
                Layout.fillHeight: true
                Layout.preferredWidth: content.chosenId == 1 ? content.width - content.spacing * 4 - content.width / 15 * 4 : content.width / 15

                source: "photo1.jpeg"
                height: parent.height
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: rect1.width
                        height: rect1.height

                        Rectangle {
                            anchors.fill: parent
                            radius: content.width / 30
                        }
                    }
                }

                Text {
                    x: 20
                    y: parent.height - 45
                    text: "Explore The World"
                    color: "white"
                    font.pixelSize: 25
                    visible: content.chosenId == 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function () {
                        content.chosenId = 1;
                    }
                }

                Behavior on Layout.preferredWidth { NumberAnimation { duration: 500 } }
            }

            Image {
                id: rect2
                Layout.fillHeight: true
                Layout.preferredWidth: content.chosenId == 2 ? content.width - content.spacing * 4 - content.width / 15 * 4 : content.width / 15

                source: "photo2.jpeg"
                height: parent.height
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: rect2.width
                        height: rect2.height

                        Rectangle {
                            anchors.fill: parent
                            radius: content.width / 30
                        }
                    }
                }

                Text {
                    x: 20
                    y: parent.height - 45
                    text: "White Forest"
                    color: "white"
                    font.pixelSize: 25
                    visible: content.chosenId == 2
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function () {
                        content.chosenId = 2;
                    }
                }

                Behavior on Layout.preferredWidth { NumberAnimation { duration: 500 } }
            }

            Image {
                id: rect3
                Layout.fillHeight: true
                Layout.preferredWidth: content.chosenId == 3 ? content.width - content.spacing * 4 - content.width / 15 * 4 : content.width / 15

                source: "photo3.jpeg"
                height: parent.height
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: rect3.width
                        height: rect3.height

                        Rectangle {
                            anchors.fill: parent
                            radius: content.width / 30
                        }
                    }
                }

                Text {
                    x: 20
                    y: parent.height - 45
                    text: "Sunny Beach"
                    color: "white"
                    font.pixelSize: 25
                    visible: content.chosenId == 3
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function () {
                        content.chosenId = 3;
                    }
                }

                Behavior on Layout.preferredWidth { NumberAnimation { duration: 500 } }
            }

            Image {
                id: rect4
                Layout.fillHeight: true
                Layout.preferredWidth: content.chosenId == 4 ? content.width - content.spacing * 4 - content.width / 15 * 4 : content.width / 15

                source: "photo4.jpeg"
                height: parent.height
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: rect4.width
                        height: rect4.height

                        Rectangle {
                            anchors.fill: parent
                            radius: content.width / 30
                        }
                    }
                }

                Text {
                    x: 20
                    y: parent.height - 45
                    text: "City on Winter"
                    color: "white"
                    font.pixelSize: 25
                    visible: content.chosenId == 4
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function () {
                        content.chosenId = 4;
                    }
                }

                Behavior on Layout.preferredWidth { NumberAnimation { duration: 500 } }
            }

            Image {
                id: rect5
                Layout.fillHeight: true
                Layout.preferredWidth: content.chosenId == 5 ? content.width - content.spacing * 4 - content.width / 15 * 4 : content.width / 15

                source: "photo5.jpeg"
                height: parent.height
                fillMode: Image.PreserveAspectCrop

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: rect5.width
                        height: rect5.height

                        Rectangle {
                            anchors.fill: parent
                            radius: content.width / 30
                        }
                    }
                }

                Text {
                    x: 20
                    y: parent.height - 45
                    text: "Mountains - Clouds"
                    color: "white"
                    font.pixelSize: 25
                    visible: content.chosenId == 5
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: function () {
                        content.chosenId = 5;
                    }
                }

                Behavior on Layout.preferredWidth { NumberAnimation { duration: 500 } }
            }
        }
    }


}
