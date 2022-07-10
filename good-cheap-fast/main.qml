import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Good Cheap Fast")

    Column {
        id: multiChoice
        anchors.centerIn: parent
        height: 400
        spacing: 15
        property var choices: []

        function switchItem(status, item) {
            if (status === true) {
                choices.push(item);
            } else {
                choices = choices.filter(it => it !== item);
            }
            if (choices.length > 2) {
                var removedChoices = choices.splice(0, choices.length - 2);
                removedChoices.forEach((choice, index) => {
                    choice.isEnabled = false;
                });
            }
        }

        Text {
            id: text
            text: "How do you want your project to be?"
            font.pixelSize: 20
            bottomPadding: 40

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    multiChoice.choices = [3]
                }
            }
        }

        Switch {
            x: parent.width / 2 - 60
            text: "Good"
            onIsEnabledChanged: {
                multiChoice.switchItem(isEnabled, this);
            }
        }

        Switch {
            x: parent.width / 2 - 60
            text: "Cheap"
            onIsEnabledChanged: {
                multiChoice.switchItem(isEnabled, this);
            }
        }

        Switch {
            x: parent.width / 2 - 60
            text: "Fast"
            onIsEnabledChanged: {
                multiChoice.switchItem(isEnabled, this);
            }
        }
    }
}
