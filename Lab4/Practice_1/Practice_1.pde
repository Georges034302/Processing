void setup() {
  size(600, 600);
  background(#84E8F2);
  frameRate(10);
  drawAxis();
}

float x, y, cx1, cy1, cx2, cy2, cx3, cy3, cx4, cy4, ax, ay; 
float scale;
void setupPoints() {
  x = mouseX;
  y = mouseY;
  cx1 = random(x-100, x+100);
  cy1 = random(x-100, x+100);
  cx2 = random(x-100, x+100);
  cy2 = random(x-100, x+100);
  cx3 = random(x-100, x+100);
  cy3 = random(x-100, x+100);
  cx4 = random(x-100, x+100);
  cy4 = random(x-100, x+100);
  ax = random(x-100, x+100);
  ay = random(x-100, x+100);
  scale=100;
}

void draw() {  
  //fill(random(255), random(255), random(255)); 
  noFill();
  setupPoints();  
  translate(width/2, height/2);   
  plotFx2();
  plotFx3();  
  //plotCurve();
  //plotQuadra();
  //plotBrezier();
  
  noLoop();
}

void plotBrezier() {
  beginShape();
  vertex(x, y);
  bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
  bezierVertex(cx3, cy3, cx4, cy4, ax, ay);
  endShape(CLOSE);
}

void plotQuadra() {
  beginShape();
  vertex(x, y);
  quadraticVertex(cx1, cy1, cx2, cy2);
  quadraticVertex(cx3, cy3, cx4, cy4);
  endShape(CLOSE);
}

void plotCurve() {
  beginShape();
  curveVertex(cx1, cy1);
  curveVertex(cx2, cy2);
  curveVertex(cx3, cy3);
  curveVertex(cx4, cy4);
  curveVertex(ax, ay);
  endShape(CLOSE);
}

void plotFx2() {   
  beginShape();
  stroke(#C5D32D);
  strokeWeight(2);
  for (int i=-width/2; i<width/2; i++)      
    vertex(i, -fx2(1, 1, 0, i)/scale);
  endShape(CLOSE);
}

void plotFx3() {  
  beginShape();
  stroke(#D32DAD);
  strokeWeight(2);
  for (int i=-width; i<width; i++)
    vertex(i, -fx3(1, 1, 1, 1, i)/scale);
  endShape(CLOSE);
}

void plotExp() {
  beginShape();
  for (int i=-width; i<width; i++)
    vertex(i, -exp(i));
  endShape(CLOSE);
}

void drawAxis() {  
  beginShape();
  stroke(#0F0F0F);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  endShape(CLOSE);
}

//Generate a polynomial function of order-2
float fx2(int a, int b, int c, int x) {
  return a*pow(x, 2)+b*x+c;
}

//Generate polynomial function of order-3
float fx3(int a, int b, int c, int d, int x) {
  return a*pow(x, 3)+b*pow(x, 2)+c*x+d;
}
