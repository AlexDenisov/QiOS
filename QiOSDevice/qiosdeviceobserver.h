#ifndef QIOSDEVICEOBSERVER_H
#define QIOSDEVICEOBSERVER_H

#import <Foundation/Foundation.h>

class QiOSDevice;

@interface QiOSDeviceObserver : NSObject

- (void)setNotificationsHandler:(QiOSDevice *)handler;

- (void)subscribeForDeviceNotifications;
- (void)unsubscribeFromDeviceNotifications;

@end

#endif // QIOSDEVICEOBSERVER_H
