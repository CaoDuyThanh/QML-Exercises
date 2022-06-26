import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15


Window {
    id: window
    width: 1200
    height: 920
    visible: true
    title: qsTr("Rotating Navigation Animation")
    color: "#333"
    property bool showMenu: false

    Column {
        id: listView
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width
        spacing: 40
        bottomPadding: 40
        leftPadding: 40

        Row {
            id: home
            x: -100
            spacing: 10
            Text {
                id: iconHome
                text: "\uE801"
                color: "white"
                font.family: fontLoader.name
                font.pixelSize: 20
            }
            Text {
                anchors.bottom: iconHome.bottom
                text: "Home"
                font.family: "Lato"
                font.capitalization: Font.AllUppercase
                font.pixelSize: 15
                color: "white"
            }

            Behavior on x { PropertyAnimation { duration: 800 } }

            states: [
                State {
                    name: "show"
                    PropertyChanges {
                        target: home
                        x: listView.leftPadding
                    }
                }
            ]
        }

        Row {
            id: about
            x: -120
            spacing: 10
            Text {
                id: iconAbout
                text: "\uE802"
                color: "white"
                font.family: fontLoader.name
                font.pixelSize: 20
            }
            Text {
                anchors.bottom: iconAbout.bottom
                text: "About"
                font.family: "Lato"
                font.capitalization: Font.AllUppercase
                font.pixelSize: 15
                color: "white"
            }

            Behavior on x { PropertyAnimation { duration: 800 } }

            states: [
                State {
                    name: "show"
                    PropertyChanges {
                        target: about
                        x: listView.leftPadding + 20
                    }
                }
            ]
        }

        Row {
            id: contact
            x: -140
            spacing: 10
            Text {
                id: idContact
                text: "\uF0E0"
                color: "white"
                font.family: fontLoader.name
                font.pixelSize: 15
            }
            Text {
                anchors.bottom: idContact.bottom
                text: "Contact"
                font.family: "Lato"
                font.capitalization: Font.AllUppercase
                font.pixelSize: 15
                color: "white"
            }

            Behavior on x { PropertyAnimation { duration: 800 } }

            states: [
                State {
                    name: "show"
                    PropertyChanges {
                        target: contact
                        x: listView.leftPadding + 40
                    }
                }
            ]
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        contentHeight: content.height
        contentWidth: parent.width
        clip: true

        Rectangle {
            id: content
            width: parent.width
            height: column.height
            color: "white"
            property double angle: 0
            antialiasing: true

            Column {
                id: column
                width: parent.width

                Rectangle {
                    width: parent.width
                    height: 100
                    color: "transparent"
                }

                Article {
                    id: article
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 1000
                }

                Rectangle {
                    width: parent.width
                    height: 100
                    color: "transparent"
                }
            }

            transform: Rotation { origin.x: 0; origin.y: 0; angle: content.angle }

            Behavior on angle { PropertyAnimation { duration: 500 } }

            states: [
                State { name: "rotate"; PropertyChanges { target: content; angle: -15 } }
            ]
        }
    }

    FontLoader {
        id: fontLoader
        source: "fonts/fontello.ttf"
    }

    Circle {
        id: circle
        anchors.horizontalCenter: parent.left
        anchors.verticalCenter: parent.top
        r: 100
        color: "#ff7979"
        property double angle: 0   

        ToolButton {
            text: "\uE800"  // Symbol x
            anchors.top: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            font.family: fontLoader.name
            font.pixelSize: 40

            contentItem: Text {
                text: parent.text
                font: parent.font
                color: "white"
                topPadding: 10
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignHCenter
            }

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function() {
                    content.state = "";
                    circle.state = "";
                    home.state = "";
                    about.state = "";
                    contact.state = "";
                }
            }
        }

        ToolButton {
            text: "\uF0C9"  // Symbol =
            anchors.top: parent.verticalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.horizontalCenter
            anchors.right: parent.right
            font.family: fontLoader.name
            font.pixelSize: 35

            contentItem: Text {
                id: textRotate
                text: parent.text
                font: parent.font
                color: "white"
                leftPadding: 10
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: function() {
                    content.state = "rotate";
                    circle.state = "rotate";
                    home.state = "show";
                    about.state = "show";
                    contact.state = "show";
                }
            }
        }

        transform: Rotation { origin.x: circle.r; origin.y: circle.r; angle: circle.angle }

        Behavior on angle { PropertyAnimation { duration: 500 } }

        states: [
            State { name: "rotate"; PropertyChanges { target: circle; angle: -90 } }
        ]
    }
}
