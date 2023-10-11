import QtQuick 2.9
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.3


ColumnLayout {
    width: 500
    height: 500
    spacing: 20

    RowLayout {
        Layout.alignment: Qt.AlignHCenter
        Button {
            flat: true
            text: "Folder"
            onClicked: {
                folder.open()
            }
        }
        TextField {
            id: folderText
        }
    }

    FolderDialog {
        id: folder
         onAccepted: {
            console.log("folder accept:", folder.folder)
            folderText.text = folder.folder
         }
    }


    RowLayout {
        Layout.alignment: Qt.AlignHCenter
        Button {
            flat: true
            text: "File"
            onClicked: {
                file.open()
            }
        }
        TextField {
            id: fileText
        }
    }

    FileDialog {
        id: file
        nameFilters: ["Compress file(*.7z *.rar *.zip)"]
        onAccepted: {
            // 不同Qt版本下， 有的file，  有的fileUrl
            console.log("file.file accept:", file.file)
            console.log("file.fileUrl accept:", file.fileUrl.toString())
            console.log("file.folder accept:", file.folder)
            fileText.text = file.folder
         }
    }
}
