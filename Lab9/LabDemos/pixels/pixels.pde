PImage picture;

void setup() {
  picture = loadImage("fall.jpg");
  surface.setSize(picture.width, picture.height);
}

void draw() {
 image(picture, 0, 0);

 // Output pixel colour at mouse pointer position
 color c = get(mouseX, mouseY);
 text("Red: " + red(c), 10, 10);
 text("Green: " + green(c), 10, 25);
 text("Blue: " + blue(c), 10, 40);
 text("Alpha: " + alpha(c), 10, 55);
}