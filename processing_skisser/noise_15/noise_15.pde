blobbers[] myBlobbers = new blobbers[2];

void setup() {
  size (600, 600);
  for (int l=myBlobbers.length-1; l>-1; l--) {
    myBlobbers[l] = new blobbers(l);
  }
  strokeWeight(2);
  blendMode(REPLACE);   /// REPLACE gir en ganske kul effekt, men ingen 'etterslep' ...
}

void draw() {
   fill(0, 10);
    noStroke();
    rect(0, 0, width, height);
  
  
  for (int l=myBlobbers.length-1; l>-1; l--) {
    myBlobbers[l].update();
  }
  noLoop();
}

void mousePressed() {
  saveFrame("Art-####.tif"); 
}

void keyPressed(){
  loop();
}
