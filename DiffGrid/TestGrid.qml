import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.15
import "./DiffText"

GridLayout{
    columnSpacing: 100
    columns: 3

//    与GridLayout组合使用，表示占据2列的位置
    // Layout.columnSpan: 2

    Repeater {
        model: listModel
        LabelTextFieldR{
            id: phGapRatio
            title: qsTr("Channel0") + model.Order + (":")
            text: model.Content
            Layout.fillWidth: true
            enabled: true
            titleOpacity: 1
            titleSize: 14
            titleWidth: 100
            textFiledWidth: 100
            validator: RegExpValidator{regExp: /^\d+(\.\d+)?$/}
            onTextEdited:{
                console.log("index:", index)
                checkEditingFinished()
            }
        }
    }


    ListModel {
        id: listModel

        ListElement {
            Order: 1
            Content: 1000
        }
        ListElement {
            Order: 2
            Content: 2000
        }
        ListElement {
            Order: 3
            Content: 30000
        }
        ListElement {
            Order: 4
            Content: 40000
        }
        ListElement {
            Order: 5
            Content: 50000
        }
        ListElement {
            Order: 6
            Content: 60000
        }
    }

}
