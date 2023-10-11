/** Copyright (C) Fuqing Medical and USTC BMEC RFLab - All Rights Reserved.
 ** Unauthorized copying of this file, via any medium is strictly prohibited.
 ** Proprietary and confidential.
 ** Created on \date 20230706, by \author yue.wang.
 **/
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Dialog{
    id: setDlg
    title: qsTr("Request Action")
    standardButtons: Dialog.Ok | Dialog.Cancel

    width:500
    height: 500
    property real labelWidth: 200
    property real fieldWidth: 300
    property real labelSize: 14
    property real titleFieldSize: 14
    property real titleOpacity: 0.8

    property var label: qsTr("Label")
    property var unit: qsTr("day")
    property string content: "14"
    property alias validator: textFieldT.validator
//    property alias enabled: textFieldT.enabled
//    closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnEscape

    RowLayout{
        anchors.fill: parent
        spacing: 30
        Label{
            id:labelText
            text: label
            font.bold: true
//            opacity: titleOpacity
            font.pixelSize: setDlg.labelSize
            Layout.minimumWidth: labelWidth
            Layout.maximumWidth: labelWidth
        }
        TextField{
            id : textFieldT
            text: content
            Layout.fillWidth: true
            selectByMouse: true
            horizontalAlignment: TextInput.AlignHCenter
            font.pixelSize: titleFieldSize
            Layout.minimumWidth: fieldWidth
            Layout.maximumWidth: fieldWidth
        }
        Label{
            id:unitText
            text: unit
            font.bold: true
//            opacity: titleOpacity
            font.pixelSize: setDlg.labelSize
        }
    }

    onOpened: {

    }
    onAccepted: {

    }
    onRejected: {

    }
}
