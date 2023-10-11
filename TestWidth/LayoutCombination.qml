/* * * * * * * * * * * * * * * * * * * * *
*   File:     LayoutCombination.qml
*   Author:   yue.wang
*   Company:  fuqing
*   Time:     2023-10-11
*   Brief:    在Layout中， 固定位置和自动拉伸组合使用
* * * * * * * * * * * * * * * * * * * * * */
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    width: 1000
    height: 100

    RowLayout {
        anchors.fill: parent
        spacing: 10

        BasicComponent {
            Layout.fillWidth: true
            size: 100
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 5
            Repeater {
                model: 5
                BasicComponent {
                    size: 50
                }
            }
        }

        BasicComponent {
            Layout.fillWidth: true
            size: 100
        }
    }
}

