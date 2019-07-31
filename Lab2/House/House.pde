size(600,600);
background(#80BF7F);
stroke(#907A27);
strokeWeight(4);
int x=width/4;
int y=height/4;
int h=height/10;
int e=10;

//base
fill(#676046);
rect(x,y,x+h,y+h);

//roof
int half = (y+h)/2;
fill(#A53516);
triangle(x-e,y,x+half,y-half,x+2*half+e,y);

//door
fill(#154162);
int dx=x+h;
int dy=x+y-h;
int dw=h;
int dh=2*h;
rect(dx,dy,dw,dh);

//door knob
ellipse(dx+e, dy+h, e, e);

//window
fill(#29BDC9);
int wx=x+y-e;
int wy=y+h/2;
int ww=h;
int wh=h;
rect(wx,wy,ww,wh);

//lines
line(wx,wy+ww/2,wx+ww,wy+wh/2);
line(wx+ww/2,wy,wx+ww/2,wy+wh);
