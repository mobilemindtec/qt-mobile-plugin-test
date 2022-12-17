QT += quick core testlib

CONFIG += c++17 testcase

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#-QT_MOBILE_PLUGIN_LIB_PATH = /home/ricardo/sources/qt/build/QtMobilePlugin/android-build

#-QT_MOBILE_PLUGIN_FIREBASE_PATH = /home/ricardo/sources/qt/build/QtMobilePluginFirebase/android-build
#-QT_MOBILE_PLUGIN_FIREBASE_QML_PATH = $$QT_MOBILE_PLUGIN_FIREBASE_PATH/opt/Qt/5.15.2/android/qml/QtMobilePluginFirebase


#QT_MOBILE_PLUGIN_VARIANT = build-QtMobilePlugin-Android_Qt_5_15_2_Clang_Multi_Abi-Debug
#QT_MOBILE_PLUGIN_PATH = /home/ricardo/sources/qt/$$QT_MOBILE_PLUGIN_VARIANT
#QT_MOBILE_PLUGIN_LIB_PATH=$$QT_MOBILE_PLUGIN_PATH/android-build/libs/armeabi-v7a

SOURCES += \
        main.cpp \
        tests/testjavalangobject.cpp

HEADERS +=

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
#-QML_DESIGNER_IMPORT_PATH = $$QT_MOBILE_PLUGIN_FIREBASE_PATH/QtMobilePluginFirebase

android {

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    DISTFILES += \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradle.properties \
        android/google-services.json \
        android/AndroidManifest.xml \
        android/src/com/qt/plugin/test/MyClassTest.java


    LIBS += \
        -L/libs/$$QT_ARCH -lQtMobilePlugin_$$QT_ARCH \
        -L/libs/$$QT_ARCH -lQtMobilePluginFirebase_$$QT_ARCH


    equals(QT_ARCH, armeabi-v7a){
        ANDROID_EXTRA_LIBS += \
            /libs/armeabi-v7a/libQtMobilePlugin_armeabi-v7a.so \
            /libs/armeabi-v7a/libQtMobilePluginFirebase_armeabi-v7a.so \
    }
    equals(QT_ARCH, x86_64){
        ANDROID_EXTRA_LIBS += \
            /libs/x86_64/libQtMobilePlugin_x86_64.so \
            /libs/x86_64/libQtMobilePluginFirebase_x86_64.so \
    }


} else:ios {
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


#https://doc.qt.io/qt-6/qttest-best-practices-qdoc.html
# https://www.kdab.com/wp-content/uploads/stories/2019-45-QtWS-Berlin-Testing-Profiling-Qt-Android.pdf
#https://doc.qt.io/qt-6/qmake-common-projects.html#building-a-testcase

TESTARGS="-o result.xml,junitxml"