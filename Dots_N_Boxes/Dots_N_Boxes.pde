int rows = 7;
int cols = 7;
Boxes[] boxes = new Boxes[cols * rows];
void setup(){
  size(600,600);
  background(255);
  stroke(0);
  for (int x = 1; x < rows; x++){
    for (int y = 1; y < cols; y++){
      boxes[(rows*x)+y] = new Boxes(x,y);
    }
  }
}

void draw(){
  for (int x = 1; x < rows; x++){
    for (int y = 1; y < cols; y++){
      float nx = map(x, 0, rows, 0, width);
      float ny = map(y, 0, cols, 0, height);
      fill(0);
      ellipse(nx, ny, 10, 10);
      
    }
  }
}