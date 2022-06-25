import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12
import QtQuick.Controls 2.15

Window {
    id: screen
    width: 640
    height: 480
    visible: true
    title: qsTr("Scroll Animation")
    color: "#efedd6"

    ScrollView {
        id: scrollView
        anchors.fill: parent
        spacing: 20

        ColumnLayout {
            id: columnLayout
            width: screen.width
            spacing: 10

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Scroll to see the animation"
                color: "black"
                font.pixelSize: 30
                font.bold: true
            }

            Repeater {
                model: 20

                delegate: Item {
                    id: item
                    Layout.alignment: Qt.AlignHCenter
                    property bool isEven: index % 2 == 0
                    width: 400
                    height: 200

                    Flickable {
                        id: flickable
                        anchors.fill: parent
                    }

                    state: calculateState()

                    states: [
                        State {
                            name: "show"
                            PropertyChanges { target: item; x: (columnLayout.width - item.width) / 2}
                        },
                        State {
                            name: "hide"
                            PropertyChanges { target: item; x: item.isEven ? screen.width : -item.width - 10 }
                        }
                    ]

                    function calculateState() {
                        const contentScroll = scrollView.contentHeight - scrollView.height;
                        const scrollRatio = 1 - scrollView.ScrollBar.vertical.size;
                        const visibleStartY = scrollView.ScrollBar.vertical.position / scrollRatio * contentScroll;
                        const visibleEndY = visibleStartY + scrollView.height;
                        const itemStartY = y;
                        const itemEndY = y + item.height;
                        const visibleRatio = Math.max(Math.min(itemEndY, visibleEndY) - Math.max(itemStartY, visibleStartY), 0) / item.height;

                        if (visibleRatio >= 0.5) {
                            return "show";
                        }
                        return "hide";
                    }

                    DropShadow {
                        anchors.fill: parent
                        horizontalOffset: 2
                        verticalOffset: 2
                        radius: 10
                        samples: 20
                        color: "gray"
                        source: rect
                    }


                    Rectangle {
                        id: rect
                        anchors.fill: parent
                        color: "steelblue"
                        radius: 10

                        Text {
                            anchors.centerIn: parent
                            text: "Content"
                            color: "white"
                            font.bold: true
                            font.pixelSize: 40
                        }
                    }

                    Behavior on x { PropertyAnimation { } }
                }
            }
        }



    }
}
