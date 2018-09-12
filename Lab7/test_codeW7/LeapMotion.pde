import de.voidplus.leapmotion.*;

LeapMotion leap;
PVector handPosition;
int handSeed=-1;
Boolean hand_locked=false;

void UpdateLeapMotionSeed()
{
  handSeed=PixelSeed[(int)handPosition.x][(int)handPosition.y];
}

void UpdateLeapMotionGrab()
{
  float handGrab=0;
  if (leap.getHands().size()>0)
    handGrab=leap.getHands().get(0).getGrabStrength();
   
  if (!hand_locked)
  {
    if (handGrab>0.75)
    {
      hand_locked=true;
      UpdateLeapMotionSeed();
    }
    else
      UpdateLeapMotionSeed();
  }else
  {
    
    if (handGrab<0.75)
    {
      hand_locked=false;
      UpdateLeapMotionSeed();
    }
    else
    {
      Sample.get(handSeed).x=handPosition.x;
      Sample.get(handSeed).y=handPosition.y;
    }
  }
}
void leapOnCircleGesture(CircleGesture g,int state)
{
  switch(state)
  {
    case 1:break;
    case 2:break;
    case 3:
    handPosition.z=0;
    Sample.add(handPosition);
    PartitionColor.add(color(random(100,255),random(100,255),random(100,255)));
    TotalSamples++;
    break;
  }
}

void leapOnKeyTapGesture(KeyTapGesture g)
{
   Sample.remove(handSeed);
   PartitionColor.remove(handSeed);
   TotalSamples--;
   UpdateLeapMotionSeed();
   UpdateCurrentSeed();
}
