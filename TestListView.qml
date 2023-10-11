import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
Item {
    width: 640
    height: 480
    visible: true
    ListView {
        anchors.fill: parent
        spacing: 5
        model: testmodel
        delegate: testDelegate
    }
    ListModel {
        id: testmodel
        ListElement {
            name: "Apple"
            cost: 2.45
            mycolor: "#00B000"
            visible: true

            height: 20
        }
        ListElement {
            name: "Banana"
            cost: 3.25
            mycolor: "steelblue"
            visible: false
            height: 0
        }
        ListElement {
            name: "Candle"
            cost: 1.95
            mycolor: "red"
            visible: true
            height:30
        }

        ListElement {
            name: "Duple"
            cost: 1.95
            mycolor: "green"
            visible: true
            height: 20
        }
    }
    Component {
        id: testDelegate
        Item {
            id: name
            height: {
                console.log(index, model.height)
                return model.height
            }
            width: 100
            visible: model.visible
            Rectangle{
                color:{
                    console.log(index,model.mycolor)
                    return model.mycolor
                }
                anchors.fill: parent
                visible: parent
                Text { text: model.name }
            }
        }
    } }
