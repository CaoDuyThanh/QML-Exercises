import QtQuick 2.0

Canvas {
    id: triangle
    width: 100
    height: 200
    property string color: ""

    onPaint: {
        var ctx = getContext("2d");
        ctx.fillStyle = triangle.color;
        ctx.beginPath();
        ctx.moveTo(0, 0);
        ctx.lineTo(triangle.width / 2, triangle.height / 2);
        ctx.lineTo(0, triangle.height);
        ctx.lineTo(0, 0);
        ctx.fill();
    }
}
