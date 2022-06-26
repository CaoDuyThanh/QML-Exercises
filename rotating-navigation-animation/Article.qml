import QtQuick 2.0


Column {
    width: parent.width
    Text {
        text: "Amazing Article"
        font.pixelSize: 30
        font.family: "Lato"
    }

    Text {
        text: "Florin Pop"
        font.italic: true
        font.pixelSize: 15
        color: "#222"
        font.family: "Lato"
    }

    Text {
        text:" "
    }

    Text {
        width: parent.width
        text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium quia in ratione dolores cupiditate, maxime aliquid impedit dolorem nam dolor omnis atque fuga labore modi veritatis porro laborum minus, illo, maiores recusandae cumque ipsa quos. Tenetur, consequuntur mollitia labore pariatur sunt quia harum aut. Eum maxime dolorem provident natus veritatis molestiae cumque quod voluptates ab non, tempore cupiditate? Voluptatem, molestias culpa. Corrupti, laudantium iure aliquam rerum sint nam quas dolor dignissimos in error placeat quae temporibus minus optio eum soluta cupiditate! Cupiditate saepe voluptates laudantium. Ducimus consequuntur perferendis consequatur nobis exercitationem molestias fugiat commodi omnis. Asperiores quia tenetur nemo ipsa."
        wrapMode: Text.WordWrap
        font.family: "Lato"
        font.pixelSize: 16
    }

    Text {
        text:" "
    }

    Text {
        text: "My Dog"
        font.family: "Lato"
        font.pixelSize: 20
    }

    Text {
        text:" "
    }

    Image {
        source: "./dog.png"
        width: parent.width
        fillMode: Image.PreserveAspectFit
        antialiasing: true
    }

    Text {
        text:" "
    }

    Text {
        width: parent.width
        text: "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit libero deleniti rerum quo, incidunt vel consequatur culpa ullam. Magnam facere earum unde harum. Ea culpa veritatis magnam at aliquid. Perferendis totam placeat molestias illo laudantium? Minus id minima doloribus dolorum fugit deserunt qui vero voluptas, ut quia cum amet temporibus veniam ad ea ab perspiciatis, enim accusamus asperiores explicabo provident. Voluptates sint, neque fuga cum illum, tempore autem maxime similique laborum odio, magnam esse. Aperiam?"
        wrapMode: Text.WordWrap
        font.family: "Lato"
        font.pixelSize: 16
    }
}
