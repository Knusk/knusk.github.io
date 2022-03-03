float xpos;
float ypos;
float yretn;
boolean init_ufo;
boolean ufo_go;
float xspeed;
PShape ufo_shape;
boolean ufo_light;
float ship_rotate;


void  setup() {

  size(400, 400);
  rectMode(CENTER);
  init_ufo = false;
  yretn = 0.5;
  xspeed = 2;
  ship_rotate = 0.2;
  ufo_shape = loadShape("ufo.svg");
}


void draw() {
  background(170);
  ufo_go = true;

  rect(200, 200, 200, 200);
  ufo();
}



void ufo() {

  if (!init_ufo) {
    xpos = -100;
    ypos = 50;
    init_ufo=true;
  } else {
    xpos += xspeed;
    ypos += yretn;
    fill(200, 100, 100);
    pushMatrix();
    translate(xpos+50, ypos+50);
    rotate(ship_rotate);
    shape(ufo_shape, 0, 0, 50, 50);
    popMatrix();
    fill(255, 255, 255);
  }

  if (floor(random(40))==10) {
    yretn *= -1;
    xspeed = 0;
    ship_rotate = -0.1;
  }

  if (floor(random(40))==12) {
    xspeed = 2;
    ship_rotate = 0.1;
  }

  if (floor(random(100))==3) {
    ufo_light = true;
  } else {
    ufo_light = false;
  }

  if (xpos > width*2) {
    xpos = -100;
    ypos = 50;
  }
}
