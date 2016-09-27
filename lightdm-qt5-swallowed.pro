TEMPLATE = app
TARGET = lightdm-qt5-swallowed

VER_MAJ = 1
VER_MIN = 2
VER_PAT = 0

QT += core gui widgets
CONFIG += debug_and_release
BUILD_DIR = $$_PRO_FILE_PWD_/../lightdm-qt5-swallowed-build
CONFIG(debug, debug|release) {
    DESTDIR = $$BUILD_DIR/debug
}
CONFIG(release, debug|release) {
    DESTDIR = $$BUILD_DIR/release
    target.path = /usr/bin
    config.path = /etc/lightdm
    config.files = resources/lightdm-qt5-swallowed.conf
    desktop.path = $$_PRO_FILE_PWD_
    desktop.commands = cp -pv resources/lightdm-qt5-swallowed.desktop /usr/share/xgreeters/
    desktop.depends = install_target install_config
    settings.path = /usr/share/lightdm-qt5-swallowed
    settings.files = resources/lightdm-qt5-swallowed.conf
    settingsfix.path = /usr/bin
    settingsfix.commands = chown -R lightdm:lightdm /usr/share/lightdm-qt5-swallowed && \
							chmod -R 0755 /usr/share/lightdm-qt5-swallowed
	settingsfix.depends = install_settings
    
    INSTALLS += \
        target \
        config \
        desktop \
        settings \
        settingsfix
}
OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/moc
RCC_DIR = $$DESTDIR/qrc
UI_DIR = $$DESTDIR/ui


INCLUDEPATH +=\
    /usr/include/lightdm-qt5-3 \
    include

RESOURCES += \
    resources/resources.qrc

SOURCES += \
    src/main.cpp \
    src/loginform.cpp \
    src/abstractmainwindow.cpp \
    src/primarywindow.cpp

FORMS += \
    forms/loginform.ui

HEADERS += \
    include/loginform.hpp \
    include/abstractmainwindow.hpp \
    include/settings.hpp \
    include/primarywindow.hpp

LIBS += \
    -llightdm-qt5-3

DISTFILES += \
    resources/lightdm-qt5-swallowed.conf \
    resources/lightdm-qt5-swallowed.desktop

