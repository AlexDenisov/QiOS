//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#ifndef QIOSDEVICE_H
#define QIOSDEVICE_H

#include <QObject>
#include <QString>

class QiOSDevicePrivate;

enum QiOSDeviceOrientation
{
    QiOSDeviceOrientationUnknown,
    QiOSDeviceOrientationPortrait,
    QiOSDeviceOrientationPortraitUpsideDown,
    QiOSDeviceOrientationLandscapeLeft,
    QiOSDeviceOrientationLandscapeRight,
    QiOSDeviceOrientationFaceUp,
    QiOSDeviceOrientationFaceDown
};

enum QiOSUserInterfaceIdiom {
    QiOSUserInterfaceIdiomPhone,
    QiOSUserInterfaceIdiomPad
};

class QiOSDevice : public QObject
{
    Q_OBJECT
public:
    explicit QiOSDevice(QObject *parent = 0);
    ~QiOSDevice();

    QiOSDeviceOrientation orientation() const;
    
    bool isGeneratingDeviceOrientationNotifications() const;
    void beginGeneratingDeviceOrientationNotifications();
    void endGeneratingDeviceOrientationNotifications();
    
    bool isMultitaskingSupported() const;
    
    QString name() const;
    QString systemName() const;
    QString systemVersion() const;
    QString model() const;
    QString localizedModel() const;
    
    QiOSUserInterfaceIdiom userInterfaceIdiom() const;
    
signals:
    void deviceOrientationChanged(QiOSDeviceOrientation orientation);
    
protected:
    QiOSDevicePrivate *const d_ptr;

private:
    Q_DECLARE_PRIVATE(QiOSDevice);
};

#endif // QIOSDEVICE_H
