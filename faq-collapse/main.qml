import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: window
    width: 800
    height: 480
    visible: true
    color: "#f0f0f0"
    title: qsTr("FAQ Collapse")

    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height
        contentWidth: parent.width
        contentHeight: column.height

        Column {
            id: column
            x: (parent.width - width) / 2
            topPadding: 40
            width: 600
            spacing: 20

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Frequently Asked Questions"
                font.pixelSize: 30
            }

            FAQ {
                anchors.horizontalCenter: parent.horizontalCenter
                question: "Why should't we trust atoms?"
                answer: "They make up everything."
            }

            FAQ {
                anchors.horizontalCenter: parent.horizontalCenter
                question: "What do you call someone with no body and no nose?"
                answer: "Nobody knows."
            }

            FAQ {
                anchors.horizontalCenter: parent.horizontalCenter
                question: "What's the object-oriented way to become wealthy"
                answer: "Inheritance."
            }

            FAQ {
                anchors.horizontalCenter: parent.horizontalCenter
                question: "How many tickles does it take to tickle an octopus"
                answer: "Ten-tickles."
            }

            FAQ {
                anchors.horizontalCenter: parent.horizontalCenter
                question: "What is: 1 + 1?"
                answer: "Depends on who are you asking."
            }
        }
    }
}
