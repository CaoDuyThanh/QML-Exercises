import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 1000
    height: 600
    visible: true
    title: qsTr("Drag N Drop")
    color: "steelblue"
    property QtObject image;

    Component {
        id: dragImage
        Image {
            id: image
            source: "https://source.unsplash.com/random/150x150"
            height: 150 - 6
            width: 150 - 6
            property QtObject currentObj: null

            Drag.active: imageDrag.drag.active
            Drag.hotSpot.x: 0
            Drag.hotSpot.y: 0

            MouseArea {
                id: imageDrag
                anchors.fill: parent
                drag.target: parent

                onReleased: {
                    if (image.Drag.target !== null) {
                        let pos_abs = rowLayout.mapFromItem(image.Drag.target, 0, 0);
                        image.x = pos_abs.x + 3;
                        image.y = pos_abs.y + 3;
                        image.currentObj = image.Drag.target;
                    } else {
                        let pos_abs = rowLayout.mapFromItem(image.currentObj, 0, 0);
                        image.x = pos_abs.x + 3;
                        image.y = pos_abs.y + 3;
                    }
                }
            }
        }
    }

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 20

        Repeater {
            id: repeater
            model: 5
            delegate: Rectangle {
                id: rect
                Layout.preferredHeight: 150
                Layout.preferredWidth: 150
                border.color: "black"
                border.width: dropArea.containsDrag ? 0 : 3
                color: dropArea.containsDrag ? "#0F0F0F" : "white"

                Item {
                    anchors.fill: parent
                }

                Component.onCompleted: {
                    if (index === 0) {
                        var image = dragImage.createObject(repeater);
                        image.x = rect.x + 3;
                        image.y = rect.y + 3;
                        image.currentObj = rect;
                        window.image = image;
                    }
                }

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

        MouseArea {
            id: layoutMouseArea
            width: rowLayout.childrenRect.width
            height: rowLayout.childrenRect.height
            propagateComposedEvents: true

            onPressed: {
                 mouse.accepted = false;
            }

            onMouseXChanged: {
                window.image.Drag.hotSpot.x = mouseX - window.image.x;
            }

            onMouseYChanged: {
                window.image.Drag.hotSpot.y = mouseY - window.image.y;
            }
        }
    }
}
