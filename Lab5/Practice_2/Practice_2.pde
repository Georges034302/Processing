import gifAnimation.*;

Gif mario;
Gif ghost;
int x, y, mx, my, gx, gy;
float w, h , scale;
PImage canvas;
int pos;
int speed;
int frequency = 120;
boolean record, end;

GifMaker maker;

public void setup() {
  size(800, 800);
  frameRate(100);
  smooth(3);  
  initialize();
  setDimensions();   
}

void draw(){
  animate();
  image(mario, mx,my,w,h); 
  image(ghost, gx,gy,w*scale,h*scale);
  recordGif();
  end();
}

void keyPressed(){
   if(key=='f') speed+=5;
   if(key=='s') { if (speed >0)  speed-=5; else speed =0;}
   if(key=='r') record=!record;
   if(key=='e') end=!end;
}
