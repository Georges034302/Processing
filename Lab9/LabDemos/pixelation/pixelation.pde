/*------------------------------------------------------------
Copyright (c) 2013, friends of Ed (An Apress Company)
All rights reserved.

The code provided here accompanies the book:

Processing: Creative Coding and Generative Art in Processing 2
By Ira Greenberg, Dianna Xu, and Deepak Kumar
friends of Ed (An APress Company), 2013
ISBN-13 978-1430244646
Please refer to the associated README for a full disclaimer.
------------------------------------------------------------*/
// pixelation.pde, chapter 9
// Creates a pixelation effect on an image

PImage img;

void setup() {
  img = loadImage("Lenna.png"); //<>//
  surface.setSize(img.width, img.height); 
  noLoop();
}

void draw() {
  int resolution = 50;
  int xInc = width/resolution;
  int yInc = height/resolution;

  for (int y=0; y<img.height; y+=yInc) {
    for (int x=0; x<img.width; x+=xInc) {
      fill(img.get(x, y));
      rect(x, y, xInc, yInc);
      // variation with line()
      //strokeWeight(3);
      //stroke(img.get(x, y));
      //line(x, y, x+10, y+10);
    }
  }
}