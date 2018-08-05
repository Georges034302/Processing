// Draw a many-sided shape (polygon) using translate() and rotate()
// How can we modify to make polygon wallpaper?

int radius = 200;
int rotationAngle = 0;

void setup() {
  size(800, 600); 
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(radians(rotationAngle));
  drawPolygon(5, 200);
  rotationAngle++;
}

void drawPolygon(int sideCount, int radius) {
  beginShape();
  
  float angleIncrement = 360 / sideCount;
  
  for (int angle = 0; angle < 360; angle+= angleIncrement) {
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));

    vertex(x, y);
  }
  endShape(CLOSE);
}