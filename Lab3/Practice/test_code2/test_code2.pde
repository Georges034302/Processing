int TotalSamples=300;
//int MinRadius=10;
//int MaxRadius=50;

PVector [] Sample;
//float [] Radius;

int GetClosestSample(PVector TestPos)
{
  int ClosestI=-1;
  float MinD=MAX_FLOAT;
  for (int i=0;i<Sample.length;i++)
  {
    float Dist=PVector.dist(TestPos,Sample[i]);
    if (Dist<MinD)
    {
      MinD=Dist;
      ClosestI=i;
    }
  }
  assert(ClosestI>=0);
  assert(ClosestI<Sample.length);
  return (ClosestI);
}

void UpdatePixelColors()
{
  float MaxD=sqrt((width*height)/Sample.length);
  color c1=color(255,0,0,255);
  color c2=color(0,255,0,255);
  loadPixels();
  for (int x=0;x<width;x++)
  for (int y=0;y<height;y++)
  {
    PVector TestPos=new PVector(x,y);
    int ClosIndex=GetClosestSample(TestPos);
    float CurrD=PVector.dist(TestPos,Sample[ClosIndex]);
    CurrD=min(CurrD,MaxD);
    float fraction= map(CurrD,0,MaxD,0,1);
    color c=lerpColor(c1,c2,fraction);
    int loc= x + y *width;
    pixels[loc]=c;
  }
  updatePixels();
}

void SampleRandomPos(int NumSamples)
{
  Sample = new PVector[NumSamples];
  //Radius = new float[NumSamples];
  for (int i=0; i<NumSamples; i++)
  {
    int RandomX=int(random(width));
    int RandomY=int(random(height));
    //int currRadius=int(random(MinRadius, MaxRadius));
    PVector CurrV=new PVector(RandomX,RandomY);
    Sample[i]=CurrV;
    //Radius[i]=currRadius;
  }
}

void setup()
{
  background(255, 255, 255, 255);
  size(800, 800);
  frameRate(60);
  //noLoop();
}

void draw()
{
  background(255, 255, 255, 255);
  //color cMin=color(255, 0, 0, 255);
  //color cMax=color(0, 255, 0, 255);
  SampleRandomPos(TotalSamples);
  UpdatePixelColors();
  strokeWeight(5);
  for (int i=0; i<Sample.length; i++)
  {
    float currX=Sample[i].x;
    float currY=Sample[i].y;
    point(currX, currY);
    //float currRadius=Radius[i];
    //float fraction=map(currRadius, MinRadius, MaxRadius, 0, 1);
    //color InterpC=lerpColor(cMin, cMax, fraction);
    //fill(InterpC);
    
    //rect(currX, currY, currRadius, currRadius, 15);
    //ellipse(currX, currY, currRadius, currRadius);
  }
  
}
