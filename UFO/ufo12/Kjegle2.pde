class Kjegle2 {
  boolean lights_on = false;
  float posx, posy;  // greit å ha en 'root'-posisjon
  float shipscale;

  float v_1, v_2, v_3;
  float l1;
  float x1, x2, x3, x4, y1, y2, y3, y4;
  float vStep;
  float sinusV, sinusB;

  int beamSteps;

  // constructor
  Kjegle2(float xpos, float ypos, float ship_scale) {
    posx = xpos;
    posy = ypos;
    shipscale = ship_scale;
    l1 = 5*shipscale; /// lengden rett nedover ganget med shipscale ...
    vStep = TAU/200;
    //// skal bruke en sinusbølge som vinkel til kjeglen ...
    sinusV = random(TAU);  /// tenker å la denne øke hele tiden med vStep ...
    sinusB = 0;   /// denne bølgen blir resultatet av sin(sinusV)*n;
    beamSteps = 50;
  }


  void update(float posx, float posy, float ship_rot) {
    if (!lights_on) { /// lyset er av, skal vi skru det på?
      if (floor(random(1000))==1) {  // ok, vi skrur det på ...
        lights_on = true;
      }
    } else {   /// det må bety at lyset per nå er på, skal vi skru det av?
      if (floor(random(300))==1) {   /// lyset skal være mere av enn på ...
        lights_on = false;
      }
    }
    if (lights_on) {
      sinusV += vStep;  /// med større vStep vil kjeglen pendle raskere ...
      sinusB = sin(sinusV)*PI/4;
      noStroke();
      //println(sinusB);
      for (int l=1; l<beamSteps; l++) {
        pushMatrix();
        translate(posx, posy);
        rotate(ship_rot);
        tan_line(sinusB, l1, l);
        popMatrix();
      }
    }
  }

  void tan_line(float vinkel, float lengde, int count) {
    //stroke(0);
    int n = count;
    float factor = (n*255/beamSteps);
    l1 = lengde;
    v_1 = vinkel;
    v_2 = v_1 + PI/8;
    v_3 = v_1 - PI/8;
    x1 = tan(v_3)*l1*n;
    x2 = tan(v_2)*l1*n;
    x3 = tan(v_2)*l1*(n+1);
    x4 = tan(v_3)*l1*(n+1);
    y1 = l1*n;
    y2 = l1*n;
    y3 = l1*(n+1);
    y4 = l1*(n+1);
    fill(250, 255-factor, factor, 255-factor );
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}
