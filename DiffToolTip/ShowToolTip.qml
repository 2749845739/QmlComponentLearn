import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ColumnLayout {

    property int textSize: 16

//    width: 300
//    height: 500
    // 不规定root的size，界面自动展示全部组件的外缘，spacing生效
    // 若规定root的size(设置width/height, 或者anchors.fill), spacing自动伸缩
    spacing: 20

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Basic Button")
        // 系统启用Material，如果未设置该属性，字符会全大写
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
    }

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Basic Button")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        // 控制按钮的边距，让文本全部展示
        leftPadding: 0
    }

    // 未触发时，文本状态    触发后，出现按钮轮廓
    Button{
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Flat Button")
        font.capitalization: Font.MixedCase
        flat: true
        font.pixelSize: textSize
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material accent")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        highlighted: true
        // 必须和highlighted一起使用
        Material.accent: Material.LightGreen
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material foreground")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        // button中foreground相当于文本颜色
        // 不能和highlighted一起使用，会影响效果
        Material.foreground: Material.Pink
    }

    Button {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Material background")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        highlighted: true
        // 必须和highlighted一起使用
        Material.background: Material.Teal
    }

    // 椭圆按钮
    Button{
        text: qsTr("Export")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        Layout.alignment: Qt.AlignHCenter
        flat: true
        ToolTip.visible: hovered
        ToolTip.text: qsTr("Export backup to the specified directory")
    }

    // 方形图标按钮
    Button{
        id: closeBtn
        Layout.alignment: Qt.AlignHCenter
        visible: false
        icon.source: "qrc:/resource/play_black.png"
        hoverEnabled: true
        flat: !hovered
        highlighted: hovered
        Material.accent: Material.Red
    }

    // 圆形图标按钮
    RoundButton{
        id: delBtn
        flat: true
        Layout.alignment: Qt.AlignHCenter
        ToolTip.text: qsTr("Delete data")
        ToolTip.visible: hovered
        hoverEnabled: true
        icon.source: "qrc:/resource/pause_white.png"
        icon.height: 30
        icon.width: 30
        icon.color: (Material.theme === Material.Dark) ? "white" : "black"
        MouseArea{
            anchors.fill: parent
            propagateComposedEvents: true
        }
    }

    Button {
        id: control
        text: qsTr("Custome Button")
        font.capitalization: Font.MixedCase
        font.pixelSize: textSize
        Layout.alignment: Qt.AlignHCenter

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
            radius: 2
        }
    }

}
