public class Ball{
   private float x;
   private float y;
   private float radius;
   private float vx;
   private float vy;
   private float gravity = 0.5;
   
   public Ball(float x, float y, float radius){
       this.x = x;
       this.y = y;
       this.radius = radius;
   }
   public void bounce(Ball other){
       float dx = this.x-other.x;
       float dy = this.y-other.y;
       float distance = sqrt(pow(dx,2)+pow(dy,2));
       float minDist = this.radius+other.radius;
       if(distance < minDist){
           ////Task 1: decide vx vy that allows the two balls to bounce away
       }
   }
   private boolean touch(Ball other){
       return this.x==other.x && this.y==other.y;
   }
   public void bounce(Ball[] others){
       for(Ball ball:others)
         if(!this.touch(ball))
            this.bounce(ball);     
   }
   public void bounce(){
       this.bounce(balls);
   }
   
   public void move(){
       ///TASK 2: Teach each ball how to move using vx and vy
   }
   public void plotBall(){
      ellipse(this.x,this.y,this.radius,this.radius); 
   }
}
