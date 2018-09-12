import beads.*;
import java.util.Arrays; 

AudioContext ac;

void setup() {
  size(300,300);
  ac = new AudioContext();

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

void mouseReleased(){
  note(); 
}


void note(){
  
  float cf = 440; 
  float harmonicityRatio =  4;
  
  Glide carrierFreq = new Glide(ac,cf);
  Envelope modulationIndex = new Envelope(ac, 0.0);
  WavePlayer freqModulator = new WavePlayer(ac, cf * harmonicityRatio, Buffer.SINE);
  
 
  Function function = new Function(carrierFreq, freqModulator, modulationIndex) {
    public float calculate() {
      return x[1] * (x[0] * x[2]) + x[0];
    }
  };
  
   WavePlayer wp = new WavePlayer(ac, function, Buffer.SINE);
   Envelope e1 = new Envelope(ac, 0);
   e1.addSegment(0.5,5);
   modulationIndex.addSegment(6.0,5);
   e1.addSegment(0.1,50);
    modulationIndex.addSegment(2.0,50);
   e1.addSegment(0.1,1000);
    modulationIndex.addSegment(0.2,1000);
   e1.addSegment(0.0,1000);
   modulationIndex.addSegment(0.0,1000);
   Gain g = new Gain(ac, 1, e1);
   
   g.addInput(wp);
   ac.out.addInput(g);
  ac.start();
}