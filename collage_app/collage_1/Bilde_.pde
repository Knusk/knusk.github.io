class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;
  float yretn;   /// yretn og xretn sier noe om bevegelsen går opp eller ned høyre eller venstre
  float xretn;

  float xspeed, yspeed, tmp_xspeed;  //// xspeed er farten bildet beveger seg på x-aksen, samme for yspeed, men altså på yaksen ...

  float bilde_rotate;
  float bilde_scale;
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
    bilde_rotate = random(0.2)+0.1;
    bilde_scale = bi_sc;
    bilde = img;
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update() {
      xpos += xspeed*bilde_scale;
      ypos += yspeed*bilde_scale;


      pushMatrix();
      translate(xpos, ypos);
      rotate(bilde_rotate);
      image(bilde, 0, 0);
      popMatrix();
      fill(255, 255, 255);
    ////

    if (floor(random(40))==10) {
      yspeed *= -1;
      xspeed = 0;
      bilde_rotate *= -1;
    }

    if (floor(random(40))==12) {
      xspeed = tmp_xspeed*bilde_scale;
      bilde_rotate *= -1;
    }



    if (xpos > width*2) {
      xpos = -100;
      ypos = random(height);
    }
  }
}
