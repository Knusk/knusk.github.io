class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;
  float bb, bh;
  float scale;
  PImage bilde;
  

  Bilde_ (float xp, float yp,  PImage img) {
    xpos = xp;
    ypos = yp;
    bilde = img;
    scale = 0.2;
    bb = bilde.width*scale;
    bh = bilde.height*scale;
    println(bilde.width);
  }

  void update() {
    pushMatrix();
    translate(width/2, 0);
    image(bilde, xpos,ypos, bb, bh);
    popMatrix();
    
    pushMatrix();
    translate(width/2, 0);
    scale(-1,1);
    image(bilde, xpos,ypos, bb, bh);
    popMatrix();
    
    ypos = ypos + 2;
    
    if ( ypos > 800 ){
       ypos = 200;
       xpos += random(200)-100;
    }
  }
}
