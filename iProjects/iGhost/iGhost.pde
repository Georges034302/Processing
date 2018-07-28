float xpos;
float ypos;

Animation ghost1, ghost2, mario1, mario2;
void setup() {
  size(640, 360);
  background(255, 204, 0);
  frameRate(30);
  ghost1 = new Animation("ghost_1", 10);
  ghost2 = new Animation("ghost_2", 10);
  mario1 = new Animation("mario_3", 10);
  mario2 = new Animation("mario_2", 10); 
}

void draw() { 
  xpos = lerp(xpos, mouseX, 0.05);
  ypos = lerp(ypos, mouseY, 0.05);
  //xpos = xpos + dx/drag;

  // Display the sprite at the position xpos, ypos
  if (mousePressed) {
    background(153, 153, 0);
    ghost2.display(xpos, ypos);
    mario2.display(xpos,ypos+50);
  } 
}

void mouseMoved(){
    background(153, 153, 0);   
    ghost1.display(xpos, ypos);
    mario1.display(xpos+80, ypos+80);
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
      String filename = imagePrefix + ".gif";
      images[i] = loadImage(filename);
      images[i].resize(0,70);
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
