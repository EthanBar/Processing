int numNodes=100;
vector[]nodes = new vector[numNodes];


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
        nodes[parent].calcVel();
        fill(map(nodes[parent].y,0,height,0,100),100,100);
        ellipse(nodes[parent].x,nodes[parent].y,20,20);
    }
}
