import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Toast Notification")
    color: "#663399"

    Rectangle {
        id: notiButton
        anchors.centerIn: parent
        width: isUp ? 145 : 150
        height: isUp ? 45 : 50
        radius: 5

        property bool isUp: true

        Text {
            anchors.centerIn: parent
            text: "Show Notification"
            color: "#663399"
            font.pixelSize: notiButton.isUp ? 15 : 14
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onPressed: {
                notiButton.isUp = false;
            }

            onReleased: {
                notiButton.isUp = true;
            }

            onClicked: {
                var component;
                var message;
                const MESSAGES = ["Message One", "Message Two", "Message Three", "Message Four"]
                const COLORS = ["red", "green", "#663399"]
                component = Qt.createComponent("MessageBox.qml");
                if (component.status === Component.Ready){
                    message = component.createObject(messageNoti);
                    message.text = MESSAGES[Math.floor(Math.random() * 4)];
                    message.textColor = COLORS[Math.floor(Math.random() * 3)];
                    message.Layout.alignment = Qt.AlignRight;
                } else {
                    console.log("Error creating new component", component.errorString());
                }
            }
        }
    }

    ColumnLayout {
        id: messageNoti
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        spacing: 10
    }
}
