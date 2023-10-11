import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4

RowLayout {
    property string title: qsTr("Title")
    property int    titleSize: 16
    property color  radioBorderColor: "black"
    property real   radioBorderWid: 1
    property bool   isRun: true
    property bool checked: true
    property int  space: 0

//    width: 30
    height: 40
    spacing: space

    Label {
        text: title
        font.pixelSize: titleSize
    }

    Rectangle {
        width: 15
        height: 15
        border.color: radioBorderColor
        border.width: radioBorderWid
        color: isRun ? "green" : "red"
        opacity: 0.5
        radius: 100
        clip: true           // 截断，在Rectangle控件内的子控件，超出他本身大小后会被截断
    }


}
