
Bilde_[] bilder = new Bilde_[12];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  noStroke();
  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(float xp,      float yp,       float xsp,   float ysp,  float bi_sc, PImage img)
    bilder[l] = new Bilde_(random(width), random(height), random(3)-3, random(3)-3, 1,    loadImage("bilde_"+l+".png")          );

  }
}



void draw() {
  background(0,0,100);


  for (int n=0; n<bilder.length; n++){

    bilder[n].update();
}
}
