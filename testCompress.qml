import QtQuick 2.0
import QtQml.Models 2.2
import Qt.labs.folderlistmodel 2.1
import Qt.labs.compression 1.0
import Qt.labs.archive 1.0


Rectangle{
    width: 50
    height: 50
    color: "grey"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            //                console.log("onClicked")
            //                basicType.init()
            //                  basicType.runShell();
            dlg.open()
        }
    }

    function compressFolder(source, destination, filename) {
        // 创建文件夹列表模型
        var folderListModel = folderListModelCreation.createFolderListModel();

        // 设置根文件夹路径
        folderListModel.folder = source;

        var destinationPath = destination + "/" + filename;

        // 创建压缩器
        var compressor = Compression.createArchive(destinationPath);

        // 遍历文件夹列表模型
        for (var i = 0; i < folderListModel.count; ++i) {
            var fileInfo = folderListModel.get(i);

            // 添加文件到压缩器
            compressor.addFile(fileInfo.filePath, fileInfo.fileName);
        }

        // 完成压缩并关闭压缩器
        var compressionResult = compressor.compressSync();
        compressor.destroy();

        if (compressionResult === Compression.CompressionResult.NoError) {
            console.log("压缩成功！");
        } else {
            console.error("压缩失败：", compressionResult);
        }
    }

    Component.onCompleted: {
        compressFolder("D:/Lab-Root/Package/config", "C:/Users/Administrator/AppData/Andromeda/FastBackup", "config_scheduled_backup_20230704.zip");
    }
}
