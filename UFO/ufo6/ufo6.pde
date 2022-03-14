
Ufo_[] ufos = new Ufo_[40];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  noStroke();
  for (int l=0; l<ufos.length-1; l++) {
    ufos[l] = new Ufo_(random(-width)-30, random(3)+.1, .1*l, random(3)+.1, l*0.03 );
  }
}



void draw() {
  background(0,0,100);
  fill(100,160,100);
  ellipse(400,300,400,400);
  ellipse(200,400,200,400);
  fill(80,150,70);
  ellipse(200,400,200,400);
fill(50,100,40);
ellipse(-100,350,600,200);
  ellipse(350,400,400,300);
 
  /// ufos[0].update();
  /// ufos[1].update();
  /// ufos[2].update();
  
  for (int n=0; n<ufos.length-1; n++){
    ufos[n].update();
}
}
