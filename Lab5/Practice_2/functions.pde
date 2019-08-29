
void initialize() {
  canvas=loadImage("background.png");
  canvas.resize(width, height);  
  mario = new Gif(this, "mario.gif");  
  mario.loop();
  ghost = new Gif(this, "ghost.gif");  
  ghost.loop();
  maker = new GifMaker(this, "mariobros.gif", frequency);
  maker.setRepeat(0);
}
void setDimensions() {
  x = width/2;
  y = height/2;
  gx = x-ghost.width;
  gy = y-ghost.height;    
  mx = gx+mario.width;
  my = y+mario.height/2;
  w = x/2;
  h = y/2;
  scale = 0.8;  
  speed = 10;    
  println("Welcome to Mario World ");
}

void animate() {
  image(canvas, pos, 0);
  image(canvas, pos+canvas.width, 0);
  pos-=speed;
  if (pos < -canvas.width) pos=0;
}

void recordGif() {
  if (record)  maker.addFrame();
}

void end() {

  if (end) { 
    maker.finish(); 
    exit();
  }
}
