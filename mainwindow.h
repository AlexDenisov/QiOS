#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "QiOSDevice/qiosdevice.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void deviceOrientationChanged(QiOSDeviceOrientation orientation);
    
private:
    Ui::MainWindow *ui;
    
    QiOSDevice device;
};

#endif // MAINWINDOW_H
