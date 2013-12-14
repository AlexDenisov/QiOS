#ifndef QIOSDEVICE_H
#define QIOSDEVICE_H

#include <QObject>

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
    
signals:
    void deviceOrientationChanged(QiOSDeviceOrientation orientation);
    
protected:
    QiOSDevicePrivate *const d_ptr;

private:
    Q_DECLARE_PRIVATE(QiOSDevice);
};

#endif // QIOSDEVICE_H
