import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    property color recColor: "#e9eed9"
    property int size: 100
//    property int recWidth: 100
//    property int recHeight: 100

//    implicitWidth: 30
//    implicitHeight: 50

    color: recColor
    width: size
    height: size

    Text {
        anchors.centerIn: parent
        text: parent.width + 'x' + parent.height
    }
}
