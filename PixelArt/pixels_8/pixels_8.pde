PImage cat;
PImage newCat;
int pixel;
int[] bilde;
int dimension;
float rnd;
int pix;
int r, g, b, a;
color argb;

void setup() {
  size(800, 800);
  cat = loadImage("cat.png");
  dimension = cat.width * cat.height;
  newCat = createImage(cat.width, cat.height, ARGB);
  colorMode(RGB);
  //cat.loadPixels();
  // bilde = new int[dimension];
}

void draw() {
  for (int j=1; j < cat.height; j++) {
    for (int i=0; i < cat.width; i++) {
      pixel = j*cat.width+i;
      argb = cat.pixels[pixel];
      a = (argb >> 24) & 0xFF;
      println(" a = "+a);
      r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
      g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
      b = argb & 0xFF;
      println(" b = "+b);

/*
      if (random(100)>30) {
        if (r < 20 || g > 20 || b < 20 ) {
          if (random(100)<22) {
            rnd = random(1)-2;
          } else {
            rnd = 1;
          }
        }
        if (random(100)<3) {
          pix += random(3)-1;
          pix %= dimension;
        }
      }*/
      argb = color(r, g, b);
      cat.pixels[pix]=argb;
      newCat.pixels[pix] = argb;
    }
  }
  
  a = 0;
  
//  pix = (pixel+cat.width);  // det er vel denne som eventuelt flytter pixlene nedover??
  pix %= dimension;
  

  // println("pix = "+pix);
  
  // newCat.pixels[pix] = 0xFFFFFF;
  cat.updatePixels();
  newCat.updatePixels();

  image(cat, 0, 0); /// når denne også vises, så ser vi originalen bak, noe som gir 'best' effekt spør du meg ... :)
 // image(newCat, 0, 0);
  // println((cat.pixels[pixel] >> 8 & 0xFF));
}
