import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Live User Filter")
    color: "#f8f9fd"
    property variant allUsers: []
    property variant filterUsers: []

    DropShadow {
        anchors.fill: rect1
        source: rect1
        color: "gray"
        radius: 10
        samples: 17
    }

    Rectangle {
        id: rect1
        anchors.fill: rect
        color: "white"
        radius: 10
    }

    Rectangle {
        id: rect
        anchors.centerIn: parent
        width: 300
        height: Math.min(558, 158 + window.filterUsers.length * 100)
        color: "lightgray"

        function loadUsers() {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( "GET", "https://randomuser.me/api?results=50", true );
            xmlHttp.onload = (e) => {
                var result = JSON.parse(xmlHttp.responseText);
                window.allUsers = result.results;
                window.filterUsers = window.allUsers;
            };
            xmlHttp.send( null );
        }

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: rect.width
                height: rect.height
                Rectangle {
                    anchors.centerIn: parent
                    width: rect.width
                    height: rect.height
                    radius: 10
                }
            }
        }

        Component.onCompleted: {
            loadUsers();
        }

        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: 158
            color: "#3e57db"

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 30
                anchors.bottomMargin: 30
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                Text {
                    text: "Live User Filter"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 16
                }

                Text {
                    text: "Search by name and/or location"
                    font.pixelSize: 13
                    color: "#E0E0E0"
                }

                Item {
                    Layout.fillHeight: true
                }

                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40

                    Rectangle {
                        anchors.fill: parent
                        radius: 20
                        color: "black"
                        opacity: 0.3
                    }

                    Text {
                        anchors.fill: parent
                        leftPadding: 20
                        color: "gray"
                        text: "Search"
                        verticalAlignment: Text.AlignVCenter
                        visible: textSearch.text.length === 0
                    }

                    TextInput {
                        id: textSearch
                        anchors.fill: parent
                        leftPadding: 20
                        color: "white"
                        verticalAlignment: TextInput.AlignVCenter

                        Keys.onReleased: {
                            window.filterUsers = window.allUsers.filter(user => {
                                                                           let allWords = (user.name.first + " " + user.name.last + " " + user.location.city + " " + user.location.country).split(' ');
                                                                           const filteredArray = allWords.filter(word => word.toUpperCase().includes(textSearch.text.toUpperCase()));
                                                                           return filteredArray.length > 0;
                                                                       });
                        }
                    }
                }
            }
        }

        ScrollView {
            id: scrollView
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height - 158
            clip: true

            Column {
                spacing: 1

                Repeater {
                    model: window.filterUsers.length

                    delegate: Rectangle {
                        width: scrollView.width
                        height: 99

                        RowLayout {
                            anchors.fill: parent
                            anchors.topMargin: 20
                            anchors.bottomMargin: 20
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20

                            Image {
                                id: img
                                Layout.preferredWidth: 50
                                Layout.preferredHeight: 50
                                source: window.filterUsers[index].picture.large
                                fillMode: Image.PreserveAspectFit

                                layer.enabled: true
                                layer.effect: OpacityMask {
                                    maskSource: Item {
                                        width: img.width
                                        height: img.height
                                        Rectangle {
                                            anchors.centerIn: parent
                                            width: img.width
                                            height: img.height
                                            radius: img.width / 2
                                        }
                                    }
                                }
                            }

                            ColumnLayout {
                                Layout.alignment: Qt.AlignLeft
                                Layout.preferredWidth: 160
                                Layout.fillWidth: true
                                Layout.fillHeight: true

                                Text {
                                    Layout.alignment: Qt.AlignTop
                                    Layout.fillHeight: true
                                    text: window.filterUsers[index].name.first + " " + window.filterUsers[index].name.last
                                    font.bold: true
                                    font.pixelSize: 17
                                }

                                Text {
                                    Layout.fillHeight: true
                                    text: window.filterUsers[index].location.city + ", " +  window.filterUsers[index].location.country
                                    font.pixelSize: 12
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
