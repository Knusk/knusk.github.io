class Bilde_ {

  float xpos; /// xpos og ypos er koordinatene til akkurat hvor bildet er
  float ypos;
  float yretn;   /// yretn og xretn sier noe om bevegelsen går opp eller ned høyre eller venstre
  float xretn;

  float xspeed, yspeed, tmp_xspeed;  //// xspeed er farten bildet beveger seg på x-aksen, samme for yspeed, men altså på yaksen ...

  float bilde_rotate;
  float bilde_rotate_step;
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
    bilde_rotate_step = 0; // (random(1)-0.5)/80;
    bilde_scale = bi_sc;
    bilde = img;

    bw = bilde.width * bilde_scale;
    bh = bilde.height * bilde_scale;
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update() {


    bilde_rotate += bilde_rotate_step;
    xpos += xspeed;
    ypos += yspeed;

    pushMatrix();
   translate(width/2,0);
    translate(xpos, ypos);
     rotate(bilde_rotate);
    image(bilde, -bw/2, -bh/2, bw, bh);
    popMatrix();
    ////
    pushMatrix();
    translate(width/2,0);
    translate(-xpos, ypos);
    rotate(-bilde_rotate);
    scale(-1, 1);
    image(bilde, -bw/2, -bh/2, bw, bh);
   // fill(230,200,200);
   //  rect(0,0,bw,bh);
    popMatrix();



    if (xpos > width || (ypos < -200 && yspeed < 0) || ( ypos > height*2 && yspeed > 0 )) {
      xspeed = random(2);   // her får bildet en ny fart i x-retningen ...
      ypos = random(height);  // en tilfeldig plassering på y-aksen
      xpos = (-width/2)-bw;    /// prøver å plassere bildet på utsiden av 'framen' ...
      yspeed = random(2)-1;
      bilde_rotate_step = random(1)>0.5 ? random(.02) : random(-.002) ;
    }
  }
}
