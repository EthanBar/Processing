// Global variables
float pr;
float ph;
int lines = 30;
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
    cursor(HAND);
    float colar = map(abs(mx) + abs(my), 0, (width + height), 0, 250);
    stroke(colar, 100, 100);
    float hgt = sqrt(mx * mx + my * my); // Pythagorean theorem
    float cl = 360/lines;
    float rad = getRad();
    for (int i=1; i <= lines; i++){    
      float trad = rad - (cl*i);
      float tprad = pr - (cl*i);
      float ty = (hgt) * cos(radians(trad));
      float tx = (hgt) * sin(radians(trad));
      float ppy = (ph) * cos(radians(tprad));
      float ppx = (ph) * sin(radians(tprad));
      line(tx, ty, ppx, ppy);
      println(i);
    }
    pr = rad;
    ph = hgt;
  } else if (mousePressed == true){
    cursor(HAND);
    float rad = getRad();
    pr = rad;
    ph = sqrt(mx * mx + my * my);
    first = false;
  } else {
    first = true;
    cursor(ARROW);
  }
  
}

public float getRad(){
  float rad;
  if (mouseY - height/2 < 0) {
    if (mouseX - width/2 < 0){
      rad = (360 - abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2)))));
    } else {
      rad = (abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2))))); // It works?
    }
  } else {
    rad = (360 - degrees(atan2(-(mouseX-(height/2)), mouseY-(width/2)))); // Thanks trig
  }
  return rad;
}

void keyPressed() {
  if ((key == 'R') || (key == 'r')) {
    background(0);
  }
  if (keyCode == UP) {
    lines += 1;
    println(lines);
  }
  if (keyCode == DOWN) {
    if (lines > 1) {
    lines -= 1;
    println(lines);
    }
  }
}

// TODO: Organize and comment