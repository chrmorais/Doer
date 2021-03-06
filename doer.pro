QT          += core gui widgets

TEMPLATE     = app

SRC_DIR      = src
INC_DIR      = inc
FORMS_DIR    = ui

OBJECTS_DIR  = .objs
MOC_DIR      = .mocs
UI_DIR       = .uis
RCC_DIR      = .qrcs

DESTDIR      = bin
TARGET       = doer

INCLUDEPATH += $${INC_DIR}

SOURCES     += src/main.cpp \
               src/mainwindow.cpp \
               src/traymenu.cpp \
               src/runguard.cpp

HEADERS     += inc/mainwindow.h \
               inc/traymenu.h \
               inc/runguard.h

FORMS       += ui/mainwindow.ui

RESOURCES    = res/resources.qrc

OTHER_FILES += dist/$${TARGET}.desktop \
               res/images/background.png \
               res/images/$${TARGET}.svg \
               res/images/tray.png \
               res/styles/default.qss

QMAKE_CLEAN += -r $${DESTDIR}/$${TARGET}

unix:!mac {
    isEmpty(PREFIX) {
        PREFIX = /usr
    }
    BINDIR = $${PREFIX}/bin
    DATADIR =$${PREFIX}/share

    target.path = $${BINDIR}

    INSTALLS += target

    desktop.path = $${DATADIR}/applications
    eval(desktop.files += dist/$${TARGET}.desktop)

    INSTALLS += desktop

    icon.path = $${DATADIR}/icons/hicolor/scalable/apps
    eval(icon.files += res/images/$${TARGET}.svg)

    INSTALLS += icon
}
