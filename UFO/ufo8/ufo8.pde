Ufo_[] ufos = new Ufo_[40];
Landskap landskap;


void  setup() {

  size(800, 400);
  rectMode(CENTER);

  noStroke();
  landskap = new Landskap(width, height, 20);
  for (int l=0; l<ufos.length-1; l++) {
    ufos[l] = new Ufo_(random(-width)-30, random(3)+.1, .1*l, random(3)+.1, l*0.03 );
  }
  landskap.generate_once();
}



void draw() {

  landskap.update();
  for (int n=0; n<ufos.length-1; n++) {
    ufos[n].update();
  }
}
