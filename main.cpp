#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include "BasicTypeTest.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // 使用 Material.background 等属性，cmakelist中还需要添加QuickControls2
   //  如果启用该属性，即使qml内未使用Material，系统也会启用Material
    // 如高亮色改变、按钮字符全大写
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
//    BasicTypeTest* m_basic  = BasicTypeTest::instance();
//    engine.rootContext()->setContextProperty("basicType",m_basic);
//    qmlRegisterType<BasicTypeTest>("MyLib", 1, 0, "ClassA");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
