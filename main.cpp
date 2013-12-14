//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

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
