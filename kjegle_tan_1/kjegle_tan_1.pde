
float v1, v2, v_1, v_2, v_3;

float l1;

float x1, x2, x3, x4, y1, y2, y3, y4;

float vStep;

int beamSteps;

void setup() {


  size(400, 400);

  v1 = .3;  // radianer ...
  v2 = 0;
  l1 = 10; /// lengden rett nedover ...
  vStep = TAU/400;
  beamSteps = 30;
  noStroke();
}


void draw() {


  background(220, 180, 180);

 l1 = 10;
  v1 %= PI/2;
  
  v2 = v1-PI/4;
  v1 += vStep;

  for (int l=1; l<beamSteps; l++) {
    pushMatrix();
    translate(width/2, 50);

   // stroke(200, 0, 0);
    tan_line(v2, l1, l);

    popMatrix();

    //l1 += 10;
    
  }
  
 
}


void tan_line(float vinkel, float lengde, int count) {

  int n = count;
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
fill(250,250,20,255-(255/beamSteps*(n+1)) );
  quad(x1, y1, x2, y2, x3,y3, x4, y4);
  
 
}
