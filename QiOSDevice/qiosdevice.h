#ifndef QIOSDEVICE_H
#define QIOSDEVICE_H

#include <QObject>

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

class QiOSDevice : public QObject
{
    Q_OBJECT
public:
    explicit QiOSDevice(QObject *parent = 0);

signals:

public slots:

};

#endif // QIOSDEVICE_H
