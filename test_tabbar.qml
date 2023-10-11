import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {

    width:500
    height:600

    TabBar {
        id: bar
        width: parent.width -20
        TabButton {
            text: qsTr("Ecg")
        }
        TabButton {
            text: qsTr("Pulse")
        }
        TabButton {
            text: qsTr("Respiratory")
        }
    }



//    StackLayout {   //栈布局管理器
//        anchors.centerIn: parent
//        width: parent.width
//        currentIndex: bar.currentIndex  //当前视图的索引
//        Item {
//            Text {
//                anchors.centerIn: parent
//                text: qsTr("First")
//            }
//        }
//        Item {
//            Text {
//                anchors.centerIn: parent
//                text: qsTr("Second")
//            }
//        }
//        Item {
//            Text {
//                anchors.centerIn: parent
//                text: qsTr("Third")
//            }
//        }
//    }



        SwipeView {
            id: view
            currentIndex: bar.currentIndex  //当前视图的索引
            anchors.top: bar.bottom
            width: parent.width

            Rectangle {
                id:item_01
                implicitHeight: 100
//                width:100
                color: "red"
            }

            Rectangle {
                id:item_02
                implicitHeight: 100
                color: "yellow"
            }


            Rectangle {
                id:item_03
                implicitHeight: 100
                color: "blue"
            }

        }


}
