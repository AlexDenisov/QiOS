//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#include <UIKit/UIKit.h>

#include "qiosdevice.h"
#include "qiosdeviceobserver.h"

class QiOSDevicePrivate : public QObject
{
    Q_DECLARE_PUBLIC(QiOSDevice);
public:
    explicit QiOSDevicePrivate(QObject *parent = 0);
    ~QiOSDevicePrivate();

private:
    QiOSDeviceObserver *_observer;
    QiOSDevice *q_ptr;
};

QiOSDevice::QiOSDevice(QObject *parent) :
    QObject(parent),
    d_ptr(new QiOSDevicePrivate)
{
    Q_D(QiOSDevice);
    d->q_ptr = this;
    [d->_observer setNotificationsHandler:this];
}

QiOSDevice::~QiOSDevice()
{
    delete d_ptr;
}

QiOSDeviceOrientation QiOSDevice::orientation() const
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    switch (orientation) {
        case UIDeviceOrientationUnknown:
            return QiOSDeviceOrientationUnknown;
        case UIDeviceOrientationPortrait:
            return QiOSDeviceOrientationPortrait;
        case UIDeviceOrientationPortraitUpsideDown:
            return QiOSDeviceOrientationPortraitUpsideDown;
        case UIDeviceOrientationLandscapeLeft:
            return QiOSDeviceOrientationLandscapeLeft;
        case UIDeviceOrientationLandscapeRight:
            return QiOSDeviceOrientationLandscapeRight;
        case UIDeviceOrientationFaceUp:
            return QiOSDeviceOrientationFaceUp;
        case UIDeviceOrientationFaceDown:
            return QiOSDeviceOrientationFaceDown;
            
        default:
            return QiOSDeviceOrientationUnknown;
    }
}

bool QiOSDevice::isGeneratingDeviceOrientationNotifications() const
{
    return [[UIDevice currentDevice] isGeneratingDeviceOrientationNotifications];
}

void QiOSDevice::beginGeneratingDeviceOrientationNotifications()
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}

void QiOSDevice::endGeneratingDeviceOrientationNotifications()
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

#pragma mark - QiOSDevicePrivate

QiOSDevicePrivate::QiOSDevicePrivate(QObject *parent) :
    QObject(parent),
    _observer([QiOSDeviceObserver new])
{
}

QiOSDevicePrivate::~QiOSDevicePrivate()
{
    [_observer release];
    _observer = nil;
}
