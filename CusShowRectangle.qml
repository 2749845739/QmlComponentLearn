import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    implicitWidth:180
    implicitHeight: 300

//    width:150
//    height: 300

    property string title:"title"
    property alias content01: text01.text
    property alias content02: text02.text
    property alias content03: text03.text


    signal myClick()

    Column {
        // not effect
        anchors.centerIn: parent
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30

        Text {
            id:title_text
            // if text is empty, there is no position for Text
            text: title
            font.family: "Helvetica"
            font.pointSize: 13
            color: "black"
        }

        TextField {
            id:text01
            width: 100

        }

        TextField {
            id:text02
            width: 100

        }


        TextField {
            id:text03
            width: 100

        }

        Button {
            text: "change content"
            width:130
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    content01 = content01 + content01
                    content02 = content02 + content02
                    content03 = content03 + content03
                    console.log("---content01 :",content01);
                    console.log("---text01.text :",text01.text);
                }
            }
        }

        Button {
            text: " setValue "
            width:130
            MouseArea {
                anchors.fill: parent
                onClicked: {
                      myClick()
                }
            }
        }


    }


}
