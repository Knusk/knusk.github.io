class Ufo_ {
Kjegle2 k;
  float xpos;
  float ypos;
  float yretn;
 // boolean ufo_go;
  boolean ufo_light;
  float xspeed, yspeed, tmp_xspeed;
  PShape ufo_shape;
  float ship_rotate;
  float ship_scale;
  ///
  /// noen variabler er faste (slik som 'ship_rotate'), og noen blir styrt 'internt'
  ///
  Ufo_ (float xp, float yp, float xsp, float ysp, float sh_sc) {
    xpos = xp;
    ypos = yp;
    xspeed = xsp;
    yspeed = ysp;
    tmp_xspeed = xspeed;
    ship_rotate = random(0.2)+0.1;
    ship_scale = sh_sc;
    ufo_shape = loadShape("ufo.svg");  // svg-fil lagret i 'data' ...
    k = new Kjegle2(0, 0, ship_scale);
  }

  /// intern funksjon som tar seg av 'kjøringa' ...

  void update() {
      xpos += xspeed*ship_scale;
      ypos += yspeed*ship_scale;

      k.update(xpos, ypos);
      fill(200, 100, 100);
      pushMatrix();
      translate(xpos, ypos);
      rotate(ship_rotate);
      shape(ufo_shape, -25*ship_scale, -25*ship_scale, 50*ship_scale, 50*ship_scale);
      popMatrix();
      fill(255, 255, 255);
    ////

    if (floor(random(40))==10) {
      yspeed *= -1;
      xspeed = 0;
      ship_rotate *= -1;
    }

    if (floor(random(40))==12) {
      xspeed = tmp_xspeed*ship_scale;
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
