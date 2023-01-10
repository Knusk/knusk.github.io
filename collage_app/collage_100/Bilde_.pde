class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;

  PImage bilde;


  Bilde_ (float xp, float yp,  PImage img) {
    xpos = xp;
    ypos = yp;
    bilde = img;
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update(float xpos, float ypos) {

    pushMatrix();
    translate(width/2, 0);
    translate(xpos, ypos);
     scale(0.2, 0.2);
    image(bilde, 0,0);
    popMatrix();

    ///// for å 'speile' bildet, legges det bare inn én gang til,
    ///// og 'flippes' over på siden ved å bruke scale(-1,1) ...

    pushMatrix();
    translate(width/2, 0);
    translate(-xpos, ypos);
    scale(-0.2, 0.2);
    image(bilde, 0,0);
    popMatrix();
  }
}
