// Draw a many-sided shape (polygon) using translate()
// How can we modify to make it spin?

int radius = 200;

void setup() {
  size(800, 600); 
  translate(width/2, height/2);
  drawPolygon(5, 200);
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