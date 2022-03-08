
Ufo_ ufo1, ufo2, ufo3;

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  ufo1 = new Ufo_(-100, 40, 3, 1);
  ufo2 = new Ufo_(-70, 140, 4, 0.5);
  ufo3 = new Ufo_(-20, 10, 2, 1.5);
}


void draw() {
  background(170);
 // ufo_go = true;

  rect(200, 200, 200, 200);
  //ufo();
  ufo1.update();
   ufo2.update();
    ufo3.update();
}



 
