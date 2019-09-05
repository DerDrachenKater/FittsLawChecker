#include "fileio.h"
#include <QFile>
#include <QTextStream>
#include <QMessageLogger>

FileIO::FileIO(QObject *parent) :
    QObject(parent)
{}

FileIO::~FileIO()
{}

void FileIO::writeToFile(const QString &inputText)
{
    QString filename = "Results.csv";
    QFile file( filename );
    if ( file.open(QIODevice::ReadWrite | QIODevice::Append | QIODevice::Text ) )
    {
        QTextStream stream( &file );
        stream << inputText << endl;
    }
    return;
}

