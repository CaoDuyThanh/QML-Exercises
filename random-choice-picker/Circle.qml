import QtQuick 2.0

Rectangle {
    property double r: 10
    property double centerX: 0
    property double centerY: 0
    x: centerX - r
    y: centerY - r
    height: r * 2
    width: r * 2
    radius: r
}
