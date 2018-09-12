void keyPressed()
{
  float PanVal=map(mouseX,0,width,-1,1);
  float EnvVal=map(mouseY,0,height,4,0.2);
  if (key=='q')
  {
    Sample.add(new PVector(mouseX,mouseY));
    PartitionColor.add(color(random(100,255),random(100,255),random(100,255)));
    TotalSamples++;
    sound(SoundType.POP,EnvVal,PanVal,0.2,true);
  }
  if (key=='w')
  {
    Sample.remove(CurrentSeed);
    PartitionColor.remove(CurrentSeed);
    TotalSamples--;
    UpdateCurrentSeed();
    sound(SoundType.POP,EnvVal,PanVal,0.2,false);
  }
}
