import QtQuick 2.0

Canvas {
    id: mycanvas
    property color color: "white"
    property double tlRadius: 0
    property double trRadius: 0
    property double blRadius: 0
    property double brRadius: 0

    onPaint: {
        var ctx = getContext("2d");
        ctx.fillStyle = mycanvas.color;
        ctx.beginPath();
        ctx.moveTo(mycanvas.tlRadius, 0);
        ctx.lineTo(mycanvas.width - mycanvas.trRadius, 0);
        ctx.arc(mycanvas.width - mycanvas.trRadius, mycanvas.trRadius, mycanvas.trRadius, -Math.PI / 2, 0, false);
        ctx.lineTo(mycanvas.width, mycanvas.height - mycanvas.brRadius);
        ctx.arc(mycanvas.width - mycanvas.brRadius, mycanvas.height - mycanvas.brRadius, mycanvas.brRadius, 0, Math.PI / 2, false);
        ctx.lineTo(mycanvas.radius, mycanvas.height);
        ctx.arc(mycanvas.blRadius, mycanvas.height - mycanvas.blRadius, mycanvas.blRadius, Math.PI / 2, Math.PI, false);
        ctx.lineTo(0, mycanvas.tlRadius);
        ctx.arc(mycanvas.tlRadius, mycanvas.tlRadius, mycanvas.tlRadius, Math.PI, Math.PI * 3 / 2, false);
        ctx.fill();
    }
}
