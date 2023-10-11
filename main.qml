import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "./TestWidth"
import "./DiffButton"

//Window {

ApplicationWindow {
    width: 500
    height: 850
    visible: true
    title: qsTr("Hello World")

//    Material.theme: Material.Red
//    Material.accent: Material.Purple
//    Material.elevation: 6
//    Material.primary: Material.Amber


    //    LayoutSpacing{
    //    TestImage{
    ShowAllButton {
        //        anchors.fill: parent
        anchors.centerIn: parent
    }
}
