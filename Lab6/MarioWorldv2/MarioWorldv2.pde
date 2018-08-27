import gifAnimation.*;

//==================Program Global Variables=================//
boolean recording = false;
boolean playing = false;
boolean stopping = false;
boolean moving = false;
Gif mario, ghost;
PImage canvas;
GifMaker maker;
float x, y, mx, my, gx, gy, w, h, scale;
int flip;
int speed;

//======================Main Setup============================//
void setup() {
  size(600, 600);
  frameRate(60);
  smooth(4);
  setBackground();
  setGifMaker();
  setMario();
  setGhost();
  initialize();
}

//===============Initialize Global Variables==================//
void initialize() {
  x = width/2;
  y = height/2; 
  scale = 0.8;
  speed = 10;
  gx = x-ghost.width;
  gy = y-ghost.height;
  mx = gx+mario.width;
  my = y+mario.height/2;
  w = x/2;
  h = y/2;  
}

//=================Set Screen Components =====================//
void setGifMaker(){
    maker = new GifMaker(this,"mariobros.gif");
    maker.setRepeat(0);
}
void setBackground() {   
  canvas = loadImage("background.png");
  canvas.resize(width,height);
}
void setMario() {  
  mario = new Gif(this, "mario.gif");
  mario.loop();  
}
void setGhost() {  
  ghost = new Gif(this, "ghost.gif");
  ghost.loop();  
}

void scroll(){
   image(canvas,flip,0);
   image(canvas,flip+width,0);
   flip-=speed;
   if(flip < -canvas.width) flip = 0;
}

//====================Set Screen Controls ======================//
void controlPanel() {
  textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Press r to start recording.", x, height-24);
  } else {
    text("Press R to stop recording.", x, height-24);
  }
  if (!playing) {
    text("Press p to play the game.", x, height-24);
  } else {
    text("Press P to pause the game.", x+5, height-8);
  }
  text("Press s to speed.",x/5,height-24);
  text("Press S to slow.",x/5-5,height-8);
  text("Press x to exist.",2*x-50,height-8);
  stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
}

void keyPressed() {
  if (key == 'r' || key == 'R') recording = !recording;
  if(key == 'p') playing = true;
  if(key == 'P') playing = !playing; 
  if(key == 'X' ||  key == 'x') stopping = !stopping;  
  if(key == 's') speed +=5;
  if(key == 'S') speed -=5;
}

//====================Set Animation Controls=====================//
void play() {
  scroll();
  image(mario, mx, my, w*scale, h*scale);
  image(ghost,gx,gy,w,h);
  controlPanel();  
}

void saveGif() {
  if (recording) maker.addFrame();  
}

void end(){
    if(stopping){ maker.finish(); exit();}
}
void run(){
  if(playing) play();
}

//=========================Draw Graphics==========================//
void draw() {
  background(0);    
  run();
  end();
  saveGif();
}
//==========================End Program===========================//
