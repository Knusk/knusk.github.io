
Bilde_[] bilder = new Bilde_[12];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  noStroke();
  
   blendMode(LIGHTEST);
  
  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp,          f_yp,           f_xsp,               d_ysp,     f_bi_sc,     img               )
    bilder[l] = new Bilde_(random(width), random(height), random(2)-1,            1,       .25,      loadImage("bilde_"+l+".png") );
  }
}



void draw() {
 background(240,100,100);
  
  for (int n=0; n<bilder.length; n++){
    bilder[n].update();
}

//println("xpos = " + bilder[9].xpos);
}
