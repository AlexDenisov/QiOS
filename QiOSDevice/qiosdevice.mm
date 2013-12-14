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
    
    UIDevice *device;
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
    UIDeviceOrientation orientation = [d_ptr->device orientation];
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
    return [d_ptr->device isGeneratingDeviceOrientationNotifications];
}

void QiOSDevice::beginGeneratingDeviceOrientationNotifications()
{
    [d_ptr->device beginGeneratingDeviceOrientationNotifications];
}

void QiOSDevice::endGeneratingDeviceOrientationNotifications()
{
    [d_ptr->device endGeneratingDeviceOrientationNotifications];
}

bool QiOSDevice::isMultitaskingSupported() const
{
    return [d_ptr->device isMultitaskingSupported];
}

QString QiOSDevice::name() const
{
    return QString([[d_ptr->device name] UTF8String]);
}

QString QiOSDevice::systemName() const
{
    return QString([[d_ptr->device systemName] UTF8String]);
}

QString QiOSDevice::systemVersion() const
{
    return QString([[d_ptr->device systemVersion] UTF8String]);
}

QString QiOSDevice::model() const
{
    return QString([[d_ptr->device model] UTF8String]);
}

QString QiOSDevice::localizedModel() const
{
    return QString([[d_ptr->device localizedModel] UTF8String]);
}

QiOSUserInterfaceIdiom QiOSDevice::userInterfaceIdiom() const
{
    switch ([d_ptr->device userInterfaceIdiom]) {
        case UIUserInterfaceIdiomPad:
            return QiOSUserInterfaceIdiomPad;
        case UIUserInterfaceIdiomPhone:
            return QiOSUserInterfaceIdiomPhone;
            
        default:
            return QiOSUserInterfaceIdiomPhone;
    }
}

#pragma mark - QiOSDevicePrivate

QiOSDevicePrivate::QiOSDevicePrivate(QObject *parent) :
    QObject(parent),
    _observer([QiOSDeviceObserver new]),
    device([UIDevice currentDevice])
{
}

QiOSDevicePrivate::~QiOSDevicePrivate()
{
    [_observer release];
    _observer = nil;
}
