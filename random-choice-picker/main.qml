import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Random Choice Picker")
    color: "#2b88f0"

    property variant choices: choicesTxt.text.split(",").filter(n => n)
    property int tempInd: -1

    Timer {
        id: timer
        property int numLoop: 0
        repeat: numLoop > 0
        interval: 70
        onTriggered: {
            numLoop = numLoop - 1;
            window.tempInd = Math.floor(Math.random() * window.choices.length);
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            text: "Enter all of the choices divided by a comma (',').\n" +
                  "Press enter when you're done"
            color: "white"
        }

        TextField {
            id: choicesTxt
            Layout.preferredWidth: 500
            Layout.preferredHeight: 100
            verticalAlignment: TextField.AlignTop
            placeholderText: "Enter choices here..."

            onActiveFocusChanged: {
                if (focus & window.tempInd !== -1) {
                    window.tempInd = -1;
                    text = "";
                }
            }

            Keys.onReturnPressed: {
                focus = false;
                timer.numLoop = 30;
                timer.start();
            }
        }

        Flow {
            Layout.fillWidth: true
            spacing: 5

            Repeater {
                model: window.choices.length

                delegate: EggShape {
                    width: text.implicitWidth + height
                    height: 38
                    color: index === window.tempInd ? "#273c75" : "#f0932b"
                    Text {
                        id: text
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: window.choices[index]
                        color: "white"
                    }
                }
            }
        }
    }
}
