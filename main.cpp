#include <QApplication>
#include <QQmlApplicationEngine>


#include <QQmlEngine>
#include <QtQml>
#include "fileio.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<FileIO>("hrw.FileIO", 1, 0, "FileIO");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
