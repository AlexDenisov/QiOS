#include "mainwindow.h"
#include <QApplication>
#include "QiOSDevice/qiosdevice.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    
    QiOSDevice device;
    
    MainWindow w;
    w.show();

    return a.exec();
}
