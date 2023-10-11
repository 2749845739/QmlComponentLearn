import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.3

RowLayout{
    id: root
    property real titleWidth: 200*dp
    property real textFiledWidth: 300*dp
    property real titleSize: 14
    property real titleFieldSize: 14
    property real titleOpacity: 0.8
    property string title: qsTr("Title")
    property alias validator: textFieldT.validator
    property alias text: textFieldT.text
    property alias readOnly: textFieldT.readOnly
    property alias enabled: textFieldT.enabled
    property alias echoMode: textFieldT.echoMode
    property bool isEncryption: false
    signal textEdited()
    spacing: 32*dp

    Label{
        text: root.title
        font.bold: true
        opacity: titleOpacity
        font.pixelSize: root.titleSize
        Layout.minimumWidth: titleWidth
        Layout.maximumWidth: titleWidth
    }
    TextField{
        id : textFieldT
        Layout.fillWidth: true
        selectByMouse: true
        horizontalAlignment: TextInput.AlignHCenter
        font.pixelSize: titleFieldSize
        Layout.minimumWidth: textFiledWidth
        Layout.maximumWidth: textFiledWidth
        Rectangle{
            color: "#3A3A3A"
            visible: isEncryption
            width: 30
            height: visibleImage.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: textFieldT.right
            anchors.rightMargin: -5
            Image{
                property bool isVisible: false
                id: visibleImage
                anchors.verticalCenter: parent.verticalCenter
                source: isVisible ? "qrc:/res/icons/action/ic_visibility_white_48dp.png" : "qrc:/res/icons/action/ic_visibility_off_white_48dp.png"
                sourceSize.height: 20
                sourceSize.width: 20
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        visibleImage.isVisible = !visibleImage.isVisible
                        if(visibleImage.isVisible){
                            textFieldT.echoMode = TextInput.Normal
                        }else{
                            textFieldT.echoMode = TextInput.Password
                        }
                    }
                }
                ColorOverlay{
                    anchors.fill: parent
                    source: visibleImage
                    color: "white"
                }
            }
        }
        onTextEdited: {
            root.textEdited()
        }
    }
}
