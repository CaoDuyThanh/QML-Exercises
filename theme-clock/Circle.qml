import QtQuick 2.0

Rectangle {
    property double r: 10
    property double posX: 0;
    property double posY: 0;
    x: posX - r
    y: posY - r
    width: r * 2
    height: r * 2
    radius: r
}
