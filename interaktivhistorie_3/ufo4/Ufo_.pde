class Ufo_ {
Kjegle k;
  float xpos;
  float ypos;
  float yretn;
 // boolean ufo_go;
  boolean ufo_light;
  float xspeed, yspeed;
  PShape ufo_shape;
  float ship_rotate;
  ///
  /// noen variabler er faste (slik som 'ship_rotate'), og noen blir styrt 'internt'
  ///
  Ufo_ (float xp, float yp, float xsp, float ysp) {
    xpos = xp;
    ypos = yp;
    xspeed = xsp;
    yspeed = ysp;
    ship_rotate = random(0.2)+0.1;
    ufo_shape = loadShape("ufo.svg");  // svg-fil lagret i 'data' ...
    k = new Kjegle(0, 0);
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update() {
      xpos += xspeed;
      ypos += yspeed;

      k.update(xpos, ypos);
      fill(200, 100, 100);
      pushMatrix();
      translate(xpos, ypos);
      rotate(ship_rotate);
      shape(ufo_shape, -25, -25, 50, 50);
      popMatrix();
      fill(255, 255, 255);
    ////

    if (floor(random(40))==10) {
      yspeed *= -1;
      xspeed = 0;
      ship_rotate *= -1;
    }

    if (floor(random(40))==12) {
      xspeed = 2;
      ship_rotate *= -1;
    }

    if (floor(random(100))==3) {
      ufo_light = true;
    } else {
      ufo_light = false;
    }

    if (xpos > width*2) {
      xpos = -100;
      ypos = random(height);
    }
  }
}
