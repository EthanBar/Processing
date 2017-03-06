int numNodes=100;
vector[]nodes = new vector[numNodes];
player play = new player();

void setup(){
    size(600,600);
    colorMode(HSB,100);
    for (int node = 0; node < nodes.length; node++){
        nodes[node] = new vector(random(width), random(height));
    }
}

void draw(){
    background(0);
    noStroke();
    for(int parent = 0; parent < nodes.length; parent++){
        colorMode(HSB, 100);
        nodes[parent].calcVel();
        nodes[parent].drawEllipse();
    }
    if (keyPressed) {
        if (key == 'a'){
            if (play.x >= 15){
                play.x -= 10;
            }
        }
        if (key == 'd'){
            if (play.x <= width-15){
                play.x += 10;
            }
        }
    }
    colorMode(RGB, 100);
    fill(100,100,100);
    ellipse(play.x, play.y, 30, 30);
}
