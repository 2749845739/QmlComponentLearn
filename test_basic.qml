import QtQuick 2.0


Rectangle {
    id: root
    width: 50
    height: 50
    color: "grey"

    MouseArea {
        onClicked: {
            if((mouse.button == Qt.LeftButton) && (mouse.modifiers & Qt.ShiftModifier))
                doSomething()
            if(root.width < root.height){
                width = 100
                height = 100
            }
        }
    }
}

