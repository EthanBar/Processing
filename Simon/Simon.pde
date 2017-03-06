import java.util.*;
ArrayList<Integer> colors = new ArrayList<Integer>();
Integer[] clr = {255,255,0};

void setup() {
    size(500,500);
    colors.add(5);
    rectMode(CENTER);
}


void draw(){
    background(0);
    drawRect();
}

void drawRect() {
    for (int i = 0;i < colors.size();i++){
        for (int c = 0; c < 4;c++){
                if (colors.get(i) == c){
                    fill(clr[0],clr[1],clr[2]);
                } else{
                    fill(255);
                }
                rect(0,0,100,100);

            }
        }
}
