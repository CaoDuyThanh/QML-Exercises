import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Verify Account UI")

    FontLoader {
        id: fontLoader
        source: "Muli-ExtraLight.ttf"
    }

    Rectangle {
        id: box
        anchors.centerIn: parent
        width: column.width + 5
        height: column.height + 60
        border.width: 2
        border.color: "black"
        radius: 10

        property int currentFocus: -1;

        ColumnLayout {
            anchors.centerIn: parent
            id: column
            spacing: 30

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Verify Your Account"
                font.pixelSize: 25
                font.family: fontLoader.name
                font.bold: true
            }

            Text {
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                text: "We emailed you the six digit code to cool_guy@email.com\n" +
                      "Enter the code below to confirm your email address."
                font.family: fontLoader.name
                font.styleName: "ExtraLight"
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 30
                Layout.bottomMargin: 30

                Repeater {
                    id: repeater
                    model: 6
                    delegate: Item {
                        width: 100
                        height: 120

                        Rectangle {
                            id: rect
                            anchors.fill: parent
                            radius: 5
                            border.color: textEdit.focus ? "red" : textEdit.text.length > 0 ? "blue" : "#eee"
                        }

                        DropShadow {
                            anchors.fill: rect
                            source: rect
                            color: "lightgray"
                            samples: 15
                            verticalOffset: 4
                            visible: textEdit.text.length > 0
                        }

                        TextInput {
                            id: textEdit
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.fill: parent
                            font.pixelSize: 80
                            validator: RegExpValidator { regExp: /[0-9]/ }
                            focus: index === box.currentFocus
                            overwriteMode: true
                            cursorPosition: index === box.currentFocus ? 0 : 1

                            Keys.onReleased: {
                                if (textEdit.text.length > 0) {
                                    box.currentFocus = (index + 1) % 6
                                }
                            }
                        }

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: textEdit.font.pixelSize
                            color: "gray"
                            visible: textEdit.text.length === 0
                            text: "0"
                        }


                    }
                }
            }

            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                width: 400
                height: 60
                color: "#eaeaea"

                Text {
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    leftPadding: 10
                    rightPadding: 10
                    text: "This is design only. We didn't actually send you an email as we don't have your email, right? "
                    font.family: fontLoader.name
                    font.styleName: "ExtraLight"
                    color: "#777"
                    wrapMode: Text.WordWrap
                }
            }
        }
    }

}
