import QtQuick 2.0
import QtQuick.Particles 2.0
import Qt.labs.folderlistmodel 2.1

Rectangle {
    id: bg
    width: 1920         //360
    height: 1080            //360
    color: "black"

    ParticleSystem {
        id: particleSys
    }

    /*Emitter {     //1
        anchors.fill: parent
        system: particleSys
        ImageParticle {
            id:  blip
            anchors.fill: parent
            system: particleSys
            source: "images/blueBlip.png"
            clip: true
        }
        lifeSpan: 6000
    }*/

    Emitter{
        id: particles
        anchors.centerIn: parent
        height: 1; width: 1
        system: particleSys
        emitRate: 30
        lifeSpan: 4000
        lifeSpanVariation: 500
        maximumEmitted: 1000
        size: 5
        endSize: 200           //50
        /*velocity: AngleDirection{     //2
          angle: 360       //90
          //magnitude: 200
          magnitudeVariation: 300
          angleVariation: 360
        }*/
        /*acceleration: AngleDirection{
            angle: 360         //90
            magnitude: 15         //25
        }*/

        /*velocity: PointDirection{       //3
            x:0; y:0
            xVariation: 360
            yVariation: 360
        }*/

        velocity: TargetDirection{      //4
            targetX: 100; targetY: 100
            targetVariation: 360
            magnitude: 250
        }
        /*Timer {       //Utilizando burst()
            interval: 500; running: true; repeat: true
            onTriggered: particles.burst(particles.emitRate)
        }*/
    }         

    property var picturesList: [
        "images/Image1.png", "images/Image2.png", "images/Image3.png", "images/Image4.png", "images/Image5.png", "images/Image6.png", "images/Image7.png", "images/Image8.png", "images/Image9.png", "images/Image10.png",
        "images/Image11.png", "images/Image12.png", "images/Image13.png", "images/Image14.png", "images/Image15.png", "images/Image16.png", "images/Image17.png", "images/Image18.png", "images/Image19.png", "images/Image20.png"
    ]

    function getImage(arr){
        var flag = "";
        for(var i = 0; i < arr.length ; i++){
            //var link = arr.find(i[arr])          //checar find()
            //var count = arr.length-1
            //console.log("Count: " + count )

            flag = arr[i];
            console.log("Imagen: " + arr[i] + " flag: " + flag )
        }
//        var i = arr.find(index)
        return flag;
    }

    //picturesList[picturesList.length]="index"     //
    //picturesList[picturesList.length]="images/Image1.png"

    ImageParticle{
        //source: picturesList[picturesList.length]="images/Image3.png"            //"images/blueBlip.png"
        property var link: getImage(picturesList)
        source: link
        system: particleSys
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(getImage(picturesList))
        }
    }

    /*Repeater {
        id: rain        

        delegate: ImageParticle{
            //source: rain.picturesList[index%rain.picturesList.length]=""                    //"images/blueBlip.png"
            property var link: getImage(picturesList)
            source:  link
            system: particleSys
        }        
    }*/
} //Fin Reactangle
