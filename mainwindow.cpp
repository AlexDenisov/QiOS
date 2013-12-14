//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

static QString orientation(QiOSDeviceOrientation orientation)
{
    switch (orientation) {
    case QiOSDeviceOrientationUnknown:
        return QString("Unknown");
    case QiOSDeviceOrientationPortrait:
        return QString("Portrait");
    case QiOSDeviceOrientationPortraitUpsideDown:
        return QString("PortraitUpsideDown");
    case QiOSDeviceOrientationLandscapeLeft:
        return QString("LandscapeLeft");
    case QiOSDeviceOrientationLandscapeRight:
        return QString("LandscapeRight");
    case QiOSDeviceOrientationFaceUp:
        return QString("FaceUp");
    case QiOSDeviceOrientationFaceDown:
        return QString("FaceDown");
    }
    return QString();
}

static QString interfaceIdiom(QiOSUserInterfaceIdiom idiom)
{
    switch (idiom) {
    case QiOSUserInterfaceIdiomPad:
        return QString("Pad");
    case QiOSUserInterfaceIdiomPhone:
        return QString("Phone");
    }
    return QString();
}

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(&device, SIGNAL(deviceOrientationChanged(QiOSDeviceOrientation)), this, SLOT(deviceOrientationChanged(QiOSDeviceOrientation)));
    this->updateInformation();
}

void MainWindow::deviceOrientationChanged(QiOSDeviceOrientation orientation)
{
    this->updateInformation();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::updateInformation()
{
    this->ui->nameLabel->setText(device.name());
    this->ui->systemNameLabel->setText(device.systemName());
    this->ui->modelLabel->setText(device.model());
    this->ui->localizedModelLabel->setText(device.localizedModel());
    this->ui->systemVersionLabel->setText(device.systemVersion());

    this->ui->orientationLabel->setText(orientation(device.orientation()));
    this->ui->interfaceidiomLabel->setText(interfaceIdiom(device.userInterfaceIdiom()));
}
