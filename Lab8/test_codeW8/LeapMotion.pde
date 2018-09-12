import de.voidplus.leapmotion.*;

LeapMotion leap;
PVector handPosition;
Boolean hand_locked=false;
int handSeed=-1;
int MovingHandSeed=-1;

void UpdateLeapMotionSeed()
{
  handSeed=PixelSeed[(int)handPosition.x][(int)handPosition.y];
}

// ======================================================
// 2. Circle Gesture

void leapOnCircleGesture(CircleGesture g, int state)
{
  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: 
    handPosition.z=0;
    Sample.add(handPosition);
    PartitionColor.add(color(random(100,255),random(100,255),random(100,255)));
    TotalSamples++;
    break;
  }
}




// ======================================================
// 4. Key Tap Gesture

void leapOnKeyTapGesture(KeyTapGesture g) {
  UpdateLeapMotionSeed();
  Sample.remove(handSeed);
  PartitionColor.remove(handSeed);
  TotalSamples--;
  UpdateCurrentSeed();
}

void UpdateLeapMotionGrab()
{
  //LEAP MOTION
  float   handGrab=0;
  if (leap.getHands().size()>0)
    handGrab= leap.getHands().get(0).getGrabStrength();
  if (!hand_locked)
  {
    if (handGrab>0.75)
    {
      hand_locked=true;
      UpdateLeapMotionSeed();
      MovingHandSeed=handSeed;
    } else
      UpdateLeapMotionSeed();
  } else
  {
    if (handGrab>0.75)
    {
      Sample.get(handSeed).x=handPosition.x;
      Sample.get(handSeed).y=handPosition.y;
    } else
    {
      hand_locked=false;
      UpdateLeapMotionSeed();
    }
  }
}
