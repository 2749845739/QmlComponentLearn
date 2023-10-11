import QtQuick 2.15
import MyLib 1.0

Rectangle{
    width: 50
    height: 50
    color: "grey"

    MouseArea {
        anchors.fill: parent
        onClicked: {
//            var a = ClassA.Option1;
//            console.log("a= ",a)
//            console.log("ClassA.Option2 ",ClassA.Option2)
            console.log(ClassA.ScopedEnum.ScopeValue01)
            console.log(ClassA.ScopedEnum.ScopeValue02)
//            console.log(ClassA.ScopedEnum.DupliValue)
            console.log(" ")
            console.log(ClassA.OtherValue.OtherValue01)
            console.log(ClassA.OtherValue.OtherValue02)
//            console.log(ClassA.OtherValue.DupliValue)
            console.log(" ")
//            console.log(ClassA.ScopedEnum.DupliValue)
        }
    }


    enum Fruit {
        Apple = 5,
        Banana,
        Orange
    }

    Component.onCompleted: {
//        console.log(TestEnum.Fruit.Apple)
//        console.log(TestEnum.Fruit.Banana)
//        console.log(TestEnum.Fruit.Orange)
    }
}
