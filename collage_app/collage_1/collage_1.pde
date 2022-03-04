
Bilde_[] bilder = new Bilde_[4];

void  setup() {

  size(400, 400);
  rectMode(CENTER);
  noStroke();
  for (int l=0; l<bilder.length-1; l++) {
    ////            Bilde_(float xp,      float yp,       float xsp,   float ysp,  float bi_sc, PImage img)
    bilder[l] = new Bilde_(random(width), random(height), random(3)-3, random(3)-3, 1,    loadImage("eple.tif")          );
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
  
  for (int n=0; n<bilder.length-1; n++){
    bilder[n].update();
}
}
