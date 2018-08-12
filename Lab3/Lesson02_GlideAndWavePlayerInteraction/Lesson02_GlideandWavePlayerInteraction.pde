import beads.*;
import java.util.Arrays; 

AudioContext ac;
Glide freq;
WavePlayer wp;
void setup() {
  size(300,300);
  textSize(24);
  fill(150);
  ac = new AudioContext();
  /*
   * This is a Glide. It can be used to modify
   * the behaviour of other UGen object. We need to
   * do this to get precise control of certain parameters
   * at an audio rate.
   */
  freq = new Glide(ac, 500);
  freq.setGlideTime(2000);
  /*
   * This is a WavePlayer. Here we've set it up using 
   * the above Glide, and a SineBuffer. We'll use
   * the Glide to modify the freqency below.
   */
  wp = new WavePlayer(ac, freq, Buffer.SQUARE);
  /*
   * So now that the WavePlayer is set up with the 
   * frequency Glide, this command tells the Glide to change
   * to 1000. Note that when we made the Envelope
   * it was set to 500, so the transition goes from 500 to
   * 1000. These control the frequency of the WavePlayer
   * in Hz.
   */
  //freq.setValue(1000);
  /*
   * Connect it all together.
   */
   
  
  Gain g = new Gain(ac, 1, 0.1);
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
  // Set the frequency based on the mouse Y position.
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
  text(freq.getValue(), 30, 30); // print the frequency

}