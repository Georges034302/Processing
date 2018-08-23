int size;
Ball[] balls;
void setup(){
  size(600,600);
  frameRate(30);  
  initialize();
}

void initialize(){
   size = 10; 
   balls = new Ball[size];
   for(int i=0; i< size; i++)
       balls[i] = new Ball(random(width), random(height), 50);
}

void play(){
    for(Ball ball: balls){      
      ball.plotBall();
      ball.move();
    }
}
void draw(){
    background(150);
    play();
}
