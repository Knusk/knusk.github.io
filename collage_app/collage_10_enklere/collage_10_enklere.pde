
Bilde_[] bilder = new Bilde_[16];

void  setup() {

  size(800, 800);
  rectMode(CENTER);
  noStroke();

  //blendMode(DARKEST);

  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp, f_yp, f_xsp, f_ysp, f_bi_sc, bildenavn)
    bilder[l] = new Bilde_( random(200), random(height)/2, 0.2, loadImage("bilde_"+l+".png") );
  }

 
}



void draw() {
  background(255);
 bilder[0].xpos = 0;
  bilder[0].ypos = height-300;
  bilder[14].xpos = 100;
  bilder[14].ypos = 700;
  bilder[14].bilde_scale = 0.05;
  for (int n=0; n<bilder.length; n++) {
    bilder[n].update();
  }

  //println("xpos = " + bilder[9].xpos);
}

void keyPressed() {


  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp, f_yp, f_xsp, f_ysp, f_bi_sc, bildenavn)
    bilder[l].xpos = random(200);
    bilder[l].ypos = random(height)/2;
    bilder[l].bilde_scale = random(0.2)+0.1;
    bilder[l].bilde_rotate = random(TAU);
  }
}
