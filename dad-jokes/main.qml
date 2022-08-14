import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    width: 1000
    height: 800
    visible: true
    title: qsTr("Dad Jokes")
    color: "#686de0"

    Rectangle {
        id: jokeItem
        anchors.centerIn: parent
        color: "white"
        width: 800
        height: container.height + 50 * 2
        radius: 10

        function updateJoke() {
            var xHttpRequest = new XMLHttpRequest();
            xHttpRequest.open("GET", "https://icanhazdadjoke.com/", false);
            xHttpRequest.setRequestHeader("Accept", "application/json");
            xHttpRequest.send(null);
            var data = JSON.parse(xHttpRequest.responseText);
            joke.text = data["joke"];
        }

        ColumnLayout {
            id: container
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width - 20 * 2
            spacing: 50

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Don't Laugh Challenge"
                font.pixelSize: 20
                font.bold: true
                color: "gray"
            }

            Text {
                id: joke
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 600
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
                wrapMode: Text.WordWrap
            }

            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 50
                Layout.preferredWidth: 210

                Rectangle {
                    id: button
                    anchors.fill: parent
                    color: "#9f68e0"
                    radius: 10
                }

                DropShadow {
                   anchors.fill: button
                   horizontalOffset: 0
                   verticalOffset: 3
                   radius: 8.0
                   samples: 10
                   color: "gray"
                   source: button
               }

                Text {
                    id: buttonText
                    anchors.centerIn: parent
                    color: "white"
                    text: "Get Another Joke"
                    font.pixelSize: 14
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onPressed: {
                        buttonText.font.pixelSize = 13;
                    }

                    onReleased: {
                        buttonText.font.pixelSize = 14;
                    }

                    onClicked: {
                        jokeItem.updateJoke();
                    }
                }
            }
        }



        Component.onCompleted: {
            jokeItem.updateJoke();
        }
    }
}
