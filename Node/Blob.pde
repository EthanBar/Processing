class Blob {
  float x,y,tx,ty;

  Blob(float mx, float my){
    x = mx;
    y = my;
  }

  public void drawDot(float clr){
    fill(clr, 100, 100);
    ellipse(x, y, 20, 20);
  }

  public void update(float tx, float ty){
    if (tx + x >= width || tx + x <= 0){
      x += -tx;
    } else {
      x += tx;
    }
    if (ty + y >= height || ty + y <= 0){
      y += -ty;
    } else {
      y += ty;
    }
  }

}
