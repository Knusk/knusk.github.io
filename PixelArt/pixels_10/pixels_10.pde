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
      
      
      if (random(100)>99) {
        if (r > 100 && g < 250 && b < 250 ) {
          int rnd_lodd = (int)random(12); // dette styrer loddrett 'blur' ...
          a = 10;
          argb = color(r,g,b,a);
          int pix = (pixel+(cat.width*rnd_lodd));
          if (random(100)<3){
            pix += (int)random(11)-5;
            // Dette vil gi horisontal 'blur'
            pix %= dimension;
           // newCat.pixels[pix] = argb;
          // newCat.pixels[pix] = cat.pixels[pix];
          }
          pix %= dimension;
          // println("pix = "+pix);
          //cat.pixels[pix]=argb;
          // newCat.pixels[pix] = 0xFFFFFF;
          newCat.pixels[pix] = cat.pixels[pixel];
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
