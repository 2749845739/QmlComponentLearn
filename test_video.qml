import QtQuick 2.0
import QtQuick.Controls 2.2
import QtMultimedia 5.15

Rectangle {

    id: root
    implicitWidth: 1260
    implicitHeight: 692
    color: "transparent"
    border.color: "black"
    property int img_size: 20
    property int volume_width:5
    property bool isFull:false

    Video {
        id: video
        anchors.horizontalCenter: parent.horizontalCenter
        width : parent.width
        height : 605
        fillMode: VideoOutput.Stretch
        // must be file,not need qrc://
        source: "file:///home/gr/Documents/Repo/my_repo/my_qml_test/resource/test.avi"
        autoPlay: true
        MouseArea{
            anchors.fill:parent
            onClicked:  video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        }
        volume: 0.5
        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
    }

    Image {
        id: img_play
        anchors.centerIn: video
        width: 100
        height: 100
        source: "qrc:/resource/play_black.png"
        visible: video.playbackState == MediaPlayer.PlayingState ? false:true
        MouseArea{
            anchors.fill:parent
            onClicked:  video.play()
        }
    }

    Rectangle {
        id: progressBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: video.bottom
        anchors.margins: 0
        height: 10
        color: "#F4F7F6"
        opacity: 0.4


        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: video.duration>0?parent.width*video.position/video.duration:0
            color: "#0962EA"
        }

        MouseArea {
            property int pos
            anchors.fill: parent

            onClicked: {
                if (video.seekable) {
                    pos = video.duration * mouse.x/width
                    video.seek(pos)
                }
            }
        }
    }

    Rectangle {
        id:control_area
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 0
        height: 87
        color: "#08183C"

        Image {
            id: img_pause_white
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 40
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/pause_white.png"
            visible: video.playbackState == MediaPlayer.PausedState ? false:true
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if(video.playbackState == MediaPlayer.PlayingState)
                        video.pause()
                   }
            }
        }


        Image {
            id: img_pause_blue
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 40
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/pause_blue.png"
            visible:  video.playbackState == MediaPlayer.PausedState ? true:false
        }

        Image {
            id: img_stop
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 80
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/stop_01.png"
            MouseArea{
                anchors.fill:parent
                onClicked: video.stop()
            }
        }

        Text{
            id:play_time
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 131
            }
            font.pixelSize: 14
            color: "white"
            text: new Date(video.position).toLocaleString(Qt.locale(),"mm:ss")

        }


        Text{
            id:total_time
            anchors {
                verticalCenter: parent.verticalCenter
                left: play_time.right
                leftMargin: 0
            }
            font.pixelSize: 14
            color: "white"
            text: " / "+new Date(video.duration).toLocaleString(Qt.locale(),"mm:ss")
        }



        Image {
            id: img_vol
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 1058
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/volume.png"
            visible: video.volume == 0 ? false:true
            MouseArea {
                anchors.fill: parent
                onClicked: control_vol.visible = !control_vol.visible
                onDoubleClicked: video.volume = 0
            }
        }

        Image {
            id: img_mute
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 1058
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/mute.png"
             visible: video.volume == 0 ? true:false
            MouseArea {
                anchors.fill: parent
                onClicked: control_vol.visible = !control_vol.visible
            }
        }



        Rectangle {
            id:control_vol
            anchors {
                horizontalCenter:img_vol.horizontalCenter
                bottom: img_vol.top
                bottomMargin: 10
            }
            width:26
            height: 103
            visible: false
            color: "#1A1F31"

            Text {
                anchors {
                    horizontalCenter:parent.horizontalCenter
                    top: parent.top
                    topMargin: 5
                }
                text: video.volume*100
                color: "white"
                font.pixelSize: 14
            }


            Rectangle {
                anchors {
                    horizontalCenter:parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 5
                }
                width:volume_width
                height: 70
                color: "gray"


                Rectangle {
                    id:volume_real
                    anchors {
                        // if use this way, can't show ?
//                        horizontalCenter:parent.horizontalCenter
//                        bottom: parent.bottom
//                        bottomMargin: 0
                         left: parent.left
                         bottom: parent.bottom
                         right: parent.right
                    }
                    height: video.volume*parent.height
                    color: "#0962EA"

                }

                Rectangle {
                    id: volume_circle
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: volume_real.top
                    width: volume_width*2
                    height: volume_width*2
                    color: "#0962EA"
                    radius: width / 2
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked:  video.volume = (height-mouse.y)/height
                }
            }

//            MouseArea{
//                anchors.fill: parent
//               // hoverEnabled: true
//                onExited: {
//                    console.log("onExited")
//                    control_vol.visible = false
//                }
//            }

        } // control_vol



        Image {
            id: img_small
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 1135
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/shrink.png"
            MouseArea{
                anchors.fill:parent
                onClicked: {

                }
            }
        }


        Image {
            id: img_big
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 1210
            }
            width: img_size
            height: img_size
            source: "qrc:/resource/full_screen.png"
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    console.log("click full_screen")
                    width = 1920
                    height = 1080
                    isFull = true
                }
            }
        }

    }

    Component.onCompleted: video.stop()

    Keys.onEscapePressed: {
        console.log("enter esc")
        width = 1260
        height = 605
    }

    Keys.onSpacePressed: {
        console.log("enter space")
        if(video.playbackState == MediaPlayer.PausedState) { video.play() }
        if(video.playbackState == MediaPlayer.PlayingState) { video.pause()}

    }




}
