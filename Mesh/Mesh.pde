int cols, rows;
int scale = 20;
float [][] terrain;
float flying = 0;
int w = 1200;
int h = 1200;

float smooth = 0.1;
float hgt = 100;

void setup(){
  size(600, 600, P3D);
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
}

void draw(){
  
  flying -= smooth;
  //Z value calculate
  float yoff = flying;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for (int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff,yoff), 0, 1, -hgt, hgt);
      xoff += smooth;
    }
    yoff += smooth;
  }
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2,height/2+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  for (int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    smooth += 0.01;
  }
  if (keyCode == LEFT) {
    if (smooth > 0.01) {
      smooth -= 0.01;
    }
  }
  if (keyCode == UP) {
    hgt += 10;
  }
  if (keyCode == DOWN) {
    if (hgt > 10) {
      hgt -= 10;
    }
  }
}