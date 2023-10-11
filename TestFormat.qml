import QtQuick 2.15


Item {

    property int orange: TestEnum.Fruit.Orange
    Component.onCompleted: {
        console.log("orange", orange)
        console.log(TestEnum.Fruit.Apple)
        console.log(TestEnum.Fruit.Banana)
        console.log(TestEnum.Fruit.Orange)
    }
}


