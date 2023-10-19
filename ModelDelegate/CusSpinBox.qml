/** Copyright (C) Fuqing Medical and USTC BMEC RFLab - All Rights Reserved.
 ** Unauthorized copying of this file, via any medium is strictly prohibited.
 ** Proprietary and confidential.
 ** Created on 20230925, by yue.wang.
 **/
import QtQuick 2.12
import QtQuick.Controls 2.12

SpinBox {
    id: control
    property int boxWidth: 100
    property int boxHeight: 30
    property color indicatorColor: "#cdcdcd"
    property color selectedColor: "#7f7f7f"
    value: 50
    editable: true

    background: Rectangle {
        implicitWidth: boxWidth
        implicitHeight: boxHeight
        border.color: indicatorColor
    }

    contentItem: TextInput {
        z: 2
        text: control.textFromValue(control.value, control.locale)
        font: control.font
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 0 : parent.width - width
        height: parent.height
        implicitWidth: boxHeight
        implicitHeight: boxHeight
        color: control.up.pressed ? selectedColor : indicatorColor
        border.color: indicatorColor

        Text {
            text: "+"
            font.pixelSize: control.font.pixelSize * 2
            color: "black"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width : 0
        height: parent.height
        implicitWidth: boxHeight
        implicitHeight: boxHeight
        color: control.down.pressed ? selectedColor : indicatorColor
        border.color: indicatorColor

        Text {
            text: "-"
            font.pixelSize: control.font.pixelSize * 2
            color: "black"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }


}
