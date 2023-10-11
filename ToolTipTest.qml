import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {

    ColumnLayout {
        spacing: 30

        Image {
            property real iconSize: 32
            sourceSize.width: iconSize
            sourceSize.height: iconSize
            source: "qrc:/resource/play_black.png"
            antialiasing: true
            ToolTip.visible: mouse.containsMouse
            ToolTip.text: qsTr("EShimer")
            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
            }
        }


        Button{
            id: esDataBtn
            text: qsTr("Data")
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Query the data of EShimer")
            flat: true
            font.capitalization: Font.MixedCase
            font.pixelSize: 16
        }
    }

}
