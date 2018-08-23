import gifAnimation.*;

int frames = 0;
int totalFrames = 120;
int rate = 100;

GifMaker maker;

public void setup() {
  smooth();
  size(400, 400);
  noFill();
  stroke(0);
  strokeWeight(20);
  maker = new GifMaker(this,"circle.gif",100);
  maker.setRepeat(0);
}

void saveGif(){
  maker.addFrame();
  if(mousePressed == true){
      maker.finish();
      println("Gif is recorded");
      exit();
  }
}

void draw() {
  background(255);
  float size = rate * sin(TWO_PI * frames / float(totalFrames)) + 2*rate;
  ellipse(width/2, height/2, size, size);  
  frames++;
  saveGif();
}
