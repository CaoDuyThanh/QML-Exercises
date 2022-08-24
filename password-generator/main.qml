import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Password Generator")
    color: "#3b3b98"

    FontLoader {
        id: fa
        source: "./fonts/fa-regular-400.ttf"
    }

    FontLoader {
        id: fa2
        source: "./fonts/fa-solid-900.ttf"
    }

    DropShadow {
        anchors.fill: passBox
        source: passBox
        color: "white"
        opacity: 0.2
        samples: 35
    }

    Rectangle {
        id: passBox
        anchors.centerIn: parent
        color: "#23235b"
        width: 350
        height: column.implicitHeight + 20 * 2

        property alias generatedPass: genPass.text
        property alias passLength: control.value
        property alias upperLetter: cbUpperLetter.checked
        property alias lowerLetter: cbLowerLetter.checked
        property alias includeNumber: cbIncludeNumber.checked
        property alias includeSymbol: cbIncludeSymbol.checked

        ColumnLayout {
            id: column
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            spacing: 20

            Text {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 10
                text: "Password Generator"
                font.pixelSize: 25
                color: "white"
            }

            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 50

                Rectangle {
                    anchors.fill: parent
                    color: "black"
                    opacity: 0.3
                }

                Rectangle {
                    id: copyClipboard
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height - 10
                    height: parent.height - 10
                    color: "#3b3b98"

                    Text {
                        anchors.centerIn: parent
                        text: "\uf328"
                        font.family: fa.name
                        font.styleName: "Regular"
                        font.pixelSize: 20
                        color: "white"
                    }

                    TextInput {
                        id: textInput
                        visible: false
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            textInput.text = passBox.generatedPass;
                            textInput.selectAll();
                            textInput.copy();
                        }
                    }
                }

                Text {
                    id: genPass
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: copyClipboard.left
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 10
                    rightPadding: 20
                    color: "white"
                    clip: true
                }
            }


            RowLayout {
                Layout.fillWidth: true

                Text {
                    Layout.preferredWidth: 100
                    text: "Password Length"
                    wrapMode: Text.WordWrap
                    color: "white"
                }

                SpinBox {
                    id: control
                    Layout.fillWidth: true
                    Layout.preferredHeight: 22

                    editable: true
                    value: 20
                    up.indicator: Rectangle {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.topMargin: 1
                        anchors.rightMargin: 2
                        height: parent.height / 2 - 1
                        width: 15
                        color: "#E5E5E5"
                        Text {
                            anchors.centerIn: parent
                            text: '\uf106'
                            color: "gray"
                            font.family: fa2.name
                            font.styleName: "Solid"
                            font.pixelSize: 10
                        }
                    }
                    down.indicator: Rectangle {
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 1
                        anchors.rightMargin: 2
                        height: parent.height / 2 - 1
                        width: 15
                        color: "#E5E5E5"
                        Text {
                            anchors.centerIn: parent
                            text: '\uf107'
                            color: "gray"
                            font.family: fa2.name
                            font.styleName: "Solid"
                            font.pixelSize: 10
                        }
                    }

                    contentItem: TextInput {
                        z: 2
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        text: control.textFromValue(control.value, control.locale)
                        leftPadding: 10

                        font: control.font
                        horizontalAlignment: Qt.AlignLeft
                        verticalAlignment: Qt.AlignVCenter

                        readOnly: !control.editable
                        validator: control.validator
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 20

                Text {
                    Layout.preferredWidth: 200
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Include uppercase letters"
                    wrapMode: Text.WordWrap
                    color: "white"
                }

                CustomCheckbox {
                    id: cbUpperLetter
                    Layout.preferredWidth: 20
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight
                    checked: true
                    indicator.implicitHeight: 20
                    indicator.implicitWidth: 20
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 20

                Text {
                    Layout.preferredWidth: 200
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Include lowercase letters"
                    wrapMode: Text.WordWrap
                    color: "white"
                }

                CustomCheckbox {
                    id: cbLowerLetter
                    Layout.preferredWidth: 20
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight
                    checked: true
                    indicator.implicitHeight: 20
                    indicator.implicitWidth: 20
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 20

                Text {
                    Layout.preferredWidth: 200
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Include numbers"
                    wrapMode: Text.WordWrap
                    color: "white"
                }

                CustomCheckbox {
                    id: cbIncludeNumber
                    Layout.preferredWidth: 20
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight
                    indicator.implicitHeight: 20
                    indicator.implicitWidth: 20
                }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 20

                Text {
                    Layout.preferredWidth: 200
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text: "Include symbols"
                    wrapMode: Text.WordWrap
                    color: "white"
                }

                CustomCheckbox {
                    id: cbIncludeSymbol
                    Layout.preferredWidth: 20
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight
                    indicator.implicitHeight: 20
                    indicator.implicitWidth: 20
                }
            }

            Rectangle {
                Layout.topMargin: 20
                Layout.fillWidth: true
                Layout.preferredHeight: 35
                color: "#3b3b98"

                Text {
                    anchors.centerIn: parent
                    text: "Generate Password"
                    color: "white"
                    font.pixelSize: 18
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        var charSet = '';
                        if (passBox.upperLetter) {
                            charSet += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                        }
                        if (passBox.lowerLetter) {
                            charSet += 'abcdefghijklmnopqrstuvwxyz';
                        }
                        if (passBox.includeNumber) {
                            charSet += '0123456789';
                        }
                        if (passBox.includeSymbol) {
                            charSet += '@%+/\\\'!#$^?:.(){}[]~-_.';
                        }
                        passBox.generatedPass = Array.from({length: passBox.passLength}, () => charSet[Math.floor(Math.random() * charSet.length)]).join('');
                    }
                }
            }
        }
    }
}
