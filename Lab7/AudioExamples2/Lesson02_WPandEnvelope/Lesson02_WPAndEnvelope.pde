import beads.*;
import java.util.Arrays; 

AudioContext ac;
Glide freq;
WavePlayer wp;
Envelope e;
void setup() {
  size(300,300);
  
  
  ac = new AudioContext();
 
  
  /*
   * This is a Glide. It can be used to modify
   * the behaviour of other UGen objects. We need to
   * do this to get precise control of certain parameters
   * at an audio rate.
   */
  freq = new Glide(ac, 500);
  freq.setGlideTime(200);
  
  /*
   * This is a WavePlayer. Here we've set it up using 
   * the above Glide, and a SineBuffer. We'll use
   * the Glide to modify the freqency below.
   */
  wp = new WavePlayer(ac, freq, Buffer.SQUARE);
  
  
  /* This is an Envelope. It changes a value over time, 
   * moving between breakpoints set with the addSegment() command. 
   * It starts with a 0 value which will mean the gain object will cancel out the sound.
   */
  e = new Envelope(ac, 0.0);
  
  
  /*
   * Connect it all together with a Gain object. 
   */
   

  Gain g = new Gain(ac, 1, e); // Here the gain object takes the envelope as an input.
  
  
  g.addInput(wp);
  ac.out.addInput(g);
  ac.start();
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
  
  // set the frequency.
  freq.setValue(mouseY * 4);

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

void mouseReleased(){
 
  e.addSegment(0.5, 100);  // Attack
  e.addSegment(0.1, 100); // Decay
  e.addSegment(0.1, 500); // Sustain
  e.addSegment(0.0, 200); // Release
  
}