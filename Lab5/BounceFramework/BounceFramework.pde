float x, y;
int size;
float gravity;
Ball[] balls;
int rad = 30;
void setup(){
   size(600,600);
   initialize();
}

void initialize(){
  x = width/2;
  y = height/2;
  gravity = 0.5;
  size = 10;
  
  for(int i=0; i < size; i++)
    balls[i] = new Ball(random(x),random(y), 30);
}

void play(){
   for(Ball ball:balls)
   {
       ball.move();
       ball.plotBall();
   }
}
void draw(){
    background(150);
    play();
}
