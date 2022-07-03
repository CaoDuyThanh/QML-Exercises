import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1920
    height: 960
    visible: true
    title: qsTr("Split Landing Page")

    SplitPage {
        id: splitPage
        anchors.fill: parent
    }
}
