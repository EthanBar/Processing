class vector{
  
  float x,y;
  float vel = 0;
  float hvel = 0;
  int adjHeight = height-10;
  boolean dead = false;
  int groundShock = 1;
  
  vector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void calcVel(){
    if (dead){
      y = adjHeight;
    } else {
      vel -= 0.5;
      if (y > adjHeight && vel < 0){
        vel = -vel;
        calcDead();
        vel -= groundShock;
      }
    y -= vel;
    }
  }
    
  void calcDead(){
    dead = (vel >= -groundShock && vel <= groundShock);
  }
}