import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Hoverboard")
    color: "black"

    GridLayout {
        anchors.centerIn: parent
        width: 400
        height: width / columns * rows
        columns: 20
        rows: 25

        Repeater {
            model: parent.columns * parent.rows

            Rectangle {
                id: rect
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: Qt.rgba(105/255, 105/255, 105/255, 0.3)

                RectangularGlow {
                    id: effect
                    anchors.fill: rect
                    glowRadius: 5
                    spread: 0.2
                    color: rect.color
                    cornerRadius: rect.radius + glowRadius
                }

                states: [
                    State {
                        name: "fading"
                        PropertyChanges { target: rect; color: Qt.rgba(105/255, 105/255, 105/255, 0.3) }
                    }
                ]

                transitions: Transition {
                    to: "fading"
                    ColorAnimation {
                        duration: 1000;
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: function () {
                        rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                        rect.state = "";
                    }
                    onExited: function() {
                        rect.state = "fading";
                    }
                }
            }
        }
    }
}
