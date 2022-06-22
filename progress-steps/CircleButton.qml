import QtQuick 2.0

Rectangle {
    property double r: 5
    property string t: ""
    width: r
    height: r
    radius: r / 2
    color: "white"
    border.color: "lightblue"
    border.width: r / 7

    Text {
        anchors.centerIn: parent
        text: parent.t
        color: "black"
    }
}
