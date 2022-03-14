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
background(100, 130, 200);
    for (int l = 0; l<20; l++) {
      fill(100+random(20), 160+random(30), 100+random(30));
      float el_size = random(200)+200;
      ellipse(random(l_width), l_height, el_size, el_size/2);
    }

    for (int n = 0; n<ant_traer; n++) {
      tre_1(n);
    }
    
    
    loadPixels();  /// tar et slags 'snapshot' av skjermen sånn den ser ut akkurat nå ... 
  }
  void tre_1(int _n) {
    int n = _n;
    pushMatrix();
    translate(random(l_width), l_height-(random(l_height/3)), -n*30);
    float size=10;
    stroke(100);
    fill(90,50,50);
    quad( 0, 0, size, 0, (size+size/5), (size*5), -(size/5), (size*5) );
    fill(120,200,120);
    ellipse(size/2,0, size*5,size*5);
    popMatrix();
  }

  void update() {
    background(100, 130, 200);
    
    //image(img,0,0);
    updatePixels();
  }

}
