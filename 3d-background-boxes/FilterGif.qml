import QtQuick 2.15

Item {
    id: filterGif
    property int gifWidth: 100
    property int gifHeight: 100
    property double xStart: 0
    property double yStart: 0
    clip: true

    AnimatedImage {
        id: animation;
        source: "giphy.gif"
        x: - parent.gifWidth * parent.xStart
        y: - parent.gifHeight * parent.yStart
        width: parent.gifWidth
        height: parent.gifHeight
    }

}
