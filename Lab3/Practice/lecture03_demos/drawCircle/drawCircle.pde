// Draw a circle the lo-tech way
// What do we need to change to draw a triangle instead?  A square?

int radius = 200;

size(800, 600);

beginShape();
for (int angle = 0; angle < 360; angle++) {
  float x = radius * cos(radians(angle));
  float y = radius * sin(radians(angle));

  x += width/2;
  y += height/2;
  vertex(x, y);
}
endShape(CLOSE);