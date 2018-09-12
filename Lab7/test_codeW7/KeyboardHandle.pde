void keyPressed()
{
  if (key=='q')
  {
    Sample.add(new PVector(mouseX,mouseY));
    PartitionColor.add(color(random(100,255),random(100,255),random(100,255)));
    TotalSamples++;
  }
  if (key=='w')
  {
    Sample.remove(CurrentSeed);
    PartitionColor.remove(CurrentSeed);
    TotalSamples--;
    UpdateCurrentSeed();
  }
}
