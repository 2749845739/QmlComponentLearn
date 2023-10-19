import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

GridLayout {
    id: grid
    width: parent.width
    height: parent.height
    columns:15
    rows: 15

    property var circle01: [23, 48, 77, 106, 137, 168, 199, 216,
        218, 220, 207, 178, 149, 120, 89, 58]
    property var circle02: [38, 36, 50, 64, 78, 108, 138, 169, 138,
        185, 186, 188, 190, 191, 177, 148, 118, 103, 72, 56, 40 ]
    property var line01: [51, 52, 53, 54, 55, 56]
    property var line02: [65, 66, 82, 83, 84, 85, 71]
    property var line03: [94, 96, 97, 98, 99, 101, 102]
    property var line04: [109, 110, 112, 113, 114, 116, 117]
    property var line05: [139, 141, 142, 143, 144, 146, 147]
    property var line06: [155, 156, 157, 158, 159, 160, 161]
    property var line07: [171, 172, 173, 174, 175, 176]

    property var nameList: [circle01, circle02, line01, line02, line03,
        line04, line05, line06, line07]
    property int loX: 0
    property int loY: 0


    Repeater {
        id: repeater
        model: grid.columns * grid.rows
        Rectangle {
            id: point
            Text {  text: index   }
        }
        // 不能在point中获取坐标，全是0
        Component.onCompleted: {
            for(const list of nameList){
                for(const v of list){
                    console.log("index:", v, "  x:", repeater.itemAt(v).x, "y:", repeater.itemAt(v).y)
                    repeater.itemAt(v).enabled = true
                }
            }
        }
    }
}
