// Global variables
float pr;
float ph;
boolean first = true; // Don't draw a line when the user clicks again

void setup(){
  size(600,600);
  //fullScreen();
  background(0);
  colorMode(HSB, 100); // HSB is easier to work with polar cords. than RGB
  strokeWeight(2);
  pr = 0; 
  ph = 0;
}

void draw() {
  translate(width/2, height/2); // Set (0, 0) as the center
  float mx = map(mouseX, 0, width, -width/2, width/2);
  float my = map(mouseY, 0, height, -height/2, height/2);
  if (mousePressed == true && !first) {
    float colar = map(abs(mx) + abs(my), 0, (width + height), 0, 250);
    stroke(colar, 100, 100);
    float hgt = sqrt(mx * mx + my * my); // Pythagorean theorem
    int lines = 1;
    float cl = 360/lines;
    float rad = getRad();
    for (int i=1; i <= lines; i++){    
      float trad = rad - (cl*i);
      float tprad = pr - (cl*i);
      float ty = (hgt) * cos(radians(trad));
      float tx = (hgt) * sin(radians(trad));
      float ppx = (ph) * cos(radians(tprad));
      float ppy = (ph) * sin(radians(tprad));
      println(tx, ty);
      if (tx >= 0 && ty >= 0){
        tx = -tx;
        ty = -ty;
      }
      line(tx, ty, ppx, ppy);
    }
    pr = rad;
    ph = hgt;
  } else if (mousePressed == true){
    float rad = getRad();
    pr = rad;
    ph = sqrt(mx * mx + my * my);
    first = false;
  } else {
    first = true;
  }
  
}

public float getRad(){
  float rad;
  if (mouseY - height/2 < 0) {
    rad = (abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2))))); // It works?
    if (mouseX - width/2 < 0){
      rad = (360 - abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2)))));
    }
  } else {
    rad = (360 - degrees(atan2(mouseX-(height/2), mouseY-(width/2)))); // Thanks trig
  }
  return rad;
}

void keyPressed() {
  if ((key == 'R') || (key == 'r')) {
    background(0);
  }
}

// TODO: Organize and comment