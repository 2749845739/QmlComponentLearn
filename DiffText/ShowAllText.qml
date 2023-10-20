import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
//import QtQuick.Controls 3
//import QtQuick.Controls.Material 2.15

ColumnLayout {
    property int textSize: 20
    width: 500
    spacing: 30

    // 简单文本
    RowLayout {
        Layout.fillWidth: true
        spacing: 50

        Text {
            text: "Text"
            Layout.alignment: Text.AlignHCenter
            font.pixelSize: textSize
        }
        Text {
            text: "TextTextTextTex1TextTextTextTextTex1Text"
            Layout.alignment: Text.AlignHCenter
            font.pixelSize: textSize
            elide: Text.ElideRight  // 长文本末尾省略符
            Layout.preferredWidth: parent.width / 5 * 4
            // import QtQuick.Controls 2.15
            ToolTip.text: "This is ToolTip"
            ToolTip.visible: mouseArea.containsMouse
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
            }
            // don't have this property
            //            selectByMouse
        }
    }

    // 继承自Text, 拓展了属性，区别不大
    RowLayout {
        Layout.fillWidth: true
        spacing: 40
        Label {
            text: "Label"
            Layout.alignment: Text.AlignHCenter
            font.pixelSize: textSize
        }
        Label {
            text: "Label"
            Layout.alignment: Text.AlignHCenter
            font.pixelSize: textSize
            background: Rectangle {
                color: "Green"
            }
        }
    }

    //   可编辑文本（可限制输入）
    // material下变成了横线, 原本是方框
    RowLayout {
        Layout.fillWidth: true
        spacing: 20
        TextInput {
            text: "TextInput"
            font.pixelSize: textSize
            cursorVisible: true
            selectByMouse: true
        }
        TextInput {
            text: "TextInput"
            font.pixelSize: textSize
            cursorVisible: true
            echoMode: TextInput.Password
        }
    }

    // 单行文本输入框（可限制输入）
    // 继承自TextInput, 相当于在TextInput外加了边框
    RowLayout {
        Layout.fillWidth: true
        spacing: 20
        TextField {
            id: textField
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("TextField")
            font.pixelSize: textSize
            horizontalAlignment: Text.AlignLeft
            selectByMouse: true
        }
        TextField {
            Layout.alignment: Qt.AlignHCenter
            placeholderText: qsTr("TextField")
            font.pixelSize: textSize
            horizontalAlignment: Text.AlignHCenter
            // 输入框回显方式
            echoMode: TextInput.Password
        }
    }



    //  TextArea是一个区域，可以设置背景background
    RowLayout {
        Layout.fillWidth: true
        spacing: 15
        Text {
            text: "TextArea"
            font.pixelSize: textSize
        }
        //  ScrollBar must be attached to a Flickable or ScrollView
        ScrollView {
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100
            Layout.alignment: Qt.AlignLeft
            // 多行文本输入框，继承自TextEdit
            TextArea {
                Layout.fillWidth: true
                Layout.fillHeight: true
                wrapMode: TextEdit.Wrap
                selectByMouse: true
                font.pixelSize: textSize - 2
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, " +
                    "sed do eiusmod tempor incididunt ut labore et dolore magna " +
                    "aliqua. Ut enim ad minim veniam, quis nostrud exercitation " +
                    "ullamco laboris nisi ut aliquip ex ea commodo cosnsequat. ";
            }
        }
    }

    RowLayout {
        Layout.fillWidth: true
        spacing: 15
        Text {
            text: "TextArea"
            font.pixelSize: textSize
        }
        //  ScrollBar must be attached to a Flickable or ScrollView
        ScrollView {
            Layout.preferredWidth: 400
            Layout.preferredHeight: 100
            Layout.alignment: Qt.AlignLeft
            // 多行文本输入框，继承自TextEdit
            TextArea {
                //                anchors.fill: parent
                Layout.fillWidth: true
                Layout.fillHeight: true
                wrapMode: TextEdit.Wrap
                selectByMouse: true
                font.pixelSize: textSize - 2
                background:  Rectangle{
                    color: "transparent"
                    border.color: "#626262"
                }
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, " +
                    "sed do eiusmod tempor incididunt ut labore et dolore magna " +
                    "aliqua. Ut enim ad minim veniam, quis nostrud exercitation " +
                    "ullamco laboris nisi ut aliquip ex ea commodo cosnsequat. ";
            }
        }
    }

    //    RowLayout {
    //        Layout.fillWidth: true
    //        spacing: 15
    //        Text {
    //            text: "TextEdit"
    //            font.pixelSize: textSize
    //        }
    //        //   多行文本
    //        TextEdit {
    //            Layout.preferredWidth: parent.width / 5 * 4
    //            Layout.preferredHeight: 100
    //            font.pixelSize: textSize - 2
    //            // 自动换行
    //            wrapMode: TextEdit.Wrap
    //            clip: true
    //            text:
    //                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, " +
    //                "sed do eiusmod tempor incididunt ut labore et dolore magna " +
    //                "aliqua. Ut enim ad minim veniam, quis nostrud exercitation " +
    //                "ullamco laboris nisi ut aliquip ex ea commodo cosnsequat. ";
    //        }
    //    }


    //    RowLayout {
    //        Layout.fillWidth: true
    //        spacing: 15
    //        Text {
    //            text: "TextEdit"
    //            font.pixelSize: textSize
    //        }
    //        //  ScrollBar must be attached to a Flickable or ScrollView
    //        ScrollView {
    //            Layout.preferredWidth: parent.width / 5 * 4
    //            Layout.preferredHeight: 50
    //            Layout.alignment: Qt.AlignLeft
    //            // 多行文本输入框，继承自TextEdit
    //            TextEdit {
    ////                anchors.fill: parent
    //                Layout.fillWidth: true
    //                Layout.fillHeight: true
    //                wrapMode: TextEdit.Wrap
    //                selectByMouse: true
    //                clip: true
    //                font.pixelSize: textSize - 2
    //                text:
    //                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, " +
    //                    "sed do eiusmod tempor incididunt ut labore et dolore magna " +
    //                    "aliqua. Ut enim ad minim veniam, quis nostrud exercitation " +
    //                    "ullamco laboris nisi ut aliquip ex ea commodo cosnsequat. ";
    //            }
    //        }
    //    }

}
























