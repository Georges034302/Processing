import beads.*;

AudioContext ac;

public enum SoundType {POP,BUBBLE};

void sound(SoundType s,float rateVal,
          float pan, float gain,Boolean delay) 
{
  
  String audioPopFileName = dataPath("")+"/15348__ch0cchi__bubble-pop.wav";
  SamplePlayer playerPopBubble = new SamplePlayer(ac, SampleManager.sample(audioPopFileName));
  playerPopBubble.setLoopType(SamplePlayer.LoopType.NO_LOOP_FORWARDS);
  
  String audioDrownFileName = dataPath("")+"/drown1.wav";
  SamplePlayer playerDrownBubble = new SamplePlayer(ac, SampleManager.sample(audioDrownFileName)); 
  playerDrownBubble.setLoopType(SamplePlayer.LoopType.NO_LOOP_FORWARDS);
  
  Envelope rate = new Envelope(ac, rateVal);
  
  TapIn tin = new TapIn(ac, 300);
  TapOut tout = new TapOut(ac, tin, 100);
  Gain gDelay = new Gain(ac, 1, 0.7);
  gDelay.addInput(tout);
  tin.addInput(gDelay);
  
  Panner p = new Panner(ac,pan); 
  
  Gain g = new Gain(ac, 2, gain);
  
  switch (s){
     case POP:
       if (delay)
       {
         tin.addInput(playerPopBubble);
         p.addInput(tout);
       }
       else
         p.addInput(playerPopBubble);
         
       playerPopBubble.setRate(rate);
       break;
     case BUBBLE:
       if (delay)
       {
         tin.addInput(playerDrownBubble);
         p.addInput(tout);
       }
       else
         p.addInput(playerDrownBubble);
         
       playerDrownBubble.setRate(rate);
     break;
  }
  g.addInput(p);
  ac.out.addInput(g);
  ac.start();
  //g.kill();
}
