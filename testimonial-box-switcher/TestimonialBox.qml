import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle {
    id: testiBox
    width: 768
    color: "#476ce4"
    radius: 15
    property alias desc: description.text
    property alias photo: photo.source
    property alias name: name.text
    property alias position: position.text
    property int resetTime: 3000
    implicitHeight: column.implicitHeight +
                    layout.anchors.topMargin +
                    layout.anchors.bottomMargin

    function reset() {
        processBar.enableAnimation = false;
        processBar.state = "toZero";
        processBar.enableAnimation = true;
        processBar.state = "toFull";
    }

    FontLoader {
        id: fontLoader
        source: "fonts/fa-solid-900.ttf"
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        anchors.topMargin: 50
        anchors.bottomMargin: 50
        spacing: 6

        Text {
            Layout.minimumWidth: 80
            Layout.maximumWidth: 80
            Layout.preferredWidth: 80
            Layout.fillHeight: true
            topPadding: 20
            id: leftQuote

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignTop
            font.family: fontLoader.name
            font.pixelSize: 32
            font.bold: true
            text: "\uf10e"
            color: "white"
            opacity: 0.3
        }

        ColumnLayout {
            id: column
            Layout.fillWidth: true
            spacing: 20

            Rectangle {
                id: processBar
                property bool enableAnimation: false
                Layout.preferredHeight: 3
                color: "white"
                state: "toZero"

                states: [
                    State { name: "toZero"; PropertyChanges { target: processBar; width: 0; } },
                    State { name: "toFull"; PropertyChanges { target: processBar; width: column.width } }
                ]

                Behavior on width { enabled: processBar.enableAnimation; PropertyAnimation { duration: testiBox.resetTime } }
            }

            Text {
                Layout.fillWidth: true
                width: parent.width
                id: description
                font.family: "Montserrat"
                font.pixelSize: 16
                lineHeight: 1.2
                color: "white"
                wrapMode: Text.WordWrap
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                spacing: 10

                Image {
                    id: photo
                    Layout.preferredHeight: 75
                    Layout.preferredWidth: 75
                    fillMode: Image.PreserveAspectCrop

                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: photo.width
                            height: photo.height
                            Rectangle {
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height
                                radius: parent.width / 2
                            }
                        }
                    }
                }

                ColumnLayout {
                    spacing: 10
                    Text {
                        id: name
                        color: "white"
                        font.family: "Montserrat"
                    }
                    Text {
                        id: position
                        color: "white"
                        font.family: "Montserrat"
                    }
                }
            }
        }

        Text {
            Layout.minimumWidth: 80
            Layout.maximumWidth: 80
            Layout.preferredWidth: 80
            Layout.fillHeight: true
            topPadding: 20
            id: rightQuote

            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            font.family: fontLoader.name
            font.pixelSize: 32
            font.bold: true
            text: "\uf10d"
            color: "white"
            opacity: 0.3
        }
    }
}
