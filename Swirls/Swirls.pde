float px;
float py;
boolean first = true;
void setup(){
  size(600,600);
  background(0);
  colorMode(HSB, 100);
  strokeWeight(2);
  px = mouseX;
  py = mouseY;
}

void draw() {
  translate(width/2, height/2);
  float mx = map(mouseX, 0, width, -width/2, width/2);
  float my = map(mouseY, 0, height, -height/2, height/2);
  if (mousePressed == true && !first) {
    float colar = map(abs(mx) + abs(my), 0, width, 0, 120);
    println(colar, 100, 100);
    stroke(colar, 100, 100);
    /*line(px, py, mx, my);   // This was a mistake, but still
    line(-px, -py, mx, my);   // an intresting one.
    line(px, py, -mx, -my);
    line(-px, -py, -mx, -my);
    */
    line(px, py, mx, my);
    line(-px, py, -mx, my);
    line(px, -py, mx, -my);
    line(-px, -py, -mx, -my);
    px = mx;
    py = my;
  } else if (mousePressed == true){
    px = mx;
    py = my;
    first = false;
  } else {
    first = true;
  }
}