class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;
 
  float bilde_rotate;
  float bilde_scale;
  float bw, bh;
  ///
  /// noen variabler er faste (slik som 'ship_rotate'), og noen blir styrt 'internt'
  ///
  PImage bilde;


  Bilde_ (float xp, float yp, float bi_sc, PImage img) {
    xpos = xp;
    ypos = yp;
   
    bilde_rotate = 0;
    bilde_scale = bi_sc;
    bilde = img;

    if (bilde.width * bilde_scale > 300) {
      bilde_scale *= 0.6;
      println("Bildet er stort, nedjustert scale!");
    }
    bw = bilde.width * bilde_scale;
    bh = bilde.height * bilde_scale;
  }


  void update() {

    pushMatrix();
    translate(width/2, 0);
    translate(xpos, ypos);
    rotate(bilde_rotate);
    image(bilde, -bw/2, -bh/2, bw, bh);
    popMatrix();
    ////

    ///// for å 'speile' bildet, legges det bare inn én gang til,
    ///// og 'flippes' over på siden ved å bruke scale(-1,1) ...

    pushMatrix();
    translate(width/2, 0);
    translate(-xpos, ypos);
    rotate(-bilde_rotate);
    scale(-1, 1);
    image(bilde, -bw/2, -bh/2, bw, bh);

    popMatrix();


    }
  }
