void setup() {
  size(800,600);
  background(255);
  noFill();
  stroke(0);
  drawSquiggle(10);
  drawSquiggle(5);
  
  String greeting = "Hi there...";
  fill(0);
  textSize(20);
  text(greeting, 30, 30);
}

void drawSquiggle(float lineWidth) {
  strokeWeight(lineWidth);
  beginShape();
  vertex(width/2, height/2);
  
  float cx1 = random(100, width-100); 
  float cy1 = random(100, height-100); 
  float cx2 = random(100, width-100); 
  float cy2 = random(100, height-100);
  float ax =random(100, width-100);
  float ay =  random(100, height-100);
    
  bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
  endShape();
}
