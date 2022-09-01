import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Pokedex.js" as PD

Item {
    id: card
    width: 160
    height: 265

    property int number: 0
    property string name: ""
    property string type: "undefined"
    property string image: ""

    function pad(num, size){ return ('000000000' + num).substr(-size); }

    DropShadow {
        anchors.fill: parent
        source: rect
        color: "gray"
        samples: 10
        radius: 10
        opacity: 0.5
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        radius: 10
        color: PD.colors[type] === undefined ? "red" : PD.colors[type]
    }

    Control {
        anchors.fill: parent
        leftPadding: 20
        topPadding: 20
        rightPadding: 20
        bottomPadding: 20

        contentItem: Column {
            spacing: 20

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
                width: 120
                height: 120

                Rectangle {
                    anchors.fill: parent
                    color: "white"
                    radius: parent.width / 2
                }

                Image {
                    id: img
                    anchors.fill: parent
                    source: card.image

                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: img.width
                            height: img.height
                            Rectangle {
                                anchors.centerIn: parent
                                width: img.width
                                height: img.height
                                radius: img.width / 2
                            }
                        }
                    }
                }
            }

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 50
                height: 26

                Rectangle {
                    anchors.fill: parent
                    color: "black"
                    radius: 10
                    opacity: 0.1
                }

                Text {
                    anchors.centerIn: parent
                    text: "#" + card.pad(card.number, 3)
                    font.pixelSize: 14
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignTop
                topPadding: -5
                bottomPadding: 5
                text: card.name
                font.pixelSize: 20
                lineHeight: 0.3
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Type: " + card.type
                font.pixelSize: 12
            }
        }
    }
}
