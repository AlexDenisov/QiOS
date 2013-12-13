#-------------------------------------------------
#
# Project created by QtCreator 2013-12-13T23:21:02
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QiOS
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    QiOSDevice/qiosdevice.cpp

HEADERS  += mainwindow.h \
    QiOSDevice/qiosdevice.h

FORMS    += mainwindow.ui
