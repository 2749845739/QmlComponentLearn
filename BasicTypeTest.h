#ifndef BASICTYPETEST_H
#define BASICTYPETEST_H

#include <QObject>
#include <QList>
#include <QVariant>
#include <QCoreApplication>
#include <QFile>
#include <QDir>
#include <QJsonObject>
#include <QJsonArray>

// 界面属性绑定是单向的,qml->cpp 必须显式设置属性的值

class BasicTypeTest : public QObject
{
    Q_OBJECT
    Q_CLASSINFO("RegisterEnumClassesUnscoped", "false")

public:
    enum MyEnum {
        Option1,
        Option2,
        Option3
    };
    Q_ENUM(MyEnum)

    enum class ScopedEnum {
        ScopeValue01 = 0,
        ScopeValue02,
        DupliValue
    };
    Q_ENUM(ScopedEnum)

    enum class OtherValue {
        OtherValue01 = 10,
        OtherValue02,
        DupliValue
    };
    Q_ENUM(OtherValue)

    static BasicTypeTest* instance();
    explicit BasicTypeTest(QObject *parent = nullptr);

    // while color  change ???
    Q_PROPERTY(QList<QString> valList READ valList WRITE setValList NOTIFY valListChanged)
    Q_PROPERTY(QList<int> valInt READ valInt WRITE setValInt NOTIFY valIntChanged)
    Q_PROPERTY(QVector<QString> valVector READ valVector WRITE setValVector NOTIFY valVectorChanged)
    Q_PROPERTY(QStringList valStrList READ valStrList WRITE setValStrList NOTIFY valStrListChanged)
    // in qml, don't need to parse QVariant, use valVariant[0]
    Q_PROPERTY(QVariant valVariant READ valVariant WRITE setValVariant NOTIFY valVariantChanged)

    Q_INVOKABLE QVector<QString> getString();
    Q_INVOKABLE void init();
    Q_INVOKABLE void deteDupli();
    /**
     * @brief runShell   test run shell instructions
     */
    Q_INVOKABLE void runShell();
    Q_INVOKABLE void setValue();

    Q_INVOKABLE void testEncode();

    const QList<QString> &valList() const;
    void setValList(const QList<QString> &newValList);

    const QVector<QString> &valVector() const;
    void setValVector(const QVector<QString> &newValVector);

    const QList<int> &valInt() const;
    void setValInt(const QList<int> &newValInt);

    const QStringList &valStrList() const;
    void setValStrList(const QStringList &newValStrList);

    const QVariant &valVariant() const;
    void setValVariant(const QVariant &newValVariant);

    void str2binary(const QString &strData);

private:
    QJsonObject getAll();
    QMap<QString, QString> getAllMap();

signals:
    void sigTest();

    void valListChanged();
    void valVectorChanged();

    void valIntChanged();

    void valStrListChanged();

    void valVariantChanged();

private:
    QList<QString> m_valList;
    QVector<QString> m_valVector;
    QList<int> m_valInt;
    QStringList m_valStrList;
    QVariant m_valVariant;
};

#endif // BASICTYPETEST_H
