float pr;
float ph;
boolean first = true;
void setup(){
  size(600,600);
  background(0);
  colorMode(HSB, 100);
  strokeWeight(2);
  pr = 0;
  ph = 0;
}

void draw() {
  translate(width/2, height/2);
  float mx = map(mouseX, 0, width, -width/2, width/2);
  float my = map(mouseY, 0, height, -height/2, height/2);
  if (mousePressed == true && !first) {
    float colar = map(abs(mx) + abs(my), 0, width, 0, 120);
    stroke(colar, 100, 100);
    float hgt = sqrt(mx * mx + my * my); // Pythagorean theorem
    float rad = 0;
    int lines = 21;
    float cl = 360/lines;
    if (mouseY - height/2 < 0) {
      rad = (abs(degrees(atan2(mouseX-(height/2), mouseY-(width/2))))); // It works?
    } else {
      rad = (360 - degrees(atan2(mouseX-(height/2), mouseY-(width/2)))); // Thanks trig
    }
    for (int i=1; i <= lines; i++){    
      float trad = rad - (cl*i);
      float tprad = pr - (cl*i);
      float tx = (hgt) * cos(radians(trad));
      float ty = (hgt) * sin(radians(trad));
      float ppx = (ph) * cos(radians(tprad));
      float ppy = (ph) * sin(radians(tprad));
      line(tx, ty, ppx, ppy);
    }
    pr = rad;
    ph = hgt;
  } else if (mousePressed == true){
    float rad = 0;
    if (mouseY - height/2 < 0) {
      rad = (abs(degrees(atan2(mouseY-(height/2), mouseX-(width/2))))); // It works?
    } else {
      rad = (360 - degrees(atan2(mouseY-(height/2), mouseX-(width/2)))); // Thanks trig
    }
    pr = rad;
    ph = sqrt(mx * mx + my * my);
    first = false;
  } else {
    first = true;
  }
  
}
// TODO: Organize and comment