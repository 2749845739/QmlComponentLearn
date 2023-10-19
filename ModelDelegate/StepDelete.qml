/** Copyright (C) Fuqing Medical and USTC BMEC RFLab - All Rights Reserved.
 ** Unauthorized copying of this file, via any medium is strictly prohibited.
 ** Proprietary and confidential.
 ** Created on 20230921, by yue.wang.
 **/

import QtQuick 2.15
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15


Rectangle {
    id: delegate
    property bool selected: ListView.isCurrentItem
    property int itemWidth: 430
    property int orderWidth: 35
    property int titleSize: 15
    property int iconSize: 20
    property int leftBorderMargin: 5
    property real iconOpacity: 0.6
    width: itemWidth
    height: 200
    color: selected ? "white" : "#E6E6E6"

    ColumnLayout {
        id: columnRoot
        anchors.fill: parent

        // order line
        RowLayout {
            // 没有指定Layout的宽度，会按照实际spacing来排列
            // 若指定宽度， spacing只是最小值
            Layout.topMargin: 10
            spacing: 10
            Rectangle {
                id: orderButton
                height: orderWidth
                width: orderWidth
                //                color: "#E7A632"
                color: "#3F51B5"
                radius: orderButton.width * 0.5

                Text {
                    anchors.centerIn: parent
                    text: index + 1
                    color: "white"
                    font.pixelSize: 20
                }
            }
            CusTextField {
                placeText: qsTr("Name this Step")
            }

            Item{
                width: 50
            }

            RoundButton {
                id: copyIcon
                flat: true
                icon.width: iconSize
                icon.source: "qrc:/res/ic_content_copy_black_48dp.png"
                opacity: iconOpacity
            }

            RoundButton {
                id: deleteIcon
                Layout.leftMargin: -10
                flat: true
                icon.width: iconSize
                icon.source: "qrc:/res/ic_close_black_48dp.png"
                opacity: iconOpacity
            }
        }

        // duration line
        RowLayout {
            Layout.leftMargin: leftBorderMargin
            spacing: 5
            Text {
                text: qsTr("Total time")
                font.pixelSize: 16
            }
            CusSpinBox {
                from: 50
            }
        }

        RowLayout {
            Layout.leftMargin: leftBorderMargin
            spacing: 5
            Text {
                text: qsTr("Ramp up")
                font.pixelSize: 16
            }
            CusSpinBox {
                Layout.leftMargin: 24
                from: 3
            }
            Text {
                Layout.leftMargin: 15
                text: qsTr("Ramp down")
                font.pixelSize: 16
            }
            CusSpinBox {
                from: 3
            }
        }

        // sham line
        RowLayout {
            Layout.leftMargin: leftBorderMargin
            Layout.topMargin: -5
            spacing: 42
            Text {
                text: qsTr("Sham")
                font.pixelSize: 16
            }
            Switch {
                id: shamSwitch
                checked: false
            }
            RoundButton {
                id: setIconx
                Layout.leftMargin: -20
                flat: true
                icon.width: iconSize
                icon.source: "qrc:/res/ic_settings_black_48dp.png"
                opacity: iconOpacity
                visible: shamSwitch.checked
            }
        }
    }
}
