class vector {

    float x,y;
    float vel = 0;
    float hvel = 0;
    int adjHeight = height-10;
    boolean dead = false;
    int groundShock = 1;
    float px,py;

    vector(float x_, float y_) {
        x = x_;
        y = y_;
        px = x;
        py = y;
    }

    void calcVel() {
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

    void drawEllipse() {
        fill(map(y,0,height,0,100),100,100);
        ellipse(x,y,20,20);
        fill(map(y,0,height,0,100),100,100,50);
        ellipse(px,py,20,20); // Motion blur effect
        px = x;
        py = y;
    }

    void calcDead(){
        dead = (vel >= -groundShock && vel <= groundShock);
    }
}
