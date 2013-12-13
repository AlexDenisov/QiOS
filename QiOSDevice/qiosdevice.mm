#include <UIKit/UIKit.h>

#include "qiosdevice.h"

class QiOSDevicePrivate : public QObject
{
    Q_DECLARE_PUBLIC(QiOSDevice);
public:
    explicit QiOSDevicePrivate(QObject *parent = 0);

private:
    id _observer;
    QiOSDevice *q_ptr;
};

QiOSDevice::QiOSDevice(QObject *parent) :
    QObject(parent),
    d_ptr(new QiOSDevicePrivate)
{
    Q_D(QiOSDevice);
    d->q_ptr = this;
}

QiOSDevice::~QiOSDevice()
{
    delete d_ptr;
}

#pragma mark - QiOSDevicePrivate

QiOSDevicePrivate::QiOSDevicePrivate(QObject *parent) :
    QObject(parent)
{
}
