
Bilde_[] bilder = new Bilde_[16];

void  setup() {

  size(800, 800);
  rectMode(CENTER);
  noStroke();
  
    //blendMode(DARKEST);
  
  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp, f_yp, f_xsp, f_ysp, f_bi_sc, bildenavn)
    bilder[l] = new Bilde_( 200, random(height)/2, random(1), loadImage("bilde_"+l+".png") );
  }
}



void draw() {
 background(255);
  
  for (int n=0; n<bilder.length; n++){
    bilder[n].update();
}

//println("xpos = " + bilder[9].xpos);
}
