import QtQuick 2.0

Item {
    id: image
    property string source: ""
    property string sourceTemp: ""
    property alias fillMode: createImage.fillMode
    property int duration: 1000

    onSourceChanged: {
        destroyAnimation.start();
        createAnimation.start();
    }

    Image {
        id: deleteImage
        anchors.fill: parent
        source: image.sourceTemp
        fillMode: parent.fillMode

        NumberAnimation on opacity {
            id: destroyAnimation
            duration: image.duration
            from: 1
            to: 0

            onRunningChanged: {
                if (!running) {
                    image.sourceTemp = image.source;
                }
            }
        }
    }

    Image {
        id: createImage
        anchors.fill: parent
        source: image.source

        NumberAnimation on opacity {
            id: createAnimation
            duration: image.duration
            from: 0
            to: 1

        }
    }


}
