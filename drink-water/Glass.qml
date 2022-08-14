import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: glass
    width: 20
    height: 200

    property color colorEmpty: "white"
    property color color: "blue"
    property color borderColor: "black"
    property double borderWidth: 5
    property double radius: 10
    property double percentage: 1
    property alias textRemain: textRemain.text
    property alias text: text.text
    property alias textRemainFont: textRemain.font
    property alias textFont: text.font
    property color textRemainColor: "black"
    property color textColor: "black"

    Behavior on color { PropertyAnimation { duration: 500 } }
    Behavior on textColor { PropertyAnimation { duration: 500 } }
    Behavior on percentage { NumberAnimation { duration: 500 } }

    Canvas {
        id: fillGlass
        anchors.fill: parent
        visible: false

        onPaint: {
            var ctx = getContext("2d");

            // Fill glass
            ctx.fillStyle = glass.color;
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(glass.width, 0);
            ctx.lineTo(glass.width, glass.height - glass.radius);
            ctx.arc(glass.width - glass.radius, glass.height - glass.radius, glass.radius, 0, Math.PI / 2, false);
            ctx.lineTo(glass.radius, glass.height);
            ctx.arc(glass.radius, glass.height - glass.radius, glass.radius, Math.PI / 2, Math.PI, false);
            ctx.lineTo(0, 0);
            ctx.fill();
        }
    }

    Item {
        anchors.fill: parent

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: fillGlass
        }

        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: parent.height * (1 - glass.percentage)
            color: glass.colorEmpty

            Text {
                id: textRemain
                anchors.centerIn: parent
                text: "something"
                visible: (1 - glass.percentage) > 0
                wrapMode: Text.WordWrap
                color: glass.textRemainColor
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height * glass.percentage
            color: glass.color

            Text {
                id: text
                anchors.centerIn: parent
                text: "something"
                visible: glass.percentage > 0
                wrapMode: Text.WordWrap
                color: glass.textColor
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.strokeStyle = glass.borderColor;
            ctx.lineWidth = glass.borderWidth;

            ctx.beginPath();
            ctx.moveTo(glass.borderWidth / 2, glass.borderWidth / 2);
            ctx.lineTo(glass.width - glass.borderWidth / 2, glass.borderWidth / 2);
            ctx.lineTo(glass.width - glass.borderWidth / 2, glass.height - glass.radius - glass.borderWidth / 2);
            ctx.arc(glass.width - glass.radius - glass.borderWidth / 2, glass.height - glass.radius - glass.borderWidth / 2, glass.radius, 0, Math.PI / 2, false);
            ctx.lineTo(glass.radius + glass.borderWidth / 2, glass.height - glass.borderWidth / 2);
            ctx.arc(glass.radius + glass.borderWidth / 2, glass.height - glass.radius - glass.borderWidth / 2, glass.radius, Math.PI / 2, Math.PI, false);
            ctx.lineTo(glass.borderWidth / 2, glass.borderWidth / 2);
            ctx.stroke();
        }
    }




}


