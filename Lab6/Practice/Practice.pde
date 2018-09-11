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

//====================Set Screen Controls ======================//
void controlPanel() {
    //TASK2: Add screen commands to control animations 
}

void keyPressed() {
   //TASK 3: Enable screen key-commands to control animations
}

//====================Set Animation Controls=====================//
void scroll(){
   image(canvas,flip,0);
   image(canvas,flip+width,0);
   flip-=speed;
   if(flip < -canvas.width) flip = 0;
}
void play() {
  scroll();
  image(mario, mx, my, w*scale, h*scale);
  image(ghost,gx,gy,w,h);
  controlPanel();  
}

void saveGif() {
  //Task 4: enable saving gif action 
}

void end(){
    //Task 5: enable gif maker finish and exit
}
void run(){
  //TASK 1: Make the game start 
}

//=========================Draw Graphics==========================//
void draw() {
  background(0);    
  run();
  end();
  saveGif();
}
//==========================End Program===========================//
