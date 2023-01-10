float xp,yp;  // verdier som kan brukes for å oppdatere posisjonen

Bilde_[] bilder = new Bilde_[16];

void  setup() {

  size(800, 800);
  rectMode(CENTER);
  noStroke();
  
    blendMode(DARKEST);
  
  for (int l=0; l<bilder.length; l++) {
    ////            Bilde_(f_xp, f_yp, bildenavn)
    bilder[l] = new Bilde_( -200+random(width)/2, l*40, loadImage("bilde_"+l+".png") );
  }
}



void draw() {
 background(240,240,240);
  
  for (int n=0; n<bilder.length; n++){
    xp = random(width/2)-width/2;
    yp = random(height);
    bilder[n].update(xp, yp);
}
noLoop();
//println("xpos = " + bilder[9].xpos);
}


void keyPressed(){
  
  loop();
}
