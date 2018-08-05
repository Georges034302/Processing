void setup() {
  size(800, 600);
  background(#798663);
}
int radius = 200;
int rotationAngle = 0;


void draw() {  

  fill( random(255), random(255), random(255), random(255)); 
  //rect(mouseX,mouseY,width/6,height/6);
  //spinPolygon();
  //createRect(width/3,height/3,width/3,height/3);
  //plotRandomShape(pmouseX,pmouseY,width/5,height/5,0.2);
}

void spinPolygon() {
  background(#798663);
  translate(width/2, height/2);
  rotate(radians(rotationAngle));
  drawPolygon(int(random(2, 5)), int(random(8)));
  rotationAngle++;
}

void createRect(float x, float y, float w, float h) {
  beginShape();
  vertex(x, y);
  vertex(x, y+h);
  vertex(x+w, y+h);
  vertex(x+w, y);
  endShape(CLOSE);
}

void plotRandomShape(float x, float y, float w, float h, float offset) {
  beginShape();
  float dw = w*offset;
  float dh = h*offset;
  float dx = x + random(-dw, dw);
  float dy = y + random(-dh, dh);
  vertex(x+dx, y+dy);
  vertex(x+dx, y+h+dy);
  vertex(x+w+dx, y+h+dy);
  vertex(x+w+dw, y+dy);
  endShape(CLOSE);
}

void drawPolygon(int sideCount, int radius) {
  beginShape();

  float angleIncrement = 360 / sideCount;

  for (int angle = 0; angle < 360; angle+= angleIncrement) {
    float x = radius * cos(radians(angle));
    float y = radius * sin(radians(angle));

    //x += width/2;
    //y += height/2;
    vertex(x, y);
  }
  endShape(CLOSE);
}
