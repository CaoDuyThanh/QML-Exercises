import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Feedback UI Design")
    color: "#fef9f2"

    property string userRating: ""

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }

    FontLoader {
        id: fa5
        source: "./fonts/fa-solid-900.ttf"
    }

    Component {
        id: mainView
        Item {
            DropShadow {
                anchors.fill: rect
                source: rect
                color: "gray"
                samples: 17
                radius: 10
            }

            Rectangle {
                id: rect
                anchors.centerIn: parent
                width: 400
                height: control.height
                color: "white"
                radius: 5

                Control {
                    id: control
                    anchors.fill: parent
                    leftPadding: 30
                    rightPadding: 30
                    topPadding: 30
                    bottomPadding: 30

                    contentItem: ColumnLayout {
                        width: control.width - 30 * 2
                        spacing: 30

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 250
                            horizontalAlignment: Qt.AlignHCenter
                            text: "How satisfied are you with our customer support performance?"
                            wrapMode: Text.WordWrap
                            font.pixelSize: 16
                            lineHeight: 1.1
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignHCenter
                            width: control.width
                            spacing: 10

                            RatingBox {
                                width: 100
                                height: 85
                                icon: "\uf57a"
                                text: "Unhappy"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        window.userRating = "Unhappy"
                                    }
                                }
                            }

                            RatingBox {
                                width: 100
                                height: 85
                                icon: "\uf11a"
                                text: "Neutral"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        window.userRating = "Neutral"
                                    }
                                }
                            }

                            RatingBox {
                                width: 100
                                height: 85
                                icon: "\uf118"
                                text: "Satisfied"

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        window.userRating = "Satisfied"
                                    }
                                }
                            }
                        }

                        Rectangle {
                            Layout.alignment: Qt.AlignHCenter
                            color: "black"
                            radius: 5
                            width: 140
                            height: 40

                            Text {
                                anchors.centerIn: parent
                                color: "white"
                                text: "Send Review"
                                font.pixelSize: 13
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    stack.push(feedbackView);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: feedbackView

        Item {
            DropShadow {
                anchors.fill: rect
                source: rect
                color: "gray"
                samples: 17
                radius: 10
            }

            Rectangle {
                id: rect
                anchors.centerIn: parent
                width: 400
                height: control.height
                color: "white"
                radius: 5

                Control {
                    id: control
                    anchors.fill: parent
                    leftPadding: 30
                    rightPadding: 30
                    topPadding: 30
                    bottomPadding: 30

                    contentItem: ColumnLayout {
                        width: control.width - 30 * 2
                        spacing: 15

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            text: "\uf004"
                            color: "red"
                            horizontalAlignment: Text.AlignHCenter
                            font.family: fa5.name
                            font.styleName: "Solid"
                            font.pixelSize: 30
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            horizontalAlignment: Text.AlignHCenter
                            text: "Thank You!\n" + "Feedback: " + window.userRating
                            font.pixelSize: 17
                        }

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 270
                            horizontalAlignment: Text.AlignHCenter
                            text: "We'll use your feedback to improve our customer support"
                            wrapMode: Text.WordWrap
                            font.pixelSize: 15

                        }
                    }
                }
            }
        }
    }




}
