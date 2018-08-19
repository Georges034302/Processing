int TotalSamples=100;

PVector [] Sample;
color [] PartitionColor;
int [][] PixelSeed;
int [] PartitionNum;

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
  //float MaxD=sqrt((width*height)/Sample.length);
  //color c1=color(255,0,0,255);
  //color c2=color(0,255,0,255);
  loadPixels();
  for (int x=0;x<width;x++)
  for (int y=0;y<height;y++)
  {
    PVector TestPos=new PVector(x,y);
    int ClosIndex=GetClosestSample(TestPos);
    //float CurrD=PVector.dist(TestPos,Sample[ClosIndex]);
    //CurrD=min(CurrD,MaxD);
    //float fraction= map(CurrD,0,MaxD,0,1);
    //color c=lerpColor(c1,c2,fraction);
    int loc= x + y *width;
    color c=PartitionColor[ClosIndex];
    pixels[loc]=c;
    PixelSeed[x][y]=ClosIndex;
  }
  updatePixels();
}

void LLoydStep()
{
  
  for (int i=0;i<Sample.length;i++)
  {
    Sample[i].x=0;
    Sample[i].y=0;
    PartitionNum[i]=0;
  }
  for (int x=0;x<width;x++)
  for (int y=0;y<height;y++)
  {
    int Index=PixelSeed[x][y];
    Sample[Index].x+=x;
    Sample[Index].y+=y;
    PartitionNum[Index]++;
  }
  for (int i=0;i<Sample.length;i++)
  {
    Sample[i].x/=PartitionNum[i];
    Sample[i].y/=PartitionNum[i];
  }
}

void SampleRandomColor(int NumSamples)
{
  PartitionColor= new color[NumSamples];
  for (int i=0;i<PartitionColor.length;i++)
    PartitionColor[i]=color(random(100,255),random(100,255),random(100,255));
}

void SampleRandomPos(int NumSamples)
{
  Sample = new PVector[NumSamples];
  for (int i=0; i<NumSamples; i++)
  {
    int RandomX=int(random(width));
    int RandomY=int(random(height));
    PVector CurrV=new PVector(RandomX,RandomY);
    Sample[i]=CurrV;
  }
}

void setup()
{
  background(255, 255, 255, 255);
  size(400, 400);
  frameRate(60);
  //noLoop();
  SampleRandomPos(TotalSamples);
  SampleRandomColor(TotalSamples);
  PixelSeed= new int [width][height];
  PartitionNum = new int [TotalSamples];
}

void draw()
{
  background(255, 255, 255, 255); 
  UpdatePixelColors();
  LLoydStep();
  strokeWeight(5);
  for (int i=0; i<Sample.length; i++)
  {
    float currX=Sample[i].x;
    float currY=Sample[i].y;
    point(currX, currY);
  }
  
}
