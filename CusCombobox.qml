import QtQuick.Controls 2.0
import QtQuick 2.7

Rectangle{
    width: 200
    height:500

    Column {
       spacing: 20

        ComboBox {
            id :box

            editable: true
            model: ListModel {
                id: model
                ListElement { text: "BananaBananaBanana" }
                ListElement { text: "Apple" }
                ListElement { text: "Coconut" }
            }
            onAccepted: {
                if (find(editText) === -1)
                    model.append({text: editText})
            }


           // not effect
//            onSelectTextByMouseChanged: {
//                console.log("onSelectTextByMouseChanged")
//            }

            onCurrentIndexChanged: {
                console.log("onCurrentIndexChanged: currentText = ",currentText)
//                box.enabled = false
            }
        }


        Rectangle{
            width: 50
            height: 20
            Text {
                text: qsTr("text")
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    box.currentIndex = box.find("Banana")
                }
            }
        }

    }







}

