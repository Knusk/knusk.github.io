
Ufo_[] ufos = new Ufo_[40];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  for (int l=0; l<ufos.length-1; l++) {
    ufos[l] = new Ufo_(random(-100)-30, random(height), random(3)+.2, random(3)+.1, random(0.1,2));
  }
}



void draw() {
  background(170);

  rect(200, 200, 200, 200);
 
  /// ufos[0].update();
  /// ufos[1].update();
  /// ufos[2].update();
  
  for (int n=0; n<ufos.length-1; n++){
    ufos[n].update();
}
}
