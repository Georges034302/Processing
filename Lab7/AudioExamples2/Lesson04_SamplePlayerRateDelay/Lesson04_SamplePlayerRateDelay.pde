import beads.*;
import java.util.Arrays; 

AudioContext ac;

void setup() {
  size(300,300);
  ac = new AudioContext();
  sound();
}

/*
 * This code is used by the selectInput() method to get the filepath.
 */
void sound() {
  /*
   * Here's how to play back a sample.
   * 
   * The first line gives you a way to choose the audio file.
   * The (commented, optional) second line allows you to stream the audio rather than loading it all at once.
   * The third line creates a sample player and loads in the Sample.
   * SampleManager is a utility which keeps track of loaded audio
   * files according to their file names, so you don't have to load them again.
   */
  String audioFileName = "/Users/samferguson/Desktop/Nylon_Guitar/Clean_A_harm.wav";
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample(audioFileName));
  /*
   * And as before...
   */
  Envelope rate = new Envelope(ac, 1);
  player.setRate(rate);
  //rate.addSegment(1.5, 1000); 
  
  player.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  
  TapIn tin = new TapIn(ac, 1000);
  TapOut tout = new TapOut(ac, tin, 200);
  
  Gain gDelay = new Gain(ac, 1, 0.9);
  gDelay.addInput(tout);
  tin.addInput(gDelay);
  
  tin.addInput(player);
  
  Panner p = new Panner(ac, 0); 
  Gain g = new Gain(ac, 2, 0.5);
  
  p.addInput(player);
  p.addInput(tout);
  g.addInput(p);
  ac.out.addInput(g);
  ac.start();
  
  /*
   * Note there is a lot more you can do. e.g., Varispeed. Try adding this...
   Envelope speedControl = new Envelope(ac, 1);
   player.setRate(speedControl);
   speedControl.addSegment(1, 1000);  //wait a second
   speedControl.addSegment(-0.5, 3000); //now rewind
   *
   */
   
}


/*
 * Here's the code to draw a scatterplot waveform.
 * The code draws the current buffer of audio across the
 * width of the window. To find out what a buffer of audio
 * is, read on.
 * 
 * Start with some spunky colors.
 */
color fore = color(255, 102, 204);
color back = color(0,0,0);

/*
 * Just do the work straight into Processing's draw() method.
 */
void draw() {
  loadPixels();
  //set the background
  Arrays.fill(pixels, back);
  //scan across the pixels
  for(int i = 0; i < width; i++) {
    //for each pixel work out where in the current audio buffer we are
    int buffIndex = i * ac.getBufferSize() / width;
    //then work out the pixel height of the audio data at that point
    int vOffset = (int)((1 + ac.out.getValue(0, buffIndex)) * height / 2);
    //draw into Processing's convenient 1-D array of pixels
    vOffset = min(vOffset, height);
    pixels[vOffset * height + i] = fore;
  }
  updatePixels();
}