import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    width: 800
    height: 600
    visible: true
    title: qsTr("Incrementing Counter")
    color: "#8e44ad"

    RowLayout {
        anchors.centerIn: parent
        spacing: 100

        CounterContainer {
            id: twitter
            icon: "\uf099"
            numFollower: 0
            textContainer: "Twitter Followers"
        }

        CounterContainer {
            id: youtube
            icon: "\uf167"
            numFollower: 0
            textContainer: "YouTube Subscribers"
        }

        CounterContainer {
            id: facebook
            icon: "\uf09a"
            numFollower: 0
            textContainer: "Facebook Fans"
        }

        Component.onCompleted: {
            twitter.numFollower = 12000;
            youtube.numFollower = 5000;
            facebook.numFollower = 7500
        }
    }
}
