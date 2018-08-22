public class Ball{
   private float x;
   private float y;
   private float vx;
   private float vy;
   private float radius;
   
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
           ////calculate the collision factors and determine vx, vy;
       }
   }
   
   private boolean match(Ball me){
       return this.x==me.x && this.y==me.y;
   }
   
   public void bounce(Ball[] others){
       for(Ball ball:others)
         if(!match(ball))
           this.bounce(ball);
   }
   
   public void bounce(){
      this.bounce(balls); 
   }
   
   public void move(){
     ///move a ball using vx and vy and determine the collision conditions
   }
   
   public void plotBall(){
      ellipse(this.x,this.y,radius,radius); 
   }
}
