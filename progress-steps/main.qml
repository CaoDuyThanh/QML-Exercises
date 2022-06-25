import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Progress Steps")

    ColumnLayout {
        id: progressStep
        anchors.centerIn: parent
        width: 300
        height: 104

        property int currentNum: 1

        Item {
            Layout.alignment: Qt.AlignTop
            Layout.preferredHeight: 30
            Layout.minimumHeight: 30
            Layout.maximumHeight: 30
            Layout.fillWidth: true

            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: 4
                color: "lightgray"
            }

            Rectangle {
                id: progressBar
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width / 3 * (progressStep.currentNum - 1)
                height: 4
                color: "#3498db"

                Behavior on width { NumberAnimation { duration: 500 } }
            }


            RowLayout {
                width: parent.width
                x: -15

                CircleButton {
                    r: 30
                    t: "1"
                    border.color: progressStep.currentNum >= 1 ? "#3498db" : "lightgray"

                    Behavior on border.color { PropertyAnimation { duration: 500 } }
                }

                CircleButton {
                    r: 30
                    t: "2"
                    border.color: progressStep.currentNum >= 2 ? "#3498db" : "lightgray"

                    Behavior on border.color { PropertyAnimation { duration: 500 } }
                }

                CircleButton {
                    x: parent.x
                    r: 30
                    t: "3"
                    border.color: progressStep.currentNum >= 3 ? "#3498db" : "lightgray"

                    Behavior on border.color { PropertyAnimation { duration: 500 } }
                }

                Item {
                    Layout.alignment: Qt.AlignRight
                    width: parent.width
                    height: parent.height

                    CircleButton {
                        x: parent.width
                        r: 30
                        t: "4"
                        border.color: progressStep.currentNum >= 4 ? "#3498db" : "lightgray"

                        Behavior on border.color { PropertyAnimation { duration: 500 } }
                    }
                }
            }
        }

        Item {
            Layout.alignment: Qt.AlignBottom
            Layout.preferredHeight: 34
            Layout.minimumHeight: 34
            Layout.maximumHeight: 34
            Layout.fillWidth: true

            RowLayout {
                anchors.centerIn: parent
                spacing: 10

                CustomButton {
                    height: 34
                    width: 90
                    t: "Prev"
                    color: progressStep.currentNum == 1 ? "lightgray" : "#3498db"

                    MouseArea {
                        anchors.fill: parent

                        onClicked: function () {
                            progressStep.currentNum = Math.max(1, progressStep.currentNum - 1);
                        }
                    }
                }

                CustomButton {
                    height: 34
                    width: 90
                    t: "Next"
                    color: progressStep.currentNum == 4 ? "lightgray" : "#3498db"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: function () {
                            progressStep.currentNum = Math.min(4, progressStep.currentNum + 1);
                        }
                    }
                }
            }
        }
    }
}
