#include "BasicTypeTest.h"
#include <QDebug>
#include <QProcess>
#include <QMetaEnum>
#include <QString>
#include <QTextCodec>
#pragma execution_character_set("utf-8")

BasicTypeTest *BasicTypeTest::instance()
{
    static BasicTypeTest it;
    return &it;
}

const int DATA_LENGTH = 3;
BasicTypeTest::BasicTypeTest(QObject *parent)
    : QObject{parent},m_valList{},m_valVector{},m_valInt{},m_valStrList{},m_valVariant{}
{
    //    qDebug()<<"BasicTypeTest();";
    init();

    getAll();
}

// Unable to assign [undefined] to QString
// have no data
QVector<QString> BasicTypeTest::getString()
{
    QVector<QString>  val;
    val.append("a");
    val.append("b");
    return val;
}

void BasicTypeTest::init()
{
    //    qDebug()<<"init();";
    //    qDebug()<<" emit sigTest();";
    //    emit sigTest();
    m_valList <<"w" <<"d"<<"";
    m_valVector <<"w" <<"d"<<"e";
    m_valInt <<1<<3<<5;
    //     m_valStrList <<"w" <<"d"<<"e";
    m_valStrList <<"" <<""<<"";

    QStringList s = {"w" ,"d","e"};
    m_valVariant = QVariant::fromValue(s);

}

void BasicTypeTest::deteDupli()
{
    qDebug()<<"deteDupli();";
    QStringList mList = {"1","2","1"};

}

void BasicTypeTest::runShell()
{

    QProcess process;
    int ret = process.execute("lsb_release",QStringList()<< "-d");
    process.waitForFinished();
    QString result = process.readAllStandardOutput();
    qDebug()<<"ret:" <<ret;
    qDebug()<<"result:\n" <<result;

    //    QProcess process;
    //    process.start("ls",QStringList()<< "/usr/local");
    //    qDebug()<<"123";
    //    process.waitForFinished();
    ////    connect(&process, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished),
    ////        [=](int exitCode, QProcess::ExitStatus exitStatus){  qDebug()<<"-----"; });
    //    QString result = process.readAllStandardOutput();
    //    qDebug()<<"result:\n" <<result;

    //    int ret = system("lsb_release -d");
    //    qDebug()<<"ret:" <<ret;


}

void BasicTypeTest::setValue()
{
    qDebug() << "\n\nsetValue ";

    // use "m_" never emit setValStrList !!!
    //   m_valStrList.clear();
    //   m_valStrList << ""<<"s"<<"";

    QStringList t;
    t<<"1"<<"2"<<"3";
    setValVariant(QVariant::fromValue(t));

}

void BasicTypeTest::testEncode()
{

    QMap<int, QString> StatusInfoMap{
        {0, "运行"},
        {1, "模块故障"},
        {2, "主电源故障"} // ???
    };

    QString str = "中文";
    qDebug() << "00:" <<str;
    qDebug() << "value(0):" <<str << StatusInfoMap.value(0);
    qDebug() << "value(1):" <<str << StatusInfoMap.value(1);
    qDebug() << "value(2):" <<str << StatusInfoMap.value(2);

    qDebug() << "01:" << str.toUtf8().constData();

    QString str02 = QString::fromLocal8Bit(str.toStdString().c_str());
    qDebug() << "02:"<< str02;

    QString str03 = QString::fromLocal8Bit("中文");
    qDebug() << "03:"<< str03;

    QString str04 = QString::fromUtf8(str.toStdString().c_str());
    qDebug() << "04:"<< str04;

    QString str05 = QString::fromLocal8Bit(str.toLatin1());
    qDebug() << "05:"<< str05;

//    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF-8"));
//    qDebug() << "06 中文字符";

}


const QList<QString> &BasicTypeTest::valList() const
{
    return m_valList;
}

void BasicTypeTest::setValList(const QList<QString> &newValList)
{
    qDebug() << "\nsetValList ";
    qDebug() << "newValList " << newValList;
    if (m_valList == newValList)
        return;
    m_valList = newValList;
    emit valListChanged();
}

