class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;
  float yretn;   /// yretn og xretn sier noe om bevegelsen går opp eller ned høyre eller venstre
  float xretn;

  float xspeed, yspeed, tmp_xspeed;  //// xspeed er farten bildet beveger seg på x-aksen, samme for yspeed, men altså på yaksen ...

  float bilde_rotate;
  float bilde_scale;
  float bw, bh;
  ///
  /// noen variabler er faste (slik som 'ship_rotate'), og noen blir styrt 'internt'
  ///
  PImage bilde;


  Bilde_ (float xp, float yp, float xsp, float ysp, float bi_sc, PImage img) {
    xpos = xp;
    ypos = yp;
    xspeed = xsp;
    yspeed = ysp;
    tmp_xspeed = xspeed;
    bilde_rotate = random(TAU);
    bilde_scale = bi_sc;
    bilde = img;

    bw = bilde.width * bilde_scale;
    bh = bilde.height * bilde_scale;
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update() {



    //xpos += xspeed;
    //ypos += yspeed;

    pushMatrix();
    translate(xpos, ypos);
    //rotate(bilde_rotate);
    image(bilde, 0, 0, bw, bh);
    popMatrix();
    ////
    pushMatrix();
    translate(xpos, ypos);
    //rotate(bilde_rotate);
    scale(-1, 1);
    image(bilde, 0, 0, bw, bh);
    popMatrix();



    if (xpos > width+bw) {
      xpos = random(width);
      ypos = random(height);
    }
  }
}
