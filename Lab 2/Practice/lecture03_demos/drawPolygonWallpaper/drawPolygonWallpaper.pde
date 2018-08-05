// Draw a many-sided shape (polygon) using translate() and rotate()
// How can we modify to make polygon wallpaper?

int radius = 200;
int rotationAngle = 0;

void setup() {
  size(800, 600); 
  noFill();
  
  for(int i = 0; i < 500; i++) {
    pushMatrix();
    translate(random(width), random(height));
    drawPolygon(random(3,12), random(20, 60));
    popMatrix();
  }
}

void drawPolygon(float sideCount, float radius) {
  beginShape();
  
  float angleIncrement = 360 / sideCount;
  
  for (int angle = 0; angle < 360; angle+= angleIncrement) {
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));

    vertex(x, y);
  }
  endShape(CLOSE);
}