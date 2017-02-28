ArrayList<Blob> blobs = new ArrayList<Blob>();
void setup(){
  size(1200,800, P2D);
  colorMode(HSB, 100);
  
  //init
  for (int i = 0; i < 5;i++){
    //blobs.add(new Blob());
  }
  
}

void draw(){
  background(0);
  //Draw nodes
  for (int parent = 0; parent < blobs.size(); parent++){
    Blob par = blobs.get(parent);
    float clr = map(parent, 0, blobs.size(), 0, 100);
    float cursorX = map(mouseX-width/2, -width/2, width/2, -10, 10);
    float cursorY = map(mouseY-height/2, -height/2, height/2, -10, 10);
    par.update(cursorX, cursorY);
    par.drawDot(clr);
    for (int child = 0; child < blobs.size(); child++){
      Blob chd = blobs.get(child);
      stroke(clr, 100, 100, 50);
      line(par.x, par.y, chd.x, chd.y);
    }
  }
}

void mouseClicked(){
  blobs.add(new Blob(mouseX, mouseY));
  
}