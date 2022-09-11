import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Drag N Drop")
    color: "steelblue"

    Text {
        anchors.fill: parent
        x: 100
        y: 100
        text: repeater.itemAt(0)
        font.pixelSize: 30
        color: "white"
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 20

        Repeater {
            id: repeater
            model: 5
            delegate: Rectangle {
                Layout.preferredHeight: 150
                Layout.preferredWidth: 150
                border.color: "black"
                border.width: 3
                color: dropArea.containsDrag ? "gray" : "white"

                DropArea {
                    id: dropArea
                    anchors.fill: parent
                }
            }

            Component.onCompleted: {
                        //Here all object are instantiated
                        for (var i = 0; i< repeater.count; i++){
                            print(repeater.itemAt(0).x);
                            print(repeater.itemAt(0).y);
                        }
                    }
        }
    }



    Image {
        source: "https://source.unsplash.com/random/150x150"
//        x: repeater.itemAt(0).x
//        y: repeater.itemAt(0).y
        height: 150
        width: 150

        Drag.active: imageDrag.drag.active

        MouseArea {
            id: imageDrag
            anchors.fill: parent
            drag.target: parent
        }
    }
}
