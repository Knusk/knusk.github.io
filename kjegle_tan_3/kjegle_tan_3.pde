
float v_1, v_2, v_3;

float l1;

float x1, x2, x3, x4, y1, y2, y3, y4;

float vStep;
float sinusV, sinusB;

int beamSteps;

void setup() {


  size(400, 400);


  l1 = 5; /// lengden rett nedover ...
  vStep = TAU/400;

  //// skal bruke en sinusbølge som vinkel til kjeglen ...

  sinusV = 0;  /// tenker å la denne øke hele tiden med vStep ...
  sinusB = 0;   /// denne bølgen blir resultatet av sin(sinusV)*n;
  beamSteps = 50;
  noStroke();
}


void draw() {


  background(220, 180, 180);




  sinusV += vStep;
  sinusB = sin(sinusV)*PI/4;

  println(sinusB);

  for (int l=1; l<beamSteps; l++) {
    pushMatrix();
    translate(width/2, 50);

    tan_line(sinusB, l1, l);

    popMatrix();
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
