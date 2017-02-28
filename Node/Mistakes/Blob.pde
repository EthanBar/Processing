class Blob {
  float x;
  float y;
  Blob(){
    x = random(0, width);
    y = random(0, height);
  }
  
  public void drawDot(float clr){
    fill(clr, 100, 100);
    ellipse(x, y, 20, 20);
  }
  
  public void update(){
    x += random(-3,3);
    y += random(-3,3);
  }
  
  
}