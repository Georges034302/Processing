public class ImageLoader {
  
  private PImage img;
  int resolution = 50;
  int oldResolution = 50;
  public ImageLoader(PImage img) {
    this.img = img;
  }

  public void showXY() {
    color c = get(mouseX, mouseY); 
    textSize(14);
    fill(#0AF03D);
    text("Red: " + red(c), 10, 20);
    text("Green: " + green(c), 10, 35);
    text("Blue: " + blue(c), 10, 50);
  }

  public PImage getImg() {
    return this.img;
  }

  public void blackwhite() {
    this.img.loadPixels();
    for (int i = 0; i < this.img.pixels.length; i++) {
      color c = this.img.pixels[i];
      this.img.pixels[i] = color(red(c)*0.299+green(c)*0.587+blue(c)*0.114);
    }
    this.img.updatePixels();
  }

  public void negative() {
    for (int y=0; y<this.img.height; y++) {
      for (int x=0; x<this.img.width; x++) {
        color c = get(x, y);
        set(x, y, color(255-red(c), 255-green(c), 255-blue(c)));
      }
    }
  }

  public void pixelate() {
    int resolution = 200;
    int xInc = width/resolution;
    int yInc = height/resolution;

    for (int y=0; y< this.img.height; y+=yInc) {
      for (int x=0; x< this.img.width; x+=xInc) {
        fill(img.get(x, y));
        rect(x, y, xInc, yInc);
      }
    }
  }

  public void sepia() {
    loadPixels();
    for (int i = 0; i < pixels.length; i++) {
      color c = pixels[i];

      float r = red(c)*0.393+green(c)*0.769+blue(c)*0.189;
      float g = red(c)*0.349+green(c)*0.686+blue(c)*0.168;
      float b = red(c)*0.272+green(c)*0.534+blue(c)*0.131;

      pixels[i] = color(r, g, b);
    }
    updatePixels();
  }
}//END CLASS
