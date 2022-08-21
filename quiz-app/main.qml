import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "quiz.js" as Quiz

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Quiz App")
    color: "#b8c6db"
    property int quesId: 0
    property string choice: ''
    property int numCorrect: 0

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: questionView
    }

    Component {
        id: questionView

        Item {
            DropShadow {
                anchors.fill: item1
                source: item1
                samples: 17
                color: "gray"
                horizontalOffset: 3
                verticalOffset: 3
                opacity: 0.8
            }

            Item {
                id: item1
                anchors.fill: parent

                RoundRectangle {
                    id: rect
                    anchors.centerIn: parent
                    color: "white"
                    tlRadius: 10
                    trRadius: 10
                    width: 600
                    height: 400

                    ColumnLayout {
                        anchors.centerIn: parent
                        anchors.topMargin: 64
                        anchors.bottomMargin: 64
                        width: parent.width - 64 * 2

                        Text {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: parent.width - 32
                            Layout.topMargin: 16
                            Layout.bottomMargin: 16
                            horizontalAlignment: Text.AlignHCenter
                            text: Quiz.quizData[window.quesId].question
                            font.pixelSize: 30
                            wrapMode: Text.WordWrap
                        }

                        ColumnLayout {
                            id: options
                            Layout.alignment: Qt.AlignLeft
                            Layout.topMargin: 16
                            Layout.bottomMargin: 16

                            RadioButton {
                                text: Quiz.quizData[window.quesId].a
                                ButtonGroup.group: radioGroup
                                onCheckedChanged: {
                                    if (checked) {
                                        window.choice = "a";
                                    }
                                }
                            }
                            RadioButton {
                                text: Quiz.quizData[window.quesId].b
                                ButtonGroup.group: radioGroup
                                onCheckedChanged: {
                                    if (checked) {
                                        window.choice = "b";
                                    }
                                }
                            }
                            RadioButton {
                                text: Quiz.quizData[window.quesId].c
                                ButtonGroup.group: radioGroup
                                onCheckedChanged: {
                                    if (checked) {
                                        window.choice = "c";
                                    }
                                }
                            }
                            RadioButton {
                                text: Quiz.quizData[window.quesId].d
                                ButtonGroup.group: radioGroup
                                onCheckedChanged: {
                                    if (checked) {
                                        window.choice = "d";
                                    }
                                }
                            }
                        }
                    }
                }

                ButtonGroup {
                    id: radioGroup
                }

                RoundRectangle {
                    anchors.top: rect.bottom
                    anchors.horizontalCenter: rect.horizontalCenter
                    width: rect.width
                    height: 70
                    color: "#8e44ad"
                    blRadius: 10
                    brRadius: 10

                    Text {
                        anchors.centerIn: parent
                        text: "Submit"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        enabled: window.choice !== ''
                        onClicked: {
                            if (Quiz.quizData[window.quesId].correct === window.choice) {
                                window.numCorrect += 1;
                            }
                            radioGroup.checkState = Qt.Unchecked;
                            window.choice = ''
                            if (window.quesId + 1 > 3) {
                                console.log("here")
                                stack.push(resultView);
                            } else {
                                window.quesId += 1;
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: resultView

        Item {
            DropShadow {
                anchors.fill: item2
                source: item2
                samples: 17
                color: "gray"
                horizontalOffset: 3
                verticalOffset: 3
                opacity: 0.8
            }

            Item {
                id: item2
                anchors.fill: parent

                RoundRectangle {
                    id: rect
                    anchors.centerIn: parent
                    color: "white"
                    tlRadius: 10
                    trRadius: 10
                    width: 600
                    height: text.height + 32

                    Text {
                        id: text
                        anchors.centerIn: parent
                        text: "You answered " + window.numCorrect + "/4 questions correctly"
                        font.pixelSize: 30
                    }
                }

                RoundRectangle {
                    anchors.top: rect.bottom
                    anchors.horizontalCenter: rect.horizontalCenter
                    width: rect.width
                    height: 70
                    color: "#8e44ad"
                    blRadius: 10
                    brRadius: 10

                    Text {
                        anchors.centerIn: parent
                        text: "Reload"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            window.choice = '';
                            window.quesId = 0;
                            window.numCorrect = 0;
                            stack.pop();
                        }
                    }
                }
            }
        }
    }
}
