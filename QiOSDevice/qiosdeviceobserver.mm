//
//  QiOS
//
//  Created by AlexDenisov on 12/14/13.
//  Copyright (c) 2013 AlexDenisov. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "qiosdeviceobserver.h"
#include "qiosdevice.h"

@implementation QiOSDeviceObserver
{
    QiOSDevice *_handler;
}

- (instancetype)init
{
    self = [super init];
    [self subscribeForDeviceNotifications];
    
    return self;
}

- (void)dealloc
{
    [self unsubscribeFromDeviceNotifications];
    [super dealloc];
}

- (void)setNotificationsHandler:(QiOSDevice *)handler
{
    _handler = handler;
}

- (void)subscribeForDeviceNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChangeNotification:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)unsubscribeFromDeviceNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
}

- (void)deviceOrientationDidChangeNotification:(__unused NSNotification *)notification
{
    emit _handler->deviceOrientationChanged(_handler->orientation());
}

@end
