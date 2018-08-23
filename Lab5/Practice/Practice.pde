import gifAnimation.*;

Gif mario;
Gif ghost;
float x, y, mx, my, gx, gy, w, h, scale;
int speed = 20;
int step =0;
PImage canvas;

void setup(){
   size(800, 800);
   smooth(4);
   canvas = loadImage("background.png");
   canvas.resize(width,height);
   mario = new Gif(this,"mario.gif");
   mario.loop();
   ghost = new Gif(this, "ghost.gif");
   ghost.loop();
   initialize();
}

void draw(){
    //background(200);
    scroll();
    image(ghost,gx,gx,w,h);
    image(mario,mx,my,w*scale,h*scale);
}

void scroll(){
    image(canvas,step,0);
    image(canvas,step+canvas.width,0);
    step -= speed;
    if(step < -canvas.width) step = 0;
}

void initialize(){
  x = width/2;
  y = height/2;
  
  gx = x-ghost.width;
  gy = y-ghost.height;
  
  mx = gx+mario.width;
  my = y+mario.height/2;
  
  w = x/2;
  h = y/2;
  
  scale = 0.8;
}
