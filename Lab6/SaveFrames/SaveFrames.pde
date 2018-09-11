import gifAnimation.*;

//==================Program Global Variables=========================//
boolean recording = false;
boolean saving = false;
boolean stopping = false;
GifMaker maker;
float x;
float y;

//======================Main Setup====================================//
void setup() {
  size(640, 360);
  smooth(4);
  x = width/2;
  y = height/2;
  setGifMaker();
}
//====================Set Screen Components ==========================//
void createAnimation() {
  for (float a = 0; a < TWO_PI; a+= 0.2) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a+sin(frameCount*0.004*a));
    stroke(255);
    line(-100, 0, 100, 0);
    popMatrix();
  }
}
void setGifMaker() {
  maker = new GifMaker(this, "star.gif");
  maker.setRepeat(0);
}

//=====================Set Screen Controls ============================//
void framesControl() {
  textAlign(CENTER);
  fill(255);
  if (!recording)  text("Press r to start recording.", x+x/2, height-24);
  else text("Press r to stop recording.", x+x/2, height-24);

  stroke(255);
  if (recording) fill(255, 0, 0);
  else noFill();  
  ellipse(x+x/2, height-48, 16, 16);
}

void gifControl() {
  textAlign(CENTER);
  fill(255);
  if (!saving) text("Press s to save as gif.", x-x/2, height-24);
  else text("Press S to stop saving gif.", x-x/2, height-24);

  stroke(255);
  if (saving) fill(255, 0, 0);
  else noFill(); 
  ellipse(x-x/2, height-48, 16, 16);
}

void keyPressed() {   
  if (key == 'r' || key == 'R') recording = !recording;
  if (key == 's' ) saving = !saving;
  if (key == 'S') stopping = !stopping;
}

//===================Set Animation Controls===========================//
void saveGif() {
  if (saving) maker.addFrame();
}
void end() {
  if (stopping) { 
    maker.finish(); 
    exit();
  }
}
void saveFrames() {
  if (recording) saveFrame("output/frames####.png");
}

//=========================Draw Graphics===============================//

void draw() {
  background(0);
  createAnimation();
  framesControl();
  gifControl();
  saveFrames();
  saveGif();
  end();
}
//==========================End Program================================//
