PImage cat;
PImage newCat;
int pixel;
int[] bilde;
int dimension;
color argb;
int r, g, b, a;
int pix;
int rnd;

void setup() {
  size(800, 800);
  cat = loadImage("cat.png");
  dimension = cat.width * cat.height;
  newCat = createImage(cat.width, cat.height, ARGB);
  colorMode(ARGB);
  //cat.loadPixels();
  // bilde = new int[dimension];
}

void draw() {
  background(255);
  for (int j=1; j < cat.height; j++) {
    for (int i=0; i < cat.width; i++) {

      pixel = j*cat.width+i;


      argb = cat.pixels[pixel];
      a = (argb >> 24) & 0xFF;
      r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
      g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
      b = argb & 0xFF;


      if (random(100)>80) {
        if (r > 220 || g > 250 || b > 220 ) {
           rnd = (int)random(30);
          a += (int)random(5)-2;
          argb = color(222,0,0);
           pix = (pixel+(cat.width*rnd));
          if (random(100)<30) {
            pix += (int)random(10)-5;
           pix %= dimension;
           newCat.pixels[pix] = argb;
          }
          pix %= dimension;
          // println("pix = "+pix);
             //cat.pixels[pix]=argb;
             newCat.pixels[pix] = argb;
        }
      }
    }
  }
  cat.updatePixels();
  newCat.updatePixels();

 image(cat, 0, 0); /// når denne også vises, så ser vi originalen bak, noe som gir 'best' effekt spør du meg ... :)
 image(newCat,0,0);
  // println((cat.pixels[pixel] >> 8 & 0xFF));
}
