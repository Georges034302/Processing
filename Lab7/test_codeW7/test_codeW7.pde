int TotalSamples=100;

ArrayList<PVector> Sample;
ArrayList<Integer> PartitionColor;
int [][] PixelSeed;
int [] PartitionNum;
int CurrentSeed=-1;
int MovingSeed=-1;
Boolean locked=false;

float VelocityX=0;
float VelocityY=0;

int GetClosestSample(PVector TestPos)
{
  int ClosestI=-1;
  float MinD=MAX_FLOAT;
  for (int i=0;i<Sample.size();i++)
  {
    float Dist=PVector.dist(TestPos,Sample.get(i));
    if (Dist<MinD)
    {
      MinD=Dist;
      ClosestI=i;
    }
  }
  assert(ClosestI>=0);
  assert(ClosestI<Sample.size());
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
    color c=PartitionColor.get(ClosIndex);
    pixels[loc]=c;
    PixelSeed[x][y]=ClosIndex;
  }
  updatePixels();
}

void LLoydStep()
{
  if (Sample.size()!=PartitionNum.length)
    PartitionNum= new int[Sample.size()];
    
  for (int i=0;i<Sample.size();i++)
  {
    Sample.get(i).x=0;
    Sample.get(i).y=0;
    PartitionNum[i]=0;
  }
  for (int x=0;x<width;x++)
  for (int y=0;y<height;y++)
  {
    int Index=PixelSeed[x][y];
    Sample.get(Index).x+=x;
    Sample.get(Index).y+=y;
    PartitionNum[Index]++;
  }
  for (int i=0;i<Sample.size();i++)
  {
    Sample.get(i).x/=PartitionNum[i];
    Sample.get(i).y/=PartitionNum[i];
  }
}

void SampleRandomColor(int NumSamples)
{
  PartitionColor= new ArrayList<Integer>();
  for (int i=0;i<NumSamples;i++)
    PartitionColor.add(color(random(100,255),random(100,255),random(100,255)));
}

void SampleRandomPos(int NumSamples)
{
  Sample = new ArrayList<PVector>();
  for (int i=0; i<NumSamples; i++)
  {
    int RandomX=int(random(width));
    int RandomY=int(random(height));
    PVector CurrV=new PVector(RandomX,RandomY);
    Sample.add(CurrV);
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
  
  leap=new LeapMotion(this);
  leap.allowGestures();
  
  handPosition= new PVector();
  handPosition.x=0;
  handPosition.y=0;
}

void draw()
{
  background(255, 255, 255, 255);
  
  if (leap.getHands().size()>0)
    handPosition=leap.getHands().get(0).getStabilizedPosition();
  //else
  //{
  //}
  if (!locked)
  {
    UpdateCurrentSeed();
    if ((MovingSeed>=0)&&(MovingSeed<Sample.size()))
    {
      Sample.get(MovingSeed).x+=VelocityX;
      Sample.get(MovingSeed).y+=VelocityY;
    }
  }
  if (!hand_locked)
    UpdateLeapMotionSeed();
  
  UpdateLeapMotionGrab();
  
  UpdatePixelColors();
  
  LLoydStep();
  
  for (int i=0; i<Sample.size(); i++)
  {
    float currX=Sample.get(i).x;
    float currY=Sample.get(i).y;
    strokeWeight(5);
    stroke(0,0,0);
    if (i==CurrentSeed)
    {
      if (locked)
      {
        stroke(255,0,0);
        strokeWeight(20);
      }
      else
      {
        stroke(0,255,0);
        strokeWeight(10);
      }
    }
    if (i==handSeed)
    {
      if (hand_locked)
      {
        strokeWeight(30);
        stroke(255,255,0);
      }
      else
      {
        stroke(255,255,0);
        strokeWeight(10);
      }
    }
    point(currX, currY);
  }
  strokeWeight(10);
  stroke(255,0,255);
  ellipse(handPosition.x,handPosition.y,20,20);
}
