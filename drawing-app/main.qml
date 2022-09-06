import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Window {
    id: window
    width: 900
    height: 900
    visible: true
    title: qsTr("Drawing App")

    property int brushSize: 10
    property color brushColor: "black"

    ColorDialog {
        id: colorDialog
        title: "Please choose a color"
        currentColor: window.brushColor

        onAccepted: {
            window.brushColor = color;
            Qt.quit()
        }
        onRejected: {
            Qt.quit()
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: 800
        height: 800
        color: "steelblue"
        border.color: "steelblue"
        border.width: 20

        ColumnLayout {
            anchors.fill: parent

            Canvas {
                id: canvas
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 2
                Layout.leftMargin: 2
                Layout.rightMargin: 2
                Layout.fillWidth: true
                Layout.preferredHeight: 700

                property real lastX: -10
                property real lastY: -10
                property bool isDrawing: false

                function reset() {
                    var ctx = getContext("2d");
                    ctx.fillStyle = Qt.rgba(1, 1, 1, 1);
                    ctx.fillRect(0, 0, width, height);
                    lastX = -10;
                    lastY = -10;
                    canvas.requestPaint();
                }

                onPaint: {
                    if (canvas.isDrawing) {
                        var ctx = getContext("2d");
                        ctx.beginPath();
                        ctx.arc(lastX, lastY, window.brushSize, 0, 2 * Math.PI, false);
                        ctx.fillStyle = window.brushColor;
                        ctx.fill();
                        ctx.lineWidth = window.brushSize * 2;
                        ctx.strokeStyle = window.brushColor;
                        ctx.beginPath();
                        ctx.moveTo(lastX, lastY);
                        lastX = area.mouseX;
                        lastY = area.mouseY;
                        ctx.lineTo(lastX, lastY);
                        ctx.stroke();
                    }
                }

                onAvailableChanged: {
                    if (available) {
                        canvas.reset();
                    }
                }

                MouseArea {
                    id: area
                    anchors.fill: parent
                    onPressed: {
                        canvas.isDrawing = true;
                        canvas.lastX = mouseX;
                        canvas.lastY = mouseY;
                    }
                    onReleased: {
                        canvas.isDrawing = false;
                    }
                    onPositionChanged: {
                        canvas.requestPaint()
                    }
                }
            }

            RowLayout {
                id: something
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredHeight: 100
                Layout.preferredWidth: parent.width
                Layout.leftMargin: 16
                Layout.rightMargin: 16
                spacing: 20

                Rectangle {
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    Text {
                        anchors.centerIn: parent
                        text: "-"
                        font.pixelSize: 25
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            window.brushSize = Math.max(0, window.brushSize - 1);
                        }
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    Text {
                        anchors.centerIn: parent
                        text: window.brushSize
                        font.pixelSize: 25
                        font.bold: true
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    Text {
                        anchors.centerIn: parent
                        text: "+"
                        font.pixelSize: 25
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            window.brushSize = Math.min(20, window.brushSize + 1);
                        }
                    }
                }

                Rectangle {
                    Layout.alignment: Qt.AlignLeft
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50
                    color: "white"

                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - 10
                        height: parent.height - 10
                        color: window.brushColor

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                colorDialog.open();
                            }
                        }
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    Layout.alignment: Qt.AlignRight
                    Layout.preferredWidth: 50
                    Layout.preferredHeight: 50

                    Text {
                        anchors.centerIn: parent
                        text: "X"
                        font.pixelSize: 25
                        font.bold: true
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            canvas.reset();
                        }
                    }
                }
            }
        }
    }
}
