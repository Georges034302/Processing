import gifAnimation.*;

//=======================================Game Global Variables=====================================//
float x, y; //main screen coordinates
float w,h; //mario and ghost width and height
float mx,my,gx,gy; // mario and ghost coordinates
float groundlevel; //determines the groud level where mario runs and should land after a flight
PImage canvas; //used to add png image on top of the main screen
int pos; //canvas position
int speed; //canvas animation speed
boolean recording; //used to control gif recording
boolean ending; //used to end gif recording and exit game
boolean playing; //used to control mario and ghost 
boolean flying; //used to control mario flying above ground level
boolean injump; //used to determine whether mario is flying or not
boolean attacking; //used to control ghost attack on mario
boolean kill; //used to determine when ghost kills mario

Gif mario;
Gif ghost;
Gif supermario;

GifMaker maker;

void setup(){
  size(1200,800);  
  frameRate(60);
  initialize();
  setDimensions();
}

void draw(){  
  animate();
  animateComponents();
  recordGif();
  end();
  controlPanel();
}

void keyPressed() {
  if (key == 32 ) playing = !playing; //Hit spacebar to start/pause the game
  if (key == 'r') recording = !recording;
  if (key == 'x') ending = !ending;  
  if (key == 's') speed +=5;
  if (key == 'S') {speed = (speed > 0) ? speed-5 :0 ;}
  if (key == 'f') flying = true; 
  if (key == 'a') attacking = !attacking;
}

void keyReleased() {
  if (key == 'f') flying = false;
}

void controlPanel() {
  int e=15;
  textAlign(CENTER);
  fill(255);
  textSize(e);
  fill(#05F0FA);
  text("r: record", x, height-e);
  fill(#0CEA23);
  text("spacebar: play/pause", x, height-5*e);
  fill(#EAE40C);
  text("f: fly", x/e-e, height-4*e);
  text("a: attack", x/e, height-3*e);
  text("s: speed", x/e, height-2*e);
  text("S: slow", x/e-5, height-e); 
  fill(#E8950E);
  text("x: exist", 2*x-50, height-e);
  stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(x, height-3*e, e, e);
}
