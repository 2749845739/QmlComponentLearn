import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

RowLayout {
    id: root
    // 若对root的size不做任何设定，默认展示全部组件原始大小

    // 本界面预览时，无法找到parent, 默认界面较小，无法展示全部的组件内容
    // 运行时根据实际parent，自动拓展界面大小，若组件fillWidth: true，组件size也会自动拉伸
    anchors.fill: parent


    //    width:300
    // 没有指定Layout的宽度，会按照实际spacing来排列
    // 若指定宽度， spacing只是最小值 ?
    spacing: 10


    RowLayout {
        Layout.fillWidth: true
        spacing: 10
        Rectangle {
            color: 'teal'
            Layout.fillWidth: true
            Layout.preferredWidth: 100
            //            Layout.minimumHeight: 100
            Layout.preferredHeight: 100
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }

        Rectangle {
            color: 'plum'
            Layout.fillWidth: true
            Layout.preferredWidth: 100
            //            Layout.minimumHeight: 100
            Layout.preferredHeight: 100
            Text {
                anchors.centerIn: parent
                text: parent.width + 'x' + parent.height
            }
        }
    }

    Rectangle {
        color: 'teal'
        Layout.fillWidth: true // 优先级 > preferredWidth > width
        //        Layout.minimumWidth: 50
        Layout.preferredWidth: 100
        //        Layout.maximumWidth: 300
        //        Layout.minimumHeight: 150
        Layout.preferredHeight: 150
        Text {
            anchors.centerIn: parent
            text: parent.width + 'x' + parent.height
        }
    }
    Rectangle {
        color: 'plum'
        Layout.fillWidth: true
        //        Layout.minimumWidth: 100
        Layout.preferredWidth: 200
        Layout.preferredHeight: 100
        Text {
            anchors.centerIn: parent
            text: parent.width + 'x' + parent.height
        }
    }

    ComboBox{
        id: basicCombobox
        // 在Layou里面时，width不生效, must use "Layout."
        width: 10
//        Layout.preferredWidth: 60

        currentIndex: 0
        model: ["config", " spectrometer"]
        popup.closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
                           | Popup.CloseOnReleaseOutside
        onCurrentIndexChanged: {
            // 初始化时不会触发
            console.log("onCurrentIndexChanged", currentIndex)
            initCycle()
        }

        Component.onCompleted: {
            console.log("basicCombobox.width", basicCombobox.width)
        }
    }


    BasicComponent {
        // 如果没有指定size, 默认会为0
        //        Layout.fillWidth: true
        //        Layout.preferredWidth: 60
        //        Layout.preferredHeight: 60
    }
}
