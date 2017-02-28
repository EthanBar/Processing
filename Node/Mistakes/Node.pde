Blob[] blobs = new Blob[10];
void setup(){
  background(0);
  size(1200,800);
  colorMode(HSB, 100);
  
  //init
  for (int i = 0; i < blobs.length;i++){
    blobs[i] = new Blob();
  }
  
}

void draw(){
  //Draw nodes
  for (int parent = 0; parent < blobs.length; parent++){
    float clr = map(parent, 0, blobs.length, 0, 100);
    blobs[parent].update();
    blobs[parent].drawDot(clr);
    for (int child = 0; child < blobs.length; child++){
      stroke(clr, 100, 100, 50);
      line(blobs[parent].x, blobs[parent].y, blobs[child].x, blobs[child].y);
    }
  }
}