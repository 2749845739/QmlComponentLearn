import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ColumnLayout {

    // 0: all
    property int showOption: 0
    property int textSize: 16

    //    width: 300
    //    height: 500
    // 不规定root的size，界面自动展示全部组件的外缘，spacing生效
    // 若规定root的size(设置width/height, 或者anchors.fill), spacing自动伸缩
    spacing: 10

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Basic Button 1")
        // 系统启用Material，如果未设置该属性，字符会全大写
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
//                visible: showOption === 0 || showOption === 1
        visible: false
    }

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Basic Button 2")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        // 控制按钮的边距，让文本全部展示
        leftPadding: 0
//                visible: showOption === 0 || showOption === 2
        visible: false
    }

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Flat Button 3")
        font.capitalization: Font.MixedCase
        // 未触发时，文本状态    触发后，出现按钮轮廓
        flat: true
        font.pixelSize: textSize
//                visible: showOption === 0 || showOption === 3
        visible: false
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material accent 4")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        highlighted: true
        // 必须和highlighted一起使用
        Material.accent: Material.LightGreen
//                visible: showOption === 0 || showOption === 4
        visible: false
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material foreground 5")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        // button中foreground相当于文本颜色
        // 不能和highlighted一起使用，会影响效果
        Material.foreground: Material.Pink
//                visible: showOption === 0 || showOption === 5
        visible: false
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material background 6")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        highlighted: true
        // 必须和highlighted一起使用
        Material.background: Material.Teal
//                visible: showOption === 0 || showOption === 6
        visible: false
    }

    // 方形图标按钮 1
    Button{
        Layout.alignment: Qt.AlignHCenter
        icon.height: 30
        icon.width: 30
        // button里面的图标，必须使用简单图形，可以给其填色
        icon.source: "qrc:/resource/pause_white.png"
        icon.color: Material.color(Material.Red)
        text: "Rec Button 7"
        font.capitalization: Font.MixedCase
        ToolTip.visible: hovered
        ToolTip.text: "This is button with picture 01"
//        visible: showOption === 0 || showOption === 8
        visible: false
    }

    // 方形图标按钮 2
    Button{
        Layout.alignment: Qt.AlignHCenter
        icon.height: 30
        icon.width: 30
        icon.source: "qrc:/resource/icons8-96.png"
        text: "Rec Button 8"
        font.capitalization: Font.MixedCase
        ToolTip.visible: hovered
        ToolTip.text: "This is button with picture 02"
//        visible: showOption === 0 || showOption === 7
        visible: false
    }

    // 圆形图标按钮 1
    RoundButton{
        flat: true
        Layout.alignment: Qt.AlignHCenter
        icon.source: "qrc:/resource/pause_white.png"
        icon.height: 30
        icon.width: 30
        // must use  Material.color()
        icon.color: Material.color(Material.Red)
        ToolTip.visible: hovered
        ToolTip.text: "This is round button with picture 01"
        visible: showOption === 0 || showOption === 9

    }


    // 圆形图标按钮 2
    RoundButton{
        flat: true
        Layout.alignment: Qt.AlignHCenter
        icon.source: "qrc:/resource/icons8-96.png"
        icon.height: 50
        icon.width: 50
        ToolTip.visible: hovered
        ToolTip.text: "This is round button with picture 02"
//        visible: showOption === 0 || showOption === 10
        visible: false
    }

    RoundButton {
        text: qsTr("<")
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    RoundButton {
        text: qsTr("A")
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    RoundButton {
        text: qsTr("A Button")
        font.capitalization: Font.MixedCase
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    RoundButton {
        text: "\u2713"  // Unicode Character 'CHECK MARK'
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    Item {
        height: 50
    }


    Button {
        id: control
        text: qsTr("Custome Button 11")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        Layout.alignment: Qt.AlignHCenter
//        visible: showOption === 0 || showOption ===  11
        visible: false

        contentItem: Text {
            text: control.text
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: control.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            border.color: control.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 10
        }
    }

    ToolButton{
        flat: true
        Layout.alignment: Qt.AlignHCenter
        icon.source: "qrc:/resource/pause_white.png"
        icon.height: 30
        icon.width: 30
        // must use  Material.color()
        icon.color: Material.color(Material.Red)
        ToolTip.visible: hovered
        ToolTip.text: "This is tool button 01"
//        visible: false
    }

    //  和flat button的区别？？？
    ToolButton {
        text: qsTr("Tool Button 12")
        Layout.alignment: Qt.AlignHCenter
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        visible: showOption === 0 || showOption === 12

    }

    ToolButton {
        text: qsTr("<")
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    ToolButton {
        text: qsTr("A")
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }

    ToolButton {
        text: "\u2713"  // Unicode Character 'CHECK MARK'
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: textSize
    }


    ToolBar {
        Layout.alignment: Qt.AlignHCenter
        visible: showOption === 0 || showOption === 13
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("‹")
                onClicked: stack.pop()
            }
            Label {
                text: "Title"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("⋮")
            }
        }
    }

}
