Table table;

String [] grades;
float X1 , Y1 , X2 , Y2;
PFont font;

void setup() {
  size(600, 600);  
  smooth(4);
  initialize();
  splitTable();
}

void initialize() {
  table = loadTable("Data/grades.csv", "header");
  grades = new String[table.getRowCount()];
  X1 = 50; 
  Y1 = 50;
  X2 = width - 2*X1; 
  Y2 = height - 2*Y1;
  font = createFont("Arial Bold", 18);
  textFont(font);
}

void splitTable() {
  int i = 0;
  for (TableRow row : table.rows()) {    
    grades[i++] = row.getString("Grade");
  }
}

int count(String given) {
  int count = 0;
  for (String grade : grades)
    if (grade.equals(given))
      count++; 
  return count;
}

int[] createBars() {
  int Z = count("Z");
  int P = count("P");
  int C = count("C");
  int D = count("D");
  int H= count("H");  
  return new int[]{Z, P, C, D, H};
}

void buildBars() {  
  int[] bars = createBars();
  float x = width*0.15;
  float y = height*0.9;
  float delta = width*0.8/bars.length;
  float w = delta*0.5;
  int maxbar = table.getRowCount(); 
  String[] grade = {"Z","P","C","D","HD"};
  int i=0;
  for (int bar : bars) {   
    float h = map(bar, 0, maxbar, 0, height); 
    fill(0);
    rect(x, y-h, w, h);
    fill(255);
    textSize(14);
    text(bar, x+w/2, y);
    textFont(font);
    fill(0);
    text(grade[i++],x+w/2,y+w/2+5);
    x = x + delta;  
  }
}

void createPanel() {  
  fill(#99d9cc);
  rect(X1, Y1, X2, Y2);
}

void drawLabels() {
  fill(0);
  text(" +"+table.getRowCount(),X2+70,Y1+10);
  text("+"+0,X2+65,Y2+Y1);
  textSize(18);
  textAlign(CENTER);  
  translate(X1, height/2);
  rotate((3*PI)/2);
  text("Marks Distribution", -X1/2, -Y1/4);
  translate(width/2, height/2);
  rotate((PI)/2);
  text("Grades Distribution", -X1, Y1/2+10);  
  translate(X1+160, height/2);
  rotate((PI)/2);
  text("WSD Autumn 2018 Students Count", X1/2, -Y1/4);  
}

void draw() {
  background(#d6c2e0);
  createPanel();
  buildBars();
  drawLabels();  
}

void keyPressed() {
  if (key == 's') save("data/graph.tif");
}
