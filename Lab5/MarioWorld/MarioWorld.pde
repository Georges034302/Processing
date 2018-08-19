import gifAnimation.*;

Gif mario;
Gif ghost;
int x, y, mx, my, gx, gy;
float w, h , scale;
PImage canvas;
int speed;
int frameFrequency = 150;

GifMaker maker;

public void setup() {
  size(800, 800);
  frameRate(100);
  smooth(3);
  canvas=loadImage("background.png");
  canvas.resize(width,height);  
  mario = new Gif(this, "mario_run.gif");
  mario.loop();
  ghost = new Gif(this, "ghost_sleep.gif"); 
  ghost.loop();
  setDimensions();  
  setExport();
}

void draw() { 
  scroll();
  move(mario, mx,my,w,h);
  move(ghost, gx,gy,w*scale,h*scale);  
  export();
}

void scroll(){
  image(canvas,speed,0);
  image(canvas, speed+canvas.width, 0);
  speed-=10;
  if( speed < -canvas.width) speed =0;
}

void move(Gif gif, int xpos, int ypos, float w, float h){    
    image(gif, xpos, ypos,w,h);
}

void setExport(){    
    maker = new GifMaker(this,"mariobros.gif",frameFrequency);
    maker.setRepeat(0);
}

void export(){        
    maker.addFrame();    
    if(mousePressed == true){
        print("Mario world GIF has been created");
        exit();
    }
}

void setDimensions(){
    x = width/2;
    y = height/2;
    gx = x-ghost.width;
    gy = y-ghost.height;    
    mx = gx+mario.width;
    my = y+mario.width/2;
    w = x/2;
    h = y/2;
    scale = 0.8;
    println("Welcome to Mario World ");
}