const QVector<QString> &BasicTypeTest::valVector() const
{
    return m_valVector;
}

void BasicTypeTest::setValVector(const QVector<QString> &newValVector)
{
    qDebug() << "\nsetValVector ";
    qDebug() << "newValVector " << newValVector;
    if (m_valVector == newValVector)
        return;
    m_valVector = newValVector;
    emit valVectorChanged();
}

const QList<int> &BasicTypeTest::valInt() const
{
    return m_valInt;
}

void BasicTypeTest::setValInt(const QList<int> &newValInt)
{
    qDebug() << "\nsetValInt ";
    qDebug() << "newValInt " << newValInt;
    if (m_valInt == newValInt)
        return;
    m_valInt = newValInt;
    emit valIntChanged();
}

const QStringList &BasicTypeTest::valStrList() const
{
    return m_valStrList;
}

void BasicTypeTest::setValStrList(const QStringList &newValStrList)
{
    qDebug() << "setValStrList newValStrList = "<< newValStrList;
    if (m_valStrList == newValStrList)
        return;
    m_valStrList = newValStrList;
    qDebug() << "m_valStrList " << m_valStrList;
    qDebug() << "newValStrList " << newValStrList;

    emit valStrListChanged();
}

const QVariant &BasicTypeTest::valVariant() const
{

    return m_valVariant;
}

// // just a light copy , not need to consider "&"
void BasicTypeTest::setValVariant(const QVariant &newValVariant)
{
    qDebug() << "\nsetValVariant ";
    // QVariant(QJSValue, )
    qDebug() << "newValVariant " << newValVariant;
    if (m_valVariant == newValVariant)
        return;
    // just a light copy , not need to consider "&"
    m_valVariant = newValVariant;

    qDebug() << "m_valVariant " << m_valVariant;
    //  ("ww", "dd", "ee")
    qDebug() << "m_valVariant toStringList" <<m_valVariant.toStringList();
    qDebug() << "newValVariant " << newValVariant;

    //    QStringList s = {"w" ,"d","e"};
    //    m_valVariant = QVariant::fromValue(s);
    //    qDebug() << "after  ";
    //    qDebug() << "m_valVariant " << m_valVariant;
    //    qDebug() << "newValVariant.toStringList " << newValVariant.toStringList();
    emit valVariantChanged();
}

void BasicTypeTest::str2binary(const QString &strData)
{
    qDebug() << "parseStatus:" << strData;
    QString bigEndianHex;
    for (int i = strData.length() - 2; i >= 0; i -= 2) {
        bigEndianHex.append(strData.midRef(i, 2));
    }

    bool ok;
    QString binaryString;
    quint32 decimalValue = bigEndianHex.toUInt(&ok, 16);
    if(ok){
        binaryString = QString::number(decimalValue, 2);
    }else{
        qWarning() << "Failed to use toUInt in parseStatus:" << bigEndianHex;
        return;
    }
    binaryString = binaryString.rightJustified(strData.length() * 4, '0');
    qDebug() << "Binary:" << binaryString;
}

QJsonObject BasicTypeTest::getAll()
{
    qDebug() << "getAll";
    QJsonObject data;
    // serialPort data
    bool enable = true;
    bool conected = false;
    QVector<int> setCurrent{0,1,2,3,4,5};
    QVector<QString> chError{"e0", "e1", "e2", "e3", "e4", "e5"};


    data.insert("enabled", enable);
    data.insert("connected", conected);

    QJsonArray setCurrentArray;
    Q_FOREACH(auto v, setCurrent){
        setCurrentArray.append(v);
    }
    data.insert("setCurrent", setCurrentArray);

    QJsonArray chErrorArray;
    Q_FOREACH(auto v, chError){
        chErrorArray.append(v);
    }
    data.insert("chError", chErrorArray);

    qDebug() << "data:" <<  data;
    return data;
}

QMap<QString, QString> BasicTypeTest::getAllMap()
{

    QMap<QString, QString> data;
    return data;
}





