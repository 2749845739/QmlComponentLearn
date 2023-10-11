import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Dialog{

//    property alias order:title_order.text
//    property alias content:serial_number.text

//    anchors.centerIn: parent
    height:250
    width:500

    title: qsTr("Add Quote")
    closePolicy: Popup.NoAutoClose
    standardButtons: Dialog.Ok | Dialog.Cancel


    Column{
//        LabelTextFieldR{
//            id:title_order
//            Layout.fillWidth: true
//            Layout.leftMargin: 10
//            title: qsTr("Order:")
//            titleSize: 16
//            titleWidth: 150
//            titleOpacity: 1
//            titleFieldSize: contentSize
//            textFiledWidth: 180
//            enabled: false

//        }

        Label {
            text: qsTr("title_order")
            color: "black"
            font.pixelSize:16
        }


        Label {
            text: qsTr("Content")
             color: "black"
            font.pixelSize:16
        }


        TextArea {
            font.pixelSize:16
            text: "gtrhtyjhty"
        }

    }


//    onOpened: {
//        initConfig()
//    }


//    function initConfig(){
//        fileConfig = qmlVarHolder.readJsonFile("config/exthw.json")
//        var rate = fileConfig.phys.serial.baudRate === undefined
//                ? 0:fileConfig.phys.serial.baudRate
//        //it will set index = -1 when value is error
//        serial_combo.combo.currentIndex = serial_combo.indexOfValue(rate)
//        serial_number.text = fileConfig.phys.serial.serialNumber === undefined
//                ? 0:fileConfig.phys.serial.serialNumber
//     }


}
