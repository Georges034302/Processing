//===================================Initialize Game Variables===============================//
//setup canvas components
void initialize() {
  canvas=loadImage("background.png");
  canvas.resize(width,height);
  mario = new Gif(this,"mario.gif");  
  ghost = new Gif(this,"ghost.gif");  
  supermario = new Gif(this, "super.gif"); 
  supermario.loop();
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
  if(injump) image(supermario,mx,my,w,h);
  else image(mario,mx,my,w,h);
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
  if(playing) {
    animate();
    animateComponents();
  }else{
    pause();    
  }
}

void pause(){
  image(canvas,0,0);
  image(mario,mx,my,w,h);
  image(ghost,gx,gy,w,h);
  mario.stop();
  ghost.stop();
}

//===================================Flying/Landing Methods================================//
void fly(){
  if(flying) jumping();
}

void jumping(){
  int step=1;
  int end=10;
  if(step<end){
    my-=20/step;
    mx+=step;
    step++;
    injump=true;
  }else{
    flying=false;
    injump=false;
    step=1;
  }
}

void land(){
  my+=5;
  injump=true;
  if(my>groundlevel){
    my=groundlevel;
    injump=false;
  }
}

//===================================Attack/Collide Methods================================//

void attack(){
  if(attacking) {
    move();
    
  }
}

void move(){
  float step=0.5;
  gx = (gx < mx-60) ? (gx+step):(mx-50);
  gy = (gy < my-60) ? (gy+2*step):(gy-step); 
  step+=2;
}

void collide(){
  float dist = dist(mx,my,gx,gy);
  float mindist = w/2+5;
  if(dist <= mindist) kill=true;
  println(dist+" -> "+mindist);
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
