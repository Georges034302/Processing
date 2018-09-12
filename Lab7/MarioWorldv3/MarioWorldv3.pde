import gifAnimation.*;

//==================Program Global Variables=================//
boolean recording = false;
boolean playing = false;
boolean ending = false;
boolean jumping = false;
boolean injump = false;
boolean attacking = false;
boolean kill = false;

Gif mario, ghost, supermario;
PImage canvas;
GifMaker maker;
float x, y, mx, my, gx, gy, w, h, scale;
int flip;
int speed;
float groundlevel;
//======================Main Setup============================//
void setup() {
  size(1200, 800);
  frameRate(60);
  smooth(4);
  setBackground();
  setGifMaker();
  setMario();
  setSuperMario();
  setGhost();
  initialize();
}

//===============Initialize Global Variables==================//
void initialize() {
  x = width/2;
  y = height/2; 
  scale = 0.8;
  speed = 10;
  gx = x-2*ghost.width;
  gy = y+ghost.height/4;
  mx = gx+2*mario.width;
  my = y+mario.height;
  groundlevel = y+mario.height;
  w = x/4;
  h = y/4;
}

//=================Set Screen Components =====================//
void setGifMaker() {
  maker = new GifMaker(this, "mariobros.gif");
  maker.setRepeat(0);
}
void setBackground() {   
  canvas = loadImage("background.png");
  canvas.resize(width, height);
}
void setMario() {  
  mario = new Gif(this, "mario.gif");
  // mario.loop();
}
void setSuperMario() {
  supermario = new Gif(this, "super.gif"); 
  supermario.loop();
}
void setGhost() {  
  ghost = new Gif(this, "ghost.gif");
  //ghost.loop();
}

//====================Set Screen Controls ======================//
void controlPanel() {
  textAlign(CENTER);
  fill(255);
  textSize(16);
  fill(#05F0FA);
  text("r: record", x, height-20);
  fill(#0CEA23);
  text("spacebar: play/pause", x, height-80);
  fill(#EAE40C);
  text("f: fly", x/15-15, height-85);
  text("a: attack", x/15, height-60);
  text("s: speed", x/15, height-35);
  text("S: slow", x/15-5, height-10); 
  fill(#E8950E);
  text("x: exist", 2*x-50, height-10);
  stroke(255);
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
}

void keyPressed() {
  if (key == 32 ) playing = !playing; //Hit spacebar to start/pause
  if (key == 'r') recording = !recording;
  if (key == 'x') ending = !ending;  
  if (key == 's') speed +=5;
  if (key == 'S') speed -=5;
  if (key == 'f') jumping = true; 
  if (key == 'a') attacking = !attacking;
}

void keyReleased() {
  if (key == 'f') jumping = false;
  //if(key == 'a') attacking = false;
}
//====================Set Animation Controls=====================//

void pause() {
  image(canvas, 0, 0);
  image(mario, mx, my, w*scale, h*scale);
  image(ghost, gx, gy, w, h);
  mario.stop();
  ghost.stop();
}

void scroll() {
  image(canvas, flip-width, 0);
  image(canvas, flip, 0);
  image(canvas, flip+width, 0);
  flip-=speed;
  if (flip < -canvas.width) flip = 0;
}

void play() {
  scroll();
  if (!injump) image(mario, mx, my, w*scale, h*scale);
  else image(supermario, mx, my, w*scale, h*scale);
  image(ghost, gx, gy, w, h);
  mario.loop();
  ghost.loop();
}

void saveGif() {
  if (recording) maker.addFrame();
}

void end() {
  if (ending) { 
    maker.finish(); 
    exit();
  }
}
void run() {
  if (playing) play();
  else pause();
}

void fly() {
  int step = 1;
  int end = 10;
  if (step < end) {
    my -= 30/step; 
    mx +=step+2;
    step++;
    injump = true;
  } else {
    jumping = false;
    injump = false;
    step = 1;
  }
}

void landing() {
  my += 5;
  injump = true;
  if (my > groundlevel) {
    my = groundlevel;
    injump = false;
  }
}
void jump() {
  if (jumping) fly();
}
void move() {
  float step = 0.5;
  gx = (gx < mx-60) ? (gx+step):(mx-60);
  gy = (gy < my-60) ? (gy+step):(gy-step);    
  step += 0.1;
}
void collide() {
  float dist = dist(mx,my,gx,gy);  
  float minDist = mario.width/4 + ghost.width/4;  
  if (dist <= minDist) kill = true;
}
void attack() {
  if (attacking) move();
}
void kill() {
  if (kill) {
    pause();
    textSize(32);
    textAlign(CENTER,CENTER);
    fill(#FA0D05);
    text("Game Over!", x, y);
  }
}
//=========================Draw Graphics==========================//
void draw() {
  background(0);   
  run();
  jump();  
  landing();
  attack();
  collide();
  kill();
  end();
  saveGif();
  controlPanel();
}
//==========================End Program===========================//
