import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Pokedex")

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, window.height / 2)
        end: Qt.point(window.width, window.height / 2)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#d4d3dd" }
            GradientStop { position: 1.0; color: "#efefbb" }
        }
    }

    ScrollView {
        anchors.fill: parent
        contentHeight: topText.height + grid.height + 20

        Text {
            id: topText
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 16
            bottomPadding: 16
            text: "Pokedex"
            font.pixelSize: 35
        }

        Grid {
            id: grid
            anchors.top: topText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 6
            rows: 25
            rowSpacing: 20
            columnSpacing: 20

            Repeater {
                model: 150
                delegate: Card {
                    id: card

                    Component.onCompleted: {
                        var xmlHttp = new XMLHttpRequest();
                        xmlHttp.open( "GET", "https://pokeapi.co/api/v2/pokemon/" + (index + 1), true );
                        xmlHttp.onload = (e) => {
                            var result = JSON.parse(xmlHttp.responseText);
                            card.type = result.types[0].type.name;
                            card.name = result.name;
                            card.number = index + 1;
                            card.image = result.sprites.front_default;
                        };
                        xmlHttp.send( null );
                    }
                }
            }
        }
    }
}
