import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    id: root
    property int textSize: 20
    property int componentSize:  30
    spacing: 30

    Button{
        Layout.alignment: Qt.AlignHCenter
        text: "Button"
        font.pixelSize: textSize
        ToolTip.visible: hovered
        ToolTip.text: "This is Button"
    }

    RoundButton {
        Layout.alignment: Qt.AlignHCenter
        icon.width: componentSize
        icon.height: width
        icon.source: "qrc:/resource/volume.png"
        icon.color: "Green"
        ToolTip.text: "This is RoundButton"
        ToolTip.visible: hovered
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Text")
        font.pixelSize: textSize
        ToolTip.text: "This is Text"
        ToolTip.visible: mousearea1.containsMouse
        MouseArea {
            id: mousearea1
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    Label {
        Layout.alignment: Qt.AlignHCenter
        text: "Label"
        font.pixelSize: textSize
        ToolTip.text: "This is Label"
        ToolTip.visible: mousearea2.containsMouse
        MouseArea {
            id: mousearea2
            anchors.fill: parent
            hoverEnabled: true
        }
    }

    Rectangle {
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.preferredHeight: 40
        color: "green"
        Text {
            anchors.centerIn: parent
            text: qsTr("Rectangle")
            font.pixelSize: textSize
        }
        ToolTip.text:"This is Rectangle"
        ToolTip.visible: mousearea3.containsMouse
        MouseArea {
            id: mousearea3
            anchors.fill: parent
            hoverEnabled: true
        }
    }
}
