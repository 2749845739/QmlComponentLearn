import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {

    width: 400
    height: 300
    //    Label {
    //        text: "PD-weighted imaging is used to differentiate anatomical structures based on their proton density; the scanning parameters are set (long TR/short TE) to minimize T1 and T2 relaxation effects"
    //        font.pixelSize: 16
    //        width:100
    //        font.italic: true
    //        elide: Text.ElideRight
    //    }
    Column{

        spacing:30

        TextField {
            text:"1111111"
            enabled: false
        }


        TextField {
            text:"22222"
            //            textEdited: false
            background: Rectangle {
                border.width: 0
//                border.color: "red"
//                radius: 4; color: "#FFFFFF"
//                opacity: 0.05
//                implicitHeight: 40
//                implicitWidth: 280
            }

        }


    Label {
        text:"333333"

    }


    Label {
        text:"4444"

    }



}

}
