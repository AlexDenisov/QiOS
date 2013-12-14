//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    
    MainWindow w;
    w.show();

    return a.exec();
}
