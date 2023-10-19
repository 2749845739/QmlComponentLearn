import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Styles 1.4


Calendar {
    id:calendar
    implicitWidth: 300
    implicitHeight: 300
    // eliminate white edges around
    frameVisible:false
    property color back_color:"#253252"
    property color border_color:"black"
    property color text_color:"white"
    property color sele_color:"#2A4175"
    property color invalid_color:"#687087"
//    property alias elimi_right_line:right_line.visible


    style: CalendarStyle {
        gridVisible: false
        // cann't set width and height in background
        // only manage part area
        background:Rectangle{
            anchors.fill: parent
            color:back_color
            border.color: border_color
        }
        //if overridden,all attributes will disappear and
        //must completedly defined by yourself
        navigationBar: Rectangle{
            height:90
            color:back_color
//            border.color: border_color
            Image{
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                width: sourceSize.width
                height: sourceSize.height
                source: "qrc:/resource/calendarnext.png"
                rotation: 180
                MouseArea{
                    anchors.fill: parent
                    onClicked: calendar.showPreviousMonth()
                }
            }
            Label {
                //text: styleData.title.split(" ")[1]+"年"+monthConvert( styleData.title.split(" ")[0])
                text:{
                    var str=control.visibleYear+"年"+fillZero(control.visibleMonth+1)+"月";
                    return str;
                }
                anchors.centerIn: parent
                color: text_color
                font.pixelSize: 22
                font.family: "微软雅黑"
                font.bold: false
            }
            Image{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                width: sourceSize.width
                height: sourceSize.height
                source: "qrc:/resource/calendarnext.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: calendar.showNextMonth()
                }
            }
        }// navigationBar


        dayOfWeekDelegate:Rectangle{
            color: back_color
            height:35
            //            border.width: 0
            Label {
                anchors.centerIn: parent
                text: Qt.locale().dayName(styleData.dayOfWeek)
                color:text_color
                font.pixelSize: 14
            }
        }


        dayDelegate: Rectangle {
            color: back_color
            height:20
            // select  circle
            Canvas{
                anchors.fill:parent;
                visible: styleData.selected;
                onPaint: {
                    var ctx=getContext("2d");
                    ctx.strokeStyle=sele_color;
                    ctx.fillStyle=sele_color;
                    ctx.beginPath();
                    var diameter=30;
                    ctx.ellipse(parent.width/2-diameter/2,parent.height/2-diameter/2,diameter,diameter);
                    ctx.closePath();
                    ctx.fill();
                    ctx.stroke();
                }
            }

            Label {
                text: styleData.date.getDate()
                anchors.centerIn: parent
                color: styleData.visibleMonth && styleData.valid ? text_color:"#9EABBE"
                font.pixelSize: 14
            }

        }
    }// style


//    //Eliminate overlapping line right
//    Rectangle {
//        id:right_line
//        visible: false
//        width:1
//        height:parent.height
//        anchors.right: parent.right
//        color: "#1A243D"

//    }


    function monthConvert(v){
        switch(v){
        case "一月" : return "1月";
        case "二月" : return "2月";
        case "三月" : return "3月";
        case "四月" : return "4月";
        case "五月" : return "5月";
        case "六月" : return "6月";
        case "七月" : return "7月";
        case "八月" : return "8月";
        case "九月" : return "9月";
        case "十月" : return "10月";
        case "十一月" : return "11月";
        case "十二月" : return "12月";
        default: break;
        }
    }


    //长度不足2 补零
    function fillZero(value) {
        return value.toString().length < 2 ? ('0' + value) : value
    }

} // calendar


