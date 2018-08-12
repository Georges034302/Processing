noFill();
strokeWeight(4);
beginShape();
vertex(20, 20);
ellipse(20, 20, 4, 4);

quadraticVertex(80, 20, 50, 50);
rect(80, 20, 4, 4);
ellipse(50, 50, 4, 4);

quadraticVertex(20, 80, 80, 80);
rect(20, 80, 4, 4);
ellipse(80, 80, 4, 4);

endShape();
