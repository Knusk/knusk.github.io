PImage cat;
PImage newCat;
int pixel;
int[] bilde;
int dimension;
int rnd;
int r,b,g,a;
color argb;
int pix;

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
  for (int j=1; j < cat.height; j++) {
    for (int i=0; i < cat.width; i++) {

      pixel = j*cat.width+i;

      //if (random(100)<5){
      //cat.pixels[(pixel+(cat.width+(int)random(2)*(int)(random(4)-2)))%dimension]=cat.pixels[pixel];
      //}
      argb = cat.pixels[pixel];
 a = (argb >> 24) & 0xFF;
 r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
 g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
 b = argb & 0xFF;  
     
      
      if (random(100)>1) {
        if (r < 60 || g < 60 || b < 60 ) {
          rnd = (int)random(3)-1;
          
          //argb = color(r,g,b);
           pix = abs(pixel+(cat.width*rnd));
          if (random(100)<3){
            pix += (int)random(3)-1;
            pix %= dimension;
            
            a = 10;
            color(r, g, b, a);
           // argb =   0 | 255 | 255 ;
            newCat.pixels[abs(pix)] = color (argb);
          }
          pix %= dimension;
          // println("pix = "+pix);
          cat.pixels[abs(pix)]=argb;
          // newCat.pixels[pix] = 0xFFFFFF;
        }
      }
    }
  }
  cat.updatePixels();
  newCat.updatePixels();

image(newCat,0,0);
  image(cat, 0, 0); /// når denne også vises, så ser vi originalen bak, noe som gir 'best' effekt spør du meg ... :)
  
  // println((cat.pixels[pixel] >> 8 & 0xFF));

noLoop();
}

void keyPressed(){
  
  loop();
  
}
