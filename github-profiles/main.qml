import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    width: 1080
    height: 920
    visible: true
    title: qsTr("Github Profiles")
    color: "#2a2a72"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            width: 700
            height: 56
            color: "#4c2885"
            radius: 10

            TextInput {
                id: textInput
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                leftPadding: 20
                color: "white"
                font.pixelSize: 16

                Keys.onReturnPressed: {
                    var xmlHttp = new XMLHttpRequest();
                    xmlHttp.open( "GET", "https://api.github.com/users/" + text, false ); // false for synchronous request
                    xmlHttp.send( null );
                    var data = JSON.parse(xmlHttp.responseText);
                    profile.visible = true;
                    profile.name = String(data["name"]);
                    profile.twitter = String(data["twitter_username"]);
                    profile.numFollower = data["followers"];
                    profile.numFollowing = data["following"];
                    profile.numRepos = data["public_repos"];
                    profile.profileUrl = data["avatar_url"];

                    xmlHttp.open( "GET", "https://api.github.com/users/" + text + "/repos?sort=created", false ); // false for synchronous request
                    xmlHttp.send( null );
                    data = JSON.parse(xmlHttp.responseText);
                    profile.tags = data.slice(0, 5).map(d => d["name"]);
                }
            }

            Text {
                anchors.fill: textInput
                verticalAlignment: Text.AlignVCenter
                color: "gray"
                text: "Search a Github User"
                leftPadding: 20
                font.pixelSize: 16
                visible: textInput.text.length == 0
            }
        }

        Rectangle {
            id: profile
            Layout.alignment: Qt.AlignHCenter
            height: row.height + 48 * 2
            width: row.width + 28 * 2
            color: "#4c2885"
            radius: 20
            visible: false

            property string name: ""
            property string profileUrl: ""
            property string twitter: ""
            property int numFollower: 0
            property int numFollowing: 0
            property int numRepos: 0
            property variant tags: []

            RowLayout {
                id: row
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20

                Image {
                    id: avatar
                    Layout.alignment: Qt.AlignTop
                    Layout.preferredHeight: 150
                    Layout.preferredWidth: 150
                    source: profile.profileUrl

                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: avatar.width
                            height: avatar.height

                            Rectangle {
                                width: parent.width
                                height: parent.height
                                radius: parent.width / 2
                            }
                        }
                    }

                    Rectangle {
                        anchors.fill: parent
                        radius: 85
                        border.color: "#2a2a72"
                        border.width: 10
                        color: "transparent"
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignTop
                    spacing: 20

                    Text {
                        text: profile.name
                        color: "white"
                        font.pixelSize: 30
                    }

                    Text {
                        text: profile.twitter
                        color: "white"
                        font.pixelSize: 20
                    }

                    Row {
                        id: followInfo
                        spacing: 70

                        Text {
                            text: profile.numFollower + "  Followers"
                            color: "white"
                            font.pixelSize: 16
                        }

                        Text {
                            text: profile.numFollowing + "  Following"
                            color: "white"
                            font.pixelSize: 16
                        }

                        Text {
                            text: profile.numRepos + "  Repos"
                            color: "white"
                            font.pixelSize: 16
                        }
                    }

                    Flow {
                        Layout.preferredWidth: followInfo.width
                        Layout.minimumHeight: 30
                        spacing: 10

                        Repeater {
                            model: profile.tags.length
                            delegate: Tag {
                                color: "#212a72"
                                text: profile.tags[index]
                            }
                        }
                    }
                }
            }
        }
    }
}
