float x1, x2, x3, x4, y1, y2, y3, y4;
float sinx = 0;
float sinstep = .1;
float sinval = -PI;
boolean lights_on = false;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  x1 = 70;
  x2 = 100;
  x3 = 130;
  x4 = 40;
  y1 = 30;
  y2 = 30;
  y3 = 200;
  y4 = 200;
}


void draw() {
  background(230, 190, 190);
  stroke(0);
  fill(30,30,100);
  rect(200, 200, 200, 200);
  kjegle();
}


void kjegle() {

  sinx = sin(sinval)*60;
  sinval += sinstep;
  if (floor(random(200)) < 20 ) {
    x3 += sinx;
    x4 += sinx;
    if (x3 > 230 || x3 < 30) {
      x3 = 130;
      x4 = 40;
    }
  }

  if (floor(random(100))==1) {
    lights_on = !lights_on;
  }
  if (lights_on) {
    noStroke();
    fill(230,230,0,140);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
}
