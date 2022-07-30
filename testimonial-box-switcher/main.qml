import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "testimonials.js" as Tes

Window {
    id: window
    width: 800
    height: 600
    visible: true
    title: qsTr("Testimonial Box Switcher")
    color: "#f4f4f4"
    property int currentIndex: 0
    property int resetTime: 8000

    TestimonialBox {
        id: testimonialBox
        resetTime: window.resetTime
        anchors.centerIn: parent
        desc: Tes.testimonials[window.currentIndex]["text"]
        photo: Tes.testimonials[window.currentIndex]["photo"]
        name: Tes.testimonials[window.currentIndex]["name"]
        position: Tes.testimonials[window.currentIndex]["position"]

        Component.onCompleted: {
            testimonialBox.reset();
        }

        Timer {
            interval: window.resetTime
            running: true
            repeat: true
            onTriggered: {
                window.currentIndex = (window.currentIndex + 1) % Tes.testimonials.length;
                testimonialBox.reset();
            }
        }
    }


}
