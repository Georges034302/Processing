void setup() {
  size(400, 400);
  noFill();
}

void draw() {
  background(255);
  float tightness = map(mouseX, 0, width, -5, 5);
  curveTightness(tightness); // Play with these values to see the effect
  beginShape();
  curveVertex(10,  200);
  curveVertex(10,  200);
  curveVertex(40,  100);
  curveVertex(190, 300);
  curveVertex(300, 200);
  curveVertex(300, 200);
  endShape();
}
