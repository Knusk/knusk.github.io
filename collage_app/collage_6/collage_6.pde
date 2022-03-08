
Bilde_[] bilder = new Bilde_[12];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  noStroke();
  
  blendMode(MULTIPLY);
  
  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp,          f_yp,           f_xsp,        d_ysp,  f_bi_sc,  img)
    bilder[l] = new Bilde_(random(width), random(height), 1,            1,       .2,      loadImage("bilde_"+l+".png") );
  }
}



void draw() {
  background(120,120,120);
  
  for (int n=0; n<bilder.length; n++){
    bilder[n].update();
}
}
