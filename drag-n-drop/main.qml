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
                border.width: dropArea.containsDrag ? 0 : 3
                color: dropArea.containsDrag ? "#0F0F0F" : "white"

                Canvas{
                    id: canvas
                    anchors.fill: parent
                    visible: dropArea.containsDrag

                    onPaint:{
                        var ctx = getContext("2d");
                        ctx.lineWidth = 5;
                        ctx.strokeStyle = "#FFFFFF";
                        ctx.setLineDash([2, 2]);
                        ctx.beginPath();
                        ctx.moveTo(0, 0);
                        ctx.lineTo(canvas.width, 0);
                        ctx.lineTo(canvas.width, canvas.height);
                        ctx.lineTo(0, canvas.height);
                        ctx.lineTo(0, 0);
                        ctx.stroke();
                     }
                }

                DropArea {
                    id: dropArea
                    anchors.fill: parent
                }
            }
        }
    }


    Image {
        id: image
        source: "https://source.unsplash.com/random/150x150"
        height: 150
        width: 150

        Drag.active: imageDrag.drag.active
        Drag.hotSpot.x: 0
        Drag.hotSpot.y: 0

        MouseArea {
            id: imageDrag
            anchors.fill: parent
            drag.target: parent
        }
    }
}
