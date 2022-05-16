PImage cat;
PImage newCat;
int pixel;
int[] bilde;
int dimension;

void setup() {
  size(800, 800);
  cat = loadImage("cat.png");
  dimension = cat.width * cat.height;
  newCat = createImage(cat.width, cat.height, ARGB);
  
  //cat.loadPixels();
 // bilde = new int[dimension];
}

void draw() {
  for (int j=1; j < cat.height; j++) {
    for (int i=0; i < cat.width; i++) {

      pixel = j*cat.width+i;

      //if (random(100)<5){
      //cat.pixels[(pixel+(cat.width+(int)random(2)*(int)(random(4)-2)))%dimension]=cat.pixels[pixel];
      //}
      color argb = cat.pixels[pixel];
int a = (argb >> 24) & 0xFF;
int r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
int g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
int b = argb & 0xFF;  
      
      
      if (random(100)>1) {
        if (r < 60 && g < 60 && b < 60 ) {
          int rnd = (int)random(2);
          a = 200;
          argb = color(r,g,b,r);
          int pix = (pixel+(cat.width*rnd));
          if (random(100)<3){
            pix += (int)random(3)-1;
            pix %= dimension;
            newCat.pixels[pix] = argb;
          }
          pix %= dimension;
          // println("pix = "+pix);
          cat.pixels[pix]=argb;
          // newCat.pixels[pix] = 0xFFFFFF;
        }
      }
    }
  }
  cat.updatePixels();
  newCat.updatePixels();

 // image(cat, 0, 0);
  image(newCat,0,0);
  // println((cat.pixels[pixel] >> 8 & 0xFF));
}
