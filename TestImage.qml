import QtQuick 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: "gray"
    width: parent.width * 0.7
    height: parent.height * 0.7

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // 默认等比例，而且以最小值为基准
        // 1
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                sourceSize.width: 20
                sourceSize.height: 20
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                sourceSize.width: 20
                sourceSize.height: 50
            }
        }

        // 2
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                sourceSize.width: 50
                sourceSize.height: 50
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                sourceSize.width: 50
                sourceSize.height: 80
            }
        }


        Item{
            width: 20
        }


        // 默认等比例，以最大值为基准
        // 3
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectCrop
                sourceSize.width: 20
                sourceSize.height: 20
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectCrop
                sourceSize.width: 20
                sourceSize.height: 50
            }
        }

        // 4
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectCrop
                sourceSize.width: 50
                sourceSize.height: 50
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectCrop
                sourceSize.width: 50
                sourceSize.height: 80
            }
        }


        Item{
            width: 20
        }

        // 5 默认等比例，以最大值为基准
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 20
                sourceSize.height: 20
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 20
                sourceSize.height: 50
            }
        }

        // 6
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 50
                sourceSize.height: 50
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: 50
                sourceSize.height: 80
            }
        }


        Item{
            width: 20
        }

        // width and height don't hane any effect
        // 7
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                width: 5
                height: 5
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                width: 5
                height: 10
            }
        }

        // 8
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                width: 10
                height: 10
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                width: 10
                height: 20
            }
        }


        Item{
            width: 20
        }
        // 9
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectCrop
                width: 5
                height: 5
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectCrop
                width: 5
                height: 10
            }
        }

        // 10
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectCrop
                width: 10
                height: 10
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectCrop
                width: 10
                height: 20
            }
        }


        Item{
            width: 20
        }
        // 11
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                fillMode: Image.PreserveAspectFit
                width: 5
                height: 5
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                fillMode: Image.PreserveAspectFit
                width: 5
                height: 10
            }
        }

        //12
        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            Image {
                source: "qrc:/resource/ic_eshim_white.png"
                 fillMode: Image.PreserveAspectFit
                width: 10
                height: 10
            }

            Image {
                source: "qrc:/resource/ic_gradient_white.png"
                 fillMode: Image.PreserveAspectFit
                width: 10
                height: 20
            }
        }

    }

}
