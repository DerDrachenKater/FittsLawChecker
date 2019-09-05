import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import hrw.FileIO 1.0
import "FittsLaw.js" as FittsLaw

ApplicationWindow {
    title: qsTr("Fitts' Law")
    width: 1600
    height: 850
    visible: true
    color: "lightblue"
    FileIO {
        id:fileIO
    }
    TextField{
        id: probandennummer
        x: 800; y: 10
        width: 100
    }

    Text{
        id: text
        x:10
        y:10
        text: "Hallo Tester.
                Dies ist eine Untersuchung zu Fitts` Law.
                Zuerst geben Sie bitte eine Probandennummer nach dem folgenden Schema in das Textfeld rechts ein:

                1. und 3. Buchstabe Nachname  3. Buchstabe Geburtsort  1. und 2. Ziffer Geburtsmonat  2. Buchstabe Vorname

                Fahren Sie dann bitte mit dem Mauszeiger in das gelbe Rechteck.
                Daraufhin wird ein Knopf erscheinen.
                Diesen bitten wir Sie in normalem Arbeitstempo zu drücken.
                Danach kehren Sie bitte wieder in das gelbe Rechteck zurück und fahren fort bis zum Ende des Tests.
                Vielen Dank!"
    }

    Rectangle{
        x: 1450; y: 50
        width: 100; height:100
        color: "yellow"
        id: startRectangle

        MouseArea{

            anchors.fill: parent
            hoverEnabled: true

            onEntered:{
                createNextTest();
            }

            onExited: {
                FittsLaw.StopWatch.start();
                FittsLaw.caseActive=true;
            }
        }
    }

    Button{

        id: targetButton

        x: testCases.get(0).x;
        y: testCases.get(0).y;
        width: testCases.get(0).width;
        height: testCases.get(0).height;
        onClicked:{
            fileIO.writeToFile(FittsLaw.calculateResults(probandennummer.text,startRectangle, targetButton,                 FittsLaw.StopWatch.stop()));
            FittsLaw.caseActive=false;
        }

    }

    function createNextTest(){
        if(FittsLaw.caseActive == false){
        if (FittsLaw.getCase() < testCases.rowCount())
        {
        targetButton.x=testCases.get(FittsLaw.getCase()).x;
        targetButton.y=testCases.get(FittsLaw.getCase()).y;
        targetButton.width=testCases.get(FittsLaw.getCase()).width;
        targetButton.height=testCases.get(FittsLaw.getCase()).height;
            FittsLaw.increaseCase();
        }
        else if (FittsLaw.getCase() >= testCases.rowCount()){
            text.text= "Vielen Dank. Sie können das Fenster schließen!"
        }}



    }

    ListModel{
        id: testCases
        ListElement{name: "t1";  x: 50;   y: 700; width: 100; height: 150}
        ListElement{name: "t2";  x: 50;   y: 750; width: 25;  height: 25}
        ListElement{name: "t3";  x: 50;   y: 700; width: 80;  height: 75}
        ListElement{name: "t4";  x: 600;  y: 700; width: 150; height: 100}
        ListElement{name: "t1";  x: 650;  y: 600; width: 25;  height: 25}
        ListElement{name: "t2";  x: 700;  y: 650; width: 75;  height: 60}
        ListElement{name: "t3";  x: 1400; y: 600; width: 100; height: 150}
        ListElement{name: "t4";  x: 1500; y: 700; width: 25;  height: 25}
        ListElement{name: "t1";  x: 1450; y: 650; width: 75;  height: 80}
        ListElement{name: "t2";  x: 600;  y: 300; width: 150; height: 100}
        ListElement{name: "t3";  x: 600;  y: 400; width: 25;  height: 25}
        ListElement{name: "t4";  x: 600;  y: 350; width: 80;  height: 80}
        ListElement{name: "t1";  x: 1200; y: 200; width: 25;  height: 25}
        ListElement{name: "t2";  x: 1400; y: 200; width: 80;  height: 75}
        ListElement{name: "t3";  x: 130;  y: 250; width: 100; height: 150}
        ListElement{name: "t4";  x: 800;  y: 50;  width: 25;  height: 25}
        ListElement{name: "t1";  x: 1000; y: 100; width: 80;  height: 75}
        ListElement{name: "t2";  x: 1000; y: 200; width: 150; height: 100}
        ListElement{name: "t3";  x: 10;   y: 10;  width: 25;  height: 25}
        ListElement{name: "t4";  x: 10;   y: 10;  width: 150; height: 100}
    }

}
