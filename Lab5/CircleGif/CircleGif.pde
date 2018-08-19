import gifAnimation.*;

GifMaker gifExport;
int frames = 0;
int totalFrames = 120;
int rate = 100;
public void setup() {
  smooth();
  size(400, 400);

  gifExport = new GifMaker(this, "export.gif", rate);
  gifExport.setRepeat(0); // make it an "endless" animation

  noFill();
  stroke(0);
  strokeWeight(20);
}

void draw() {
  background(255);

  float size = rate * sin(TWO_PI * frames / float(totalFrames)) + 2*rate;
  ellipse(width/2, height/2, size, size);
  export();
}

void mousePressed() {
    gifExport.finish();   
    print("Gif has been created");
    exit();
}

void export() {
    gifExport.setDelay(20);
    gifExport.addFrame();
    frames++; 
  }
