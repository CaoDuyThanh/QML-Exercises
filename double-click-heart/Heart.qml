import QtQuick 2.0

Text {
    id: text
    FontLoader {
        id: fa
        source: "./fonts/fa-solid-900.ttf"
    }

    property double maxSize: 0
    property double posX: 0
    property double posY: 0

    x: posX - maxSize / 2
    y: posY - maxSize / 2
    font.pixelSize: maxSize
    font.family: fa.name
    text: "\uf004"
    color: "red"
    opacity: (200 - maxSize) / 100

    NumberAnimation on maxSize {
        id: animation
        duration: 450
        running: true
        from: 0; to: 200

        onRunningChanged: {
            if (!running) {
                text.destroy();
            }
        }
    }
}
