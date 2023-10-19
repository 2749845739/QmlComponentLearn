/** Copyright (C) Fuqing Medical and USTC BMEC RFLab - All Rights Reserved.
 ** Unauthorized copying of this file, via any medium is strictly prohibited.
 ** Proprietary and confidential.
 ** Created on 20230920, by yue.wang.
 **/

import QtQuick 2.4
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2

TextField {
    id: control
    property int editWidth: 200
    property int editHeigth: 30
    property string placeText: qsTr("Enter description")
    placeholderText: placeText
    font.pixelSize: 18

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: control.enabled ? "transparent" : "#353637"
        border.color: control.enabled ? "#666666" : "transparent"
        radius: 5
    }
}
