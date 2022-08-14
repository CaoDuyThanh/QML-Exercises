import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: nav
    width: 20
    height: 200

    property color color: "blue"
    property double radius: 10

    Canvas {
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = nav.color;
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(nav.width, 0);
            ctx.lineTo(nav.width, nav.height - nav.radius);
            ctx.arc(nav.width - nav.radius, nav.height - nav.radius, nav.radius, 0, Math.PI / 2, false);
            ctx.lineTo(nav.radius, nav.height);
            ctx.arc(nav.radius, nav.height - nav.radius, nav.radius, Math.PI / 2, Math.PI, false);
            ctx.lineTo(0, 0);
            ctx.fill();
        }
    }
}
