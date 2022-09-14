import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Insect Catch Game")
    color: "#516dff"
    property string insectSource: ""

    FontLoader {
        id: fontLoader
        source: "./fonts/PressStart2P-Regular.ttf"
    }

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }

    Component {
        id: mainView

        Item {

            Item {
                anchors.centerIn: parent

                Text {
                    id: titleText
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Catch The Insect"
                    color: "white"
                    font.family: fontLoader.name
                    font.bold: true
                    font.pixelSize: 30
                }

                Rectangle {
                    anchors.top: titleText.bottom
                    anchors.topMargin: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: mouseArea.isHover ? "#F8F8F8" : "white"
                    width: playText.width + 20 * 2
                    height: playText.height + 15 * 2

                    Text {
                        id: playText
                        anchors.centerIn: parent
                        color: "#516dff"
                        text: "Play Game"
                        font.family: fontLoader.name
                        font.pixelSize: 13
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        property bool isHover: false

                        onEntered: {
                            isHover = true;
                        }

                        onExited: {
                            isHover = false;
                        }

                        onClicked: {
                            stack.push(selectInsect);
                        }
                    }
                }
            }
        }
    }

    Component {
        id: selectInsect

        Item {

            Item {
                anchors.centerIn: parent

                Text {
                    id: insectText
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "What is your \"favorite\" insect?"
                    color: "white"
                    font.family: fontLoader.name
                    font.bold: true
                    font.pixelSize: 30
                }

                RowLayout {
                    anchors.top: insectText.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        Layout.preferredHeight: 150
                        Layout.preferredWidth: 150
                        color: mouseArea1.isHover ? "white" : "transparent"
                        border.color: "white"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Fly"
                                color: mouseArea1.isHover ? "#516dff" : "white"
                                font.family: fontLoader.name
                                font.pixelSize: 13
                            }

                            Image {
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 100
                                source: "fly.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        MouseArea {
                            id: mouseArea1
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            property bool isHover: false

                            onEntered: {
                                isHover = true;
                            }

                            onExited: {
                                isHover = false;
                            }

                            onClicked: {
                                window.insectSource = "fly.png";
                                stack.push(playInsect);
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredHeight: 150
                        Layout.preferredWidth: 150
                        color: mouseArea2.isHover ? "white" : "transparent"
                        border.color: "white"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Mosquito"
                                color: mouseArea2.isHover ? "#516dff" : "white"
                                font.family: fontLoader.name
                                font.pixelSize: 13
                            }

                            Image {
                                id: mosquito
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 100
                                source: "mosquito.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        MouseArea {
                            id: mouseArea2
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            property bool isHover: false

                            onEntered: {
                                isHover = true;
                            }

                            onExited: {
                                isHover = false;
                            }

                            onClicked: {
                                window.insectSource = "mosquito.png";
                                stack.push(playInsect);
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredHeight: 150
                        Layout.preferredWidth: 150
                        color: mouseArea3.isHover ? "white" : "transparent"
                        border.color: "white"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Spider"
                                color: mouseArea3.isHover ? "#516dff" : "white"
                                font.family: fontLoader.name
                                font.pixelSize: 13
                            }

                            Image {
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 100
                                source: "spider.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        MouseArea {
                            id: mouseArea3
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            property bool isHover: false

                            onEntered: {
                                isHover = true;
                            }

                            onExited: {
                                isHover = false;
                            }

                            onClicked: {
                                window.insectSource = "spider.png";
                                stack.push(playInsect);
                            }
                        }
                    }

                    Rectangle {
                        Layout.preferredHeight: 150
                        Layout.preferredWidth: 150
                        color: mouseArea4.isHover ? "white" : "transparent"
                        border.color: "white"
                        border.width: 2

                        ColumnLayout {
                            anchors.centerIn: parent
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Text {
                                Layout.alignment: Qt.AlignHCenter
                                text: "Roach"
                                color: mouseArea4.isHover ? "#516dff" : "white"
                                font.family: fontLoader.name
                                font.pixelSize: 13
                            }

                            Image {
                                Layout.preferredWidth: 100
                                Layout.preferredHeight: 100
                                source: "roach.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        MouseArea {
                            id: mouseArea4
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            property bool isHover: false

                            onEntered: {
                                isHover = true;
                            }

                            onExited: {
                                isHover = false;
                            }

                            onClicked: {
                                window.insectSource = "roach.png";
                                stack.push(playInsect);
                            }
                        }
                    }
                }
            }
        }
    }

    Component {
        id: playInsect

        Item {
            id: playWindow
            property int numMaxCreated: 1
            property int numCreated: 1
            property int score: 0

            function pad(num, size) {
                num = num.toString();
                while (num.length < size) num = "0" + num;
                return num;
            }

            function getRandomArbitrary(min, max) {
              return Math.random() * (max - min) + min;
            }

            function createInsect() {
                var component;
                var insect;
                component = Qt.createComponent("Insect.qml");
                if (component.status === Component.Ready){
                    insect = component.createObject(playWindow);
                    insect.centerX = getRandomArbitrary(100, window.width - 100);
                    insect.centerY = getRandomArbitrary(100, window.height - 100);
                    insect.angle = getRandomArbitrary(0, 360);
                    insect.source = window.insectSource;
                    insect.onIsKilledChanged.connect(function() {
                        playWindow.score += 1;
                        playWindow.numMaxCreated = Math.min(10, playWindow.numMaxCreated + 1);
                        playWindow.numCreated += playWindow.numMaxCreated;
                    });
                } else {
                    console.log("Error creating new component", component.errorString());
                }
            }

            Timer {
                id: timer
                running: true
                repeat: true
                property int counter: 0
                onTriggered: {
                    counter += 1;
                }
            }

            Timer {
                interval: 500
                running: true
                repeat: true
                onTriggered: {
                    if (playWindow.numCreated > 0) {
                        playWindow.numCreated -= 1;
                        playWindow.createInsect();
                    }
                }
            }

            Text {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 30
                anchors.leftMargin: 20
                text: "Time: " + pad(Math.floor(timer.counter / 60), 2) + ":" + pad(timer.counter % 60, 2)
                color: "white"
                font.family: fontLoader.name
                font.pixelSize: 20
            }

            Text {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 30
                anchors.rightMargin: 20
                text: "Score: " + playWindow.score
                color: "white"
                font.family: fontLoader.name
                font.pixelSize: 20
            }

            Item {
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: 85
                visible: playWindow.score > 20

                Rectangle {
                    anchors.fill: parent
                    color: "black"
                    opacity: 0.5
                }

                Text {
                    anchors.centerIn: parent
                    text: "Are you annnoyed yet?\nYou are playing an impossible game!!"
                    horizontalAlignment: Text.AlignHCenter
                    color: "white"
                    lineHeight: 1.7
                    font.family: fontLoader.name
                    font.pixelSize: 16
                }
            }
        }
    }
}
