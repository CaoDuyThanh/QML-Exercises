import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

RowLayout {
    id: landingPage
    anchors.fill: parent
    spacing: 0

    function calculateWidth(firstItem) {
        if (firstItem === true) {
            if (leftItem.isHover) {
                return landingPage.width / 4.0 * 3.0;
            }
            if (rightItem.isHover) {
                return landingPage.width / 4.0;
            }
            return landingPage.width / 2.0;
        }

        if (leftItem.isHover) {
            return landingPage.width / 4.0;
        }
        if (rightItem.isHover) {
            return landingPage.width / 4.0 * 3.0;
        }
        return landingPage.width / 2.0;
    }

    OneSide {
        id: leftItem
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: calculateWidth(true)
        imageSource: "ps.jpg"
        backgroundColor: "#5754ec"
        backgroundOpacity: 0.7
        buttonHoverColor: "#5754ec"
        text: "Playstation 5"
        Behavior on Layout.preferredWidth { PropertyAnimation { duration: 1000; easing: Easing.InOutCubic } }

    }

    OneSide {
        id: rightItem
        Layout.preferredHeight: parent.height
        Layout.preferredWidth: calculateWidth(false)
        imageSource: "xbox.jpg"
        backgroundColor: "#2b2b2b"
        backgroundOpacity: 0.8
        buttonHoverColor: "#1c7a1c"
        text: "XBox Series X"
        Behavior on Layout.preferredWidth { PropertyAnimation { duration: 1000; easing: Easing.InOutCubic } }

    }
}
