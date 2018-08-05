// Draw a many-sided shape (polygon)
// How can we modify to easily draw it anywhere we like?

int radius = 200;

void setup() {
  size(800, 600); 
  drawPolygon(5, 200);
}

void drawPolygon(int sideCount, int radius) {
  beginShape();
  
  float angleIncrement = 360 / sideCount;
  
  for (int angle = 0; angle < 360; angle+= angleIncrement) {
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));

    x += width/2;
    y += height/2;
    vertex(x, y);
  }
  endShape(CLOSE);
}