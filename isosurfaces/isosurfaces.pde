
void setup(){
  size(600,600);
  colorMode(HSB, 100);
}

void draw(){
  background(0);
  
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < width; y++){
      int index = x + y * width;
      float d = dist(x, y, width/2, height);
      float dm = map(d, 0, dist(0, 0, width/2, height/2), 0, 100);
      //pixels[index] = color(dm, 100, 100);
      println(pixels[index]);
    }
  }
}