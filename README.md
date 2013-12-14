### QiOS - set of Qt wrappers for native iOS stuff.

##### QiOSDevice

This wrapper provides all functionality provided by `UIDevice` class.

###### Device orientation

You can simply determine device orientation

```cpp
QiOSDevice device;
qDebug() device.orientation();
```

or observe device orientation changing

```cpp
QiOSDevice device;
connect(&device, SIGNAL(deviceOrientationChanged(QiOSDeviceOrientation)), this, SLOT(deviceOrientationChanged(QiOSDeviceOrientation)));
```

Also you're able to start/stop generating such notifications

```cpp
QiOSDevice device;
device.beginGeneratingDeviceOrientationNotifications();
///
device.endGeneratingDeviceOrientationNotifications();
```
**_Note:_** on iOS `UIDevice` presented as a singleton, so calling `beginGeneratingDeviceOrientationNotifications` on particular `QiOSDevice` instance will affect this changes for all another instances.

###### User interface idiom

There are two options: `QiOSUserInterfaceIdiomPhone` and `QiOSUserInterfaceIdiomPad`

```cpp
QiOSDevice device;
qDebug() << device.userInterfaceIdiom();
```

###### Metadata

You're able to retrieve useful metadata about iOS version or a system name.

```cpp
QiOSDevice device;
qDebug() << device.name();
qDebug() << device.systemName();
qDebug() << device.systemVersion();
qDebug() << device.model();
qDebug() << device.localizedModel();
```

### Contributing

Contributions are welcome.

### License

Published under MIT license.

See `LICENSE` file for details.