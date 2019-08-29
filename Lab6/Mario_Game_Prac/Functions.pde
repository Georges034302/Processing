//===================================Initialize Game Variables===============================//
//setup canvas components
void initialize() {
  canvas=loadImage("background.png");
  canvas.resize(width,height);
  mario = new Gif(this,"mario.gif");  
  ghost = new Gif(this,"ghost.gif");  
  maker = new GifMaker(this,"mariobos.gif");
  maker.setRepeat(0); //repeat gif indefinetly
}

//setup screen variables
void setDimensions() {
  x= width/2;
  y= height/2;
  mx=x-mario.width;
  my=y+mario.height;
  gx=x-2*ghost.width;
  gy=y-ghost.height;
  w=x/4;
  h=y/4;
  groundlevel=y+mario.height;
  speed = 10;
}

//===================================Game Animation Methods===============================//
//Animate screen
void animate() {
  image(canvas, pos, 0);
  image(canvas, pos+width, 0);
  pos-=speed;
  if (pos < -canvas.width) pos=0;
}

//animate components on the canvas
void animateComponents(){
  image(mario,mx,my,w,h);
  image(ghost,gx,gy,w,h);
  mario.loop();
  ghost.loop();
}

//===================================Gif Recording Methods================================//
//record a gif into a file
void recordGif(){
  if(recording) maker.addFrame();
}

//end recording and exit the game
void end(){
  if(ending) {maker.finish(); exit();}  
}

//===================================Pause/Play Methods===================================//
void play(){
  
}

void pause(){
  
}

//===================================Flying/Landing Methods================================//
void fly(){
  
}

void jumping(){
  
}

void landing(){
  
}

//===================================Attack/Collide Methods================================//

void attack(){
  
}

void move(){
  
}

void collide(){
  
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

//==========================================================================================//
