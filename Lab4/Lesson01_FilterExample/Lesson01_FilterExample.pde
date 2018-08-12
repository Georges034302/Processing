import beads.*;
import java.util.Arrays; 

/*
 * Lesson 1: Make some noise! Note, if you don't know Processing, you'd
 * be well advised to follow some of the Processing tutorials first.
 */
 
AudioContext ac;

void setup() {
  size(300,300);
  /*
   * Make an AudioContext. This class is always the starting point for 
   * any Beads project. You need it to define various things to do with 
   * audio processing. It also connects the the JavaSound system and
   * provides you with an output device.
   */
   ac = new AudioContext();
  
  /* 
   * Make a noise-making object. Noise is a type of Class known as a
   * UGen. UGens have some number of audio inputs and audio outputs
   * and do some kind of audio processing or generation. Notice that
   * UGens always get initialised with the AudioContext.
   */
  Noise n = new Noise(ac);
  
  /* 
   * Make a gain control object. This is another UGen. This has a few
   * more arguments in its constructor: the second argument gives the
   * number of channels, and the third argument can be used to initialise
   * the gain level.
   */
  Gain g = new Gain(ac, 1, 0.5);
   
   
  // Create a Lowpass Biquad filter, with cutoff of 1000Hz, and Q of 0.5.  
  BiquadFilter filter1 = new BiquadFilter(ac, BiquadFilter.LP, 5000.0f, 0.5f);
  
    filter1.addInput(n); // pass the noise into this new filter. 

  g.addInput(filter1); // pass the output of the filter into into the gain.
  
  ac.out.addInput(g);  // pass the gain to the AudioContext
  /*
   * Finally, start things running.
   */
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