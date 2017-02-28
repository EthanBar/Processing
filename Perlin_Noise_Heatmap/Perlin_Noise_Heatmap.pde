/* This sketch uses perlin noise to generate a trangle strip mesh,
where it's hue is determined by it's z cordinate.*/

// EDIT THESE
float moveSpeed = 0;
int resolution = 100; // How many collums and rows
int scale = 200; // Higher values = smoother, larger terrain
int peakHeight = 500; // Higher values = more extreme valleys/mountains

// Leave alone
float[][] terrain; // Store Z cordinates, generated through perlin noise
int cols, rows;
int cx = scale/2; // Camera
int cy = scale/2; // position
int cz = 0;       // variables

void setup() {
  cols = resolution;
  rows = resolution;
  size(800,600, P3D);
  //noiseSeed(0); // Use this to set a custom seed
  colorMode(HSB,100); /// Hue saturation brightness instead of RGB
  terrain = new float[cols][rows+1];
  // This calculates the Z cordinates, move to draw() to manipulate it
}

void draw() {
  background(0);
  noStroke();
  moveSpeed -= 0.05;
    float yoff = 0;
   for (int y = 0; y < rows+1; y++){
    float xoff = 0;
    for (int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff,yoff+moveSpeed), 0, 1, -peakHeight, 0); //Props to Ryan here
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  for (int y = 0; y < rows; y++){
    beginShape(TRIANGLE_STRIP);
    float ty = map(y, 0, rows, 0, scale);
    float ty2 = map(y+1, 0, rows, 0, scale);
    for (int x = 0; x < cols; x++){
      float tx = map(x, 0, cols, 0, scale);
      fill(map(terrain[x][y],-peakHeight,0,-40,140),100,100); // Set our heatmap
      vertex(tx, ty, terrain[x][y]);
      vertex(tx, ty2, terrain[x][y+1]);
    }
    endShape();
  }
  /*float lookZ, lookX;
  //float rad = getRad();
  //lookZ = 5 * cos(radians(rad));
  lookX = 5 * sin(radians(rad));*/
  camera(cx, cy, cz, cx, cy+100, cz-10 , 0.0, 1.0, 0.0);
  
  //Detect for keypress
  if (keyPressed) {
    if (key == ' ') {
      cz -= 10;
    }
    if (keyCode == UP) {
      cy += 10;
    }
    if (keyCode == DOWN) {
      cy -= 10;
    }
    if (keyCode == LEFT) {
      cx -= 10;
    }
    if (keyCode == RIGHT) {
      cx += 10;
    }
    if (keyCode == SHIFT) {
      cz += 10;
    }
    
  }
}
/*
public float getRad(){
  float rad;
  if (mouseY - height/2 < 0) {
    if (pythag(mouseX) - width/2 < 0){
      rad = (360 - abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2)))));
    } else {
      rad = (abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2))))); // It works?
    }
  } else {
    rad = (360 - degrees(atan2(-(mouseX-(height/2)), mouseY-(width/2)))); // Thanks trig
  }
  return rad;
}

public float pythag(float x){
  return sqrt(100 - x*x);
}*/