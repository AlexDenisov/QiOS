//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(&device, SIGNAL(deviceOrientationChanged(QiOSDeviceOrientation)), this, SLOT(deviceOrientationChanged(QiOSDeviceOrientation)));
}

void MainWindow::deviceOrientationChanged(QiOSDeviceOrientation orientation)
{
    qDebug() << orientation;
}

MainWindow::~MainWindow()
{
    delete ui;
}
