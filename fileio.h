#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class FileIO: public QObject
{
     Q_OBJECT
public:
    ~FileIO();
    explicit FileIO(QObject *parent = 0);
    Q_INVOKABLE void writeToFile(const QString &inputText);
};

#endif // FILEIO_H

