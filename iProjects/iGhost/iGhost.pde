float xpos;
float ypos;
float drag = 30.0;
Animation animation1, animation2;
void setup() {
  size(640, 360);
  background(255, 204, 0);
  frameRate(30);
  animation1 = new Animation("ghost_1", 10);
  animation2 = new Animation("ghost_2", 10);
  
  ypos = height * 0.25;
}

void draw() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;

  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    background(153, 153, 0);
    animation2.display(xpos-animation1.getWidth()/2, ypos);
  } 
}

void mouseMoved(){
    background(153, 153, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
}


// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + ".gif";
      images[i] = loadImage(filename);
      images[i].resize(0,50);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
