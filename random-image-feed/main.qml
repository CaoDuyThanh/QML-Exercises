import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 1280
    height: 920
    visible: true
    title: qsTr("Random Image Feed")

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentHeight: column.height + 20

        ColumnLayout {
            id: column
            x: (scrollView.width - width) / 2
            spacing: 30

            Text {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 30
                text: "Random Image Feed"
                font.pixelSize: 30
                font.bold: true
            }

            GridLayout {
                Layout.alignment: Qt.AlignHCenter
                columns: 3
                rows: 5
                rowSpacing: 20
                columnSpacing: 20

                Repeater {
                    model: 15

                    delegate: Image {
                        id: image
                        source: "https://source.unsplash.com/random/" + 30 + index % 3 + "x" + 30 + index % 5
                        width: 308
                        height: 304
                    }
                }
            }
        }
    }
}
