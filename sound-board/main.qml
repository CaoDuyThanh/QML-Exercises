import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15


Window {
    id: window
    width: 1200
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#A164DF"
    property variant words: ["applause", "boo", "gasp", "tada", "victory", "wrong"]
    property variant sounds: [audioApplause, audioBoo, audioGasp, audioTada, audioVictory, audioWrong]
    property QtObject currentSound: audioApplause

    Audio {
        id: audioApplause
        source: "./sounds/applause.mp3"
    }

    Audio {
        id: audioBoo
        source: "./sounds/boo.mp3"
    }

    Audio {
        id: audioGasp
        source: "./sounds/gasp.mp3"
    }

    Audio {
        id: audioTada
        source: "./sounds/tada.mp3"
    }

    Audio {
        id: audioVictory
        source: "./sounds/victory.mp3"
    }

    Audio {
        id: audioWrong
        source: "./sounds/wrong.mp3"
    }

    RowLayout {
        anchors.centerIn: parent
        height: 77
        spacing: 32

        Repeater {
            model: window.words.length
            delegate: Rectangle {
                color: "#663399"
                height: text.height + 1.5 * 2 * 16
                width: text.width + 3 * 2 * 16
                radius: 5
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: window.words[index]
                    color: "white"
                    font.pixelSize: 20
                }

                Rectangle {
                    anchors.fill: parent
                    opacity: 0.05
                    color: "white"
                    radius: 5
                    visible: mouseArea.isHover
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
                        window.currentSound.stop();
                        window.sounds[index].play();
                        window.currentSound = window.sounds[index];
                    }
                }
            }
        }
    }
}
