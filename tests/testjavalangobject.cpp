

#include <QtCore>
#include <QTest>

#include <QtMobilePlugin/QtMobilePluginMime>

class TestJavaLangObject : public QObject {
    Q_OBJECT

public:

public slots:
    void testJavaObject();
};

void TestJavaLangObject::testJavaObject() {
    auto obj = JavaLangObject::fromClass(kJavaLangObject);
    QVERIFY(obj.getJavaClassName() == "java.lang.Object");
}


//QTEST_MAIN(TestJavaLangObject)
//#include "testjavalangobject.moc"
