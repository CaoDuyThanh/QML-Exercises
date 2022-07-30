import QtQuick 2.0

TextInput {
    id: textInput
    property string placeHolder: ""

    Row {
        Repeater {
            model: textInput.placeHolder.length
            Text {
                text: textInput.placeHolder[index]
                y: textInput.focus || textInput.text.length > 0 ? - height - 5: 0
                color: textInput.focus || textInput.text.length > 0 ? "lightblue" : textInput.color
                font.pixelSize: textInput.font.pixelSize
                font.family: textInput.font.pixelSize
                Behavior on y {
                    SequentialAnimation {
                        PauseAnimation { duration: 50 * index }
                        PropertyAnimation { duration: 200; easing.type: Easing.InOutBack }
                    }
                }
            }
        }
    }

    Rectangle {
        width: parent.width
        height: 2
        y: parent.height + 10
    }
}
