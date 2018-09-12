void UpdateCurrentSeed()
{
  if ((mouseX>=0)&&(mouseX<width)&&(mouseY>=0)&&(mouseY<height))
    CurrentSeed=PixelSeed[mouseX][mouseY];
  else
    CurrentSeed=-1;
}

void mousePressed()
{
  locked=true;
  UpdateCurrentSeed();
  if (CurrentSeed>=0)
  {
    MovingSeed=CurrentSeed;
  }
}

void mouseReleased()
{
  locked=false;
  UpdateCurrentSeed();
} 

void mouseDragged()
{
  if (locked)
  {
    float OldX=Sample.get(CurrentSeed).x;
    float OldY=Sample.get(CurrentSeed).y;
    Sample.get(CurrentSeed).x=mouseX;
    Sample.get(CurrentSeed).y=mouseY;
    float NewX=Sample.get(CurrentSeed).x;
    float NewY=Sample.get(CurrentSeed).y;
    VelocityX=NewX-OldX;
    VelocityY=NewY-OldY;
  }
}
