import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Double Click Heart")
    property int like: 0

    FontLoader {
        id: fa
        source: "./fonts/fa-solid-900.ttf"
    }

    FontLoader {
        id: oswald
        source: "./fonts/Oswald-Regular.ttf"
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.verticalCenter: parent.verticalCenter
                topPadding: 20
                text: "Double click on the image to "
                font.pixelSize: 20
                font.family: oswald.name
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                topPadding: 20
                text: "\uf004"
                font.pixelSize: 18
                font.family: fa.name
                font.styleName: "Solid"
                color: "red"
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                topPadding: 20
                text: " it"
                font.pixelSize: 20
                font.family: oswald.name
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "You liked it " + window.like + " times"
            font.family: oswald.name
            font.pixelSize: 14
            bottomPadding: 20
        }

        Item {
            width: 300
            height: 440

            Image {
                id: image
                anchors.fill: parent
                source: "photo.png"
                fillMode: Image.PreserveAspectFit
            }

            DropShadow {
                anchors.fill: image
                source: image
                verticalOffset: 5
                horizontalOffset: 5
                samples: 30
                color: "lightgray"
            }

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: {
                    window.like += 1;
                    var component;
                    var heart;
                    component = Qt.createComponent("Heart.qml");
                    if (component.status === Component.Ready){
                        heart = component.createObject(image);
                        heart.posX = mouseX;
                        heart.posY = mouseY;
                    } else {
                        console.log("Error creating new component", component.errorString());
                    }
                }
            }
        }
    }
}
