import QtQuick 2.0
import QtQuick.Controls 2.15

Item {

    implicitWidth: 1000
    implicitHeight:500
    //    width: 1000
    //    height: 500
    Row{
        spacing: 0
        anchors.centerIn: parent

        CusShowRectangle{
            title: "QList<QString>"
            // one-direction data binding : basicType.valList -> content01
            content01:basicType.valList[0]
            content02:basicType.valList[1]
            content03:basicType.valList[2]
            onMyClick:{
                // must explicitly specified
                // emit setValue
                basicType.valList = [content01,content02,content03];
            }
        }

        CusShowRectangle{
            title: "QList<int>"
            content01:basicType.valInt[0]
            content02:basicType.valInt[1]
            content03:basicType.valInt[2]

            onMyClick:{
                basicType.valInt = [content01,content02,content03];
            }
        }


        CusShowRectangle{
            title: "QVector<QString>"
            content01:basicType.valVector[0]
            content02:basicType.valVector[1]
            content03:basicType.valVector[2]

            onMyClick:{
                basicType.valVector = [content01,content02,content03];
            }
        }

        CusShowRectangle{
            title: "QStringList"
            content01:basicType.valStrList[0]
            content02:basicType.valStrList[1]
            content03:basicType.valStrList[2]

            onMyClick:{
                console.log("content01 = ",content01);
                var s = [content01,content02,content03];
                console.log("s = ",s);

                basicType.valStrList = s;
                console.log('\n\ncall property');
                basicType.valStrList = [content01,content02,content03];


                basicType.setValue([content01,content02,content03]);
            }

//            Button {
//                text: " involke setValue "
//                width:130
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                          basicType.setValue()
//                    }
//                }
//            }
        }

        CusShowRectangle{
            title: "QVariant"
            content01:basicType.valVariant[0]
            content02:basicType.valVariant[1]
            content03:basicType.valVariant[2]

            onMyClick:{
                /*
//                basicType.valVariant = {content01,content02,content03};
                console.log("basicType.valVariant = ",basicType.valVariant);
                // must use "[" ,can't use "{"   !!!
                var s = [content01,content02,content03];
                console.log("s = ",s);
                basicType.valVariant = s;
                */

               basicType.setValue();

            }
        }


    }

}
