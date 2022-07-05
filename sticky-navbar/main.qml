import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 1920
    height: 960
    visible: true
    title: qsTr("Sticky Navbar")

    property bool isTop: scrollView.ScrollBar.vertical.position === 0

    DropShadow {
        anchors.fill: topBar
        verticalOffset: 5
        radius : 10
        samples: window.isTop ? 0 : 17
        source : topBar
        color: "gray"

        Behavior on samples { PropertyAnimation { duration: 200 } }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: column.height

        Column {
            id: column
            topPadding: navBar.height
            width: parent.width
            height: background.height + content.height

            Image {
                id: background
                width: window.width
                height: window.height
                source: "photo.webp"
                fillMode: Image.PreserveAspectCrop

                Rectangle {
                    anchors.fill: parent
                    color: "black"
                    opacity: 0.5
                }
            }

            Text {
                id: welcomeText
                anchors.centerIn: background
                text: "Welcome To My Website"
                color: "white"
                font.pixelSize: 40
                font.family: "Open Sans"
            }

            Text {
                anchors.top: welcomeText.bottom
                anchors.horizontalCenter: welcomeText.horizontalCenter
                topPadding: 20
                text: "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Maiores, consequuntur?"
                color: "white"
                font.pixelSize: 16
                font.family: "Open Sans"
            }

            Column {
                id: content
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: background.bottom
                bottomPadding: 40
                width: Math.min(parent.width, 1200)

                Text {
                    id: text1
                    anchors.left: parent.left
                    anchors.right: parent.right
                    topPadding: 20
                    bottomPadding: 20
                    text: "Content One"
                    color: "#222"
                    font.family: "Open Sans"
                    font.pixelSize: 24
                }

                Text {
                    width: navBar.width
                    text: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ratione dolorem voluptates eveniet tempora ut cupiditate magnam, sapiente, hic quo in ipsum iste soluta eaque perferendis nihil recusandae dolore officia aperiam corporis similique. Facilis quos tempore labore totam! Consectetur molestiae iusto ducimus error reiciendis aspernatur dolor, modi dolorem sit architecto, voluptate magni sunt unde est quas? Voluptates a dolorum voluptatum quo perferendis aut sit. Aspernatur libero laboriosam ab eligendi omnis delectus earum labore, placeat officiis sint illum rem voluptas ipsum repellendus iste eius recusandae quae excepturi facere, iure rerum sequi? Illum velit delectus dicta et iste dolorum obcaecati minus odio eligendi!"
                    wrapMode: Text.WordWrap
                    color: "#555"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    lineHeight: 1.5
                }

                Text {
                    width: navBar.width
                    topPadding: 20
                    bottomPadding: 20
                    text: "Content Two"
                    color: "#222"
                    font.family: "Open Sans"
                    font.pixelSize: 24
                }

                Text {
                    width: navBar.width
                    text: "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Pariatur provident nostrum possimus inventore nisi laboriosam consequatur modi nulla eos, commodi, omnis distinctio! Maxime distinctio impedit provident, voluptates illo odio nostrum minima beatae similique a sint sapiente voluptatum atque optio illum est! Tenetur tempora doloremque quae iste aperiam hic cumque repellat?"
                    wrapMode: Text.WordWrap
                    color: "#555"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    lineHeight: 1.5
                }
            }
        }
    }

    Rectangle {
        id: topBar
        anchors.top: parent.top
        color: window.isTop ? "#222" : "white"
        width: parent.width
        height: window.isTop ? 73 : 60

        Item {
            id: navBar
            anchors.centerIn: parent
            width: Math.min(parent.width, 1200)
            height: parent.height

            Text {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                text: "My Website"
                color: window.isTop ? "white" : "black"
                antialiasing: true
                font.pixelSize: 25
                font.family: "Open Sans"
                leftPadding: 15
                rightPadding: 15

                Behavior on color { PropertyAnimation { duration: 200 } }
            }

            Row {
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft

                Text {
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: "Contact"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    leftPadding: 15
                    rightPadding: 15
                    topPadding: 7
                    bottomPadding: 7
                    color: isHover ? "#c0392b" : (window.isTop ? "white" : "black")

                    property bool isHover: false;

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onEntered: function() {
                            parent.isHover = true;
                        }
                        onExited: function() {
                            parent.isHover = false;
                        }
                    }

                    Behavior on color { PropertyAnimation { duration: 200 } }
                }

                Text {
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: "Services"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    leftPadding: 15
                    rightPadding: 15
                    topPadding: 7
                    bottomPadding: 7
                    color: isHover ? "#c0392b" : (window.isTop ? "white" : "black")

                    property bool isHover: false;

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onEntered: function() {
                            parent.isHover = true;
                        }
                        onExited: function() {
                            parent.isHover = false;
                        }
                    }

                    Behavior on color { PropertyAnimation { duration: 200 } }
                }

                Text {
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: "About"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    leftPadding: 15
                    rightPadding: 15
                    topPadding: 7
                    bottomPadding: 7
                    color: isHover ? "#c0392b" : (window.isTop ? "white" : "black")

                    property bool isHover: false;

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                        onEntered: function() {
                            parent.isHover = true;
                        }
                        onExited: function() {
                            parent.isHover = false;
                        }
                    }

                    Behavior on color { PropertyAnimation { duration: 200 } }
                }

                Text {
                    height: parent.height
                    verticalAlignment: Text.AlignVCenter
                    text: "Home"
                    font.family: "Open Sans"
                    font.pixelSize: 16
                    leftPadding: 15
                    rightPadding: 15
                    topPadding: 7
                    bottomPadding: 7
                    color: "#c0392b"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }

                    Behavior on color { PropertyAnimation { duration: 200 } }
                }
            }
        }

        Behavior on color { PropertyAnimation { duration: 200 } }
        Behavior on height { PropertyAnimation { duration: 200 } }
    }
}
