// Simple map() example
void setup() {
  size(640, 480);
}

void draw() {
  background(0);
  textSize(40);
  text("Actual mouseX: " + mouseX, 20, height/3);
  
  float scaledMouseX = map(mouseX, 0, width - 1, 0, 1);
  
  text("Scaled mouseX = " + scaledMouseX, 20, height/1.5);
}