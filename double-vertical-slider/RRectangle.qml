import QtQuick 2.0

Canvas {
    id: canvas
    width: 400
    height: 300
    property var r: { "r1": 0, "r2": 0, "r3": 0, "r4": 0 }
    property string color: "blue"
    property int borderWidth: 2
    property string borderColor: "black"

    onPaint: {
        var ctx = getContext("2d");
//        ctx.fillStyle = canvas.color;
//        ctx.fillRect(0, 0, width, height);
//        ctx.beginPath();
//        ctx.moveTo(0, 0);
//        ctx.lineTo(300, 150);
//        ctx.stroke();

        ctx.beginPath();
        ctx.lineWidth = canvas.borderWidth;
        ctx.strokeStyle = canvas.borderColor;
        ctx.fillStyle = canvas.color;
        ctx.moveTo(0, canvas.r.r1);
        ctx.arc(canvas.r.r1, canvas.r.r1, canvas.r.r1, Math.PI, -Math.PI / 2.0, false);
        ctx.lineTo(canvas.width - canvas.r.r2, 0);
        ctx.arc(canvas.width - canvas.r.r2, canvas.r.r2, canvas.r.r2, -Math.PI / 2, 0, false);
        ctx.lineTo(canvas.width, canvas.height - canvas.r.r3);
        ctx.arc(canvas.width - canvas.r.r3, canvas.height - canvas.r.r3, canvas.r.r3, 0, Math.PI / 2.0, false);
        ctx.lineTo(canvas.r.r4, canvas.height);
        ctx.arc(canvas.r.r4, canvas.height - canvas.r.r4, canvas.r.r4, Math.PI / 2.0, Math.PI, false);
        ctx.lineTo(0, canvas.r.r1);
        ctx.fill();
        ctx.stroke();
    }
}
