class Kjegle {

  float x1, x2, x3, x4, y1, y2, y3, y4;
  float sinx = 0;
  float sinstep = .1;
  float sinval = -PI;
  boolean lights_on = false;
  float posx, posy;  // greit å ha en 'root'-posisjon

  Kjegle(float xpos, float ypos)
  {
    posx = xpos;
    posy = ypos;
    x1 = posx-5;
    x2 = posx+5;
    x3 = posx+50;
    x4 = posx-50;
    y1 = posy;
    y2 = posy;
    y3 = posy+200;
    y4 = posy+200;
  }





  void update(float xpos, float ypos) {
    posx = xpos;
    posy = ypos;

    sinx = sin(sinval)*60;
    sinval += sinstep;
    if (floor(random(200)) < 20 ) {
      x3 += sinx;
      x4 += sinx;
      if (x3 > 130 || x3 < -130) {
        x3 = 130;
        x4 = 40;
      }
    }
   if (floor(random(100))==1 && lights_on) {
      lights_on = !lights_on;
    }

    if (floor(random(300))==1 && !lights_on) {
      lights_on = !lights_on;
    }
    if (lights_on) {
      noStroke();
      fill(230, 230, 0, 140);
      pushMatrix();
      translate(posx, posy);
      quad(x1, y1, x2, y2, x3, y3, x4, y4);
      popMatrix();
    }
  }
}
