Kjegle k1;


void setup(){

size(600,400);

k1 = new Kjegle(100, 100);
}



void draw(){
background(200,200,100);
k1.update(200,0);
}
