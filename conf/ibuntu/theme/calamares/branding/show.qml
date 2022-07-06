import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    Timer {
        interval: 30000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }
    Slide {
        Image {
            anchors.centerIn: parent
            id: image1
            x: 0
            y: 0
            width: 806
            height: 454
            source: "slide1.png"
        }
        
    }    
        
   
    Slide {
        Image {
            anchors.centerIn: parent
            id: image2
            x: 0
            y: 0
            width: 801
            height: 435
            fillMode: Image.PreserveAspectFit
            source: "slide2.png"
        }
    }
    Slide {
        Image {
            anchors.centerIn: parent
            id: image3
            x: 0
            y: 0
            width: 795
            height: 501
            fillMode: Image.PreserveAspectFit
            source: "slide3.png"
        }
    }
    Slide {
        Image {
            anchors.centerIn: parent
            id: image4
            x: 0
            y: 0
            width: 797
            height: 376
            source: "slide4.png"
        }
    }
    Slide {
        Image {
            anchors.centerIn: parent
            id: image5
            x: 0
            y: 0
            width: 816
            height: 460
            source: "slide5.png"
        }
    }
    Slide {
        Image {
            anchors.centerIn: parent
            id: image6
            x: 0
            y: 0
            width: 800
            height: 640
            source: "slide6.png"
        }
    }
}
