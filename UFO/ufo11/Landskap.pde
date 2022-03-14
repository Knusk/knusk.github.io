class Landskap {

  int l_width, l_height; /// how big is the landscape?

  int ant_traer; //// hvor mange trær skal vi ha med?

  PImage img;
  /// constructor

  Landskap(int w, int h, int ant) {

    l_width = w;
    l_height = h;
    ant_traer = ant;
    // img = createImage(l_width, l_height, RGB);
  }

  void generate_once() {
    background(30, 30, 100);

    pushMatrix();
    fill(100, 130, 80);
    translate(0, height, -500);
    rotateX(PI/2);
    rect(0, 0, width*5, 5*height);
    popMatrix();
    for (int n = 0; n<ant_traer; n++) {
      tre_1(n);
    }


    loadPixels();  /// tar et slags 'snapshot' av skjermen sånn den ser ut akkurat nå ...
  }
  void tre_1(int _n) {
    int n = _n;
    pushMatrix();
    translate(random(l_width*2)-l_width, l_height-50, -n*30);
    float size=10;
    noStroke();
    fill(90, 50, 50);
    quad( 0, 0, size, 0, (size+size/5), (size*5), -(size/5), (size*5) );
    stroke(100);
    fill(40, 100, 40);
    ellipse(size/2, 0, size*5, size*5);
    popMatrix();
  }

  void update() {
    background(40, 30, 60);
    //image(img,0,0);
    updatePixels();
  }
}
