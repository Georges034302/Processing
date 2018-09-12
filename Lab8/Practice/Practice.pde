////In the 'data' folder a CSV file 'grades.csv' with WSD Autumn 2018 Grade/Mark log
//Define a Processing script that draws a histrogram representation of grades/marks distribution 
//A sample sketch "graph.tif" can be found in Practice/data
//Try to complete a drawing close to 'graph.tif. Enable your script to save histogram graph.
//Complete at least the following steps. Other components may be needed.


//================================Declare Program Global Variables============================//
Table table;
String grades[];
float X1, Y1, X2, Y2;

//================================Initialize Program Global Variables=========================//
void setup() {
  size(600, 600);
  smooth();
  initialize();
  extractGrades();
}

void initialize() {  
  X1 = 50; 
  Y1 = 50;
  X2 = width - 2*X1; 
  Y2 = height - 2*Y1;
  //Task 1- load grades.csv into table
  //Task 2- create grades[] with size = to table row count
}

//Task 3- populate grades[] with table row="Grade" data
void extractGrades() {
  //add code here
}


//Task 4- Calculate the length of each Grade Bar "Z P C D H"


//================================Build Program Components====================================//

//Task 5- build histogram bars based on bar length of each grade in Task 4
void buildBars() {  

  //add code here
}

//Task 6- draw labels as shown in  'graph.tif'
void drawLabels() {
  //add code here
}


//Histogram canvas
void createPanel() {  
  fill(#99d9cc);
  rect(X1, Y1, X2, Y2);
}

//================================Control Program Components====================================//

//Task 7- enable your program to save histogram as 'graph.tif' at key press

//================================Draw Program Components=======================================//
void draw() {
  background(#d6c2e0);
  createPanel();
  buildBars();
  drawLabels();
}
