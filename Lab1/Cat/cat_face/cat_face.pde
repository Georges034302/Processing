size(600, 600);
noStroke();
background(119, 79, 56);
fill(197, 224, 220);
rect(0, 500, 600, 200);
stroke(224, 142, 121);
strokeWeight(4);
//ears
fill(236,229,206);
triangle(130, 100, 120, 300, 400, 300);
triangle(470, 100, 480, 300, 200, 300);
fill(241,212,175);
triangle(150, 150, 130, 300, 500, 280);
triangle(450, 150, 480, 300, 100, 280);
//whiskers
line(120, 280, 40, 260);
line(480, 280, 560, 260);
line(120, 300, 60, 300);
line(480, 300, 540, 300);
line(120, 320, 40, 340);
line(480, 320, 560, 340);
//face
fill(236,229,206);
ellipse(300, 300, 400, 300);
//nose
fill(224, 142, 121);
triangle(300, 340, 280, 320, 320, 320);
line(300, 340, 260, 360);
line(300, 340, 340, 360);
//eyes
noStroke();
fill(0, 0, 0);
ellipse(200, 280, 30, 30);
ellipse(400, 280, 30, 30);
