import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 800
    height: 800
    visible: true
    title: qsTr("Movie App")
    color: "#22254b"

    property variant movies: []

    function getMovies(searchText) {
        var xmlHttp = new XMLHttpRequest();
        if (searchText === "") {
            xmlHttp.open( "GET", "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=3fd2be6f0c70a2a598f084ddfb75487c&page=1", false );
        }
        else {
            xmlHttp.open( "GET", "https://api.themoviedb.org/3/search/movie?sort_by=popularity.desc&api_key=3fd2be6f0c70a2a598f084ddfb75487c&page=1&query=" + searchText, false );
        }
        xmlHttp.send( null );
        var results = JSON.parse(xmlHttp.responseText).results;
        window.movies = results.map(e => { return {
                            "background": "https://image.tmdb.org/t/p/w1280/" + e.backdrop_path,
                            "title": e.title,
                            "vote_average": e.vote_average,
                            "overview": e.overview
                        }; });
    }

    Component.onCompleted: {
        window.getMovies("");
    }

    ScrollView {
        anchors.fill: parent
        contentHeight: search.height + moviesArea.height + 32
        contentWidth: Math.max(parent.width, moviesArea.width)

        Rectangle {
            id: search
            width: window.width
            height: 80
            color: "#373b69"

            Rectangle {
                id: rectInput
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 16
                width: 354
                height: 44
                radius: 22
                color: searchInput.focus ? "#22254b" : "transparent"
                border.color: "#22254b"
                border.width: 2
            }

            TextInput {
                id: searchInput
                anchors.fill: rectInput
                verticalAlignment: Text.AlignVCenter
                leftPadding: 20
                color: "white"
                Keys.onReturnPressed: {
                    window.getMovies(text);
                }
            }

            Text {
                id: placeholder
                anchors.fill: rectInput
                verticalAlignment: Text.AlignVCenter
                leftPadding: 20
                text: "Search"
                color: "gray"
                visible: searchInput.text.length === 0
            }
        }

        Grid {
            id: moviesArea
            anchors.top: search.bottom
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            anchors.topMargin: 16
            anchors.bottomMargin: 16
            columns: 5
            rows: 4

            columnSpacing: 16
            rowSpacing: 16

            Repeater {
                model: window.movies.length

                delegate: Banner {
                    width: 300
                    height: 555

                    title: window.movies[index].title
                    background: window.movies[index].background
                    score: window.movies[index].vote_average
                    overview: window.movies[index].overview
                }
            }


        }
    }
}
