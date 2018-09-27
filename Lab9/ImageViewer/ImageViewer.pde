ImageLoader loader;
PImage img;
boolean black = false;
boolean negative = false;
boolean pixelate = false; 
boolean sepia = false;
boolean reset = false;
boolean save = false;
String moon = "moon";
String house = "house";
String sydney = "sydney";
String op ="";

void setup() {   
  img = loadImage(house+".png");
  surface.setSize(img.width, img.height);
  loader = new ImageLoader(img);
  smooth();
}

void loadView() {
  img = loadImage(house+".png");
  loader = new ImageLoader(img );
}

void draw() {
  image(img, 0, 0);
  loader.showXY();
  imageControl();
}

void keyPressed() {
  if (key == 'b' ) { 
    black = true; 
    reset = false;
    negative = false;
    pixelate = false;
    sepia = false;
  }
  if (key == 'r' ) { 
    reset = true; 
    black = false;
    negative = false;
    pixelate = false;
    sepia = false;
  }
  if( key == 'n' ){
    black = false; 
    reset = false;
    negative = true;
    pixelate = false;
    sepia = false;
  }
  if( key == 'p' ){
    black = false; 
    reset = false;
    negative = false;
    pixelate = true;
    sepia = false;
  }
  if( key == 'e' ){
    black = false; 
    reset = false;
    negative = false;
    pixelate = true;
    sepia = true;
  }
  if ( key =='s' ) save = true;
}

void imageControl() {
  if (black) { loader.blackwhite(); op = "black"; }
  if (reset) { loadView(); op="original"; }  
  if (save) { save(house+op+".tif"); exit(); }
  if (negative) { loader.negative(); op = "negative"; }
  if (pixelate) { loader.pixelate(); op = "pixelated"; }  
  if ( sepia ) { loader.sepia(); op="sepia";}
}
