blobbers[] myBlobbers = new blobbers[2];
float glob_rot;
float glob_rot_noise_step;
float glob_rot_noise;
void setup() {
  size (600, 600);
  for (int l=myBlobbers.length-1; l>-1; l--) {
    myBlobbers[l] = new blobbers(l);
  }
  strokeWeight(2);
  blendMode(REPLACE);   /// REPLACE gir en ganske kul effekt, men ingen 'etterslep' ...
  glob_rot = 0;
  glob_rot_noise_step=0.001;
  glob_rot_noise = 0;
}

void draw() {

  glob_rot_noise += glob_rot_noise_step;
  glob_rot = noise(glob_rot_noise);

  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);

  push();
  translate(width/2, height/2);
  rotate(glob_rot*10);
    translate(-width/2, -height/2);
  for (int l=myBlobbers.length-1; l>-1; l--) {
    myBlobbers[l].update();
  }
  //noLoop();
pop();
}

void mousePressed() {
  saveFrame("Art-####.tif");
}

void keyPressed() {
  loop();
}
