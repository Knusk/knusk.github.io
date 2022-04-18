blob[] myBlob = new blob[20];


void setup(){
  size (600,600);
  for (int l=myBlob.length-1; l>0; l--){
  myBlob[l] = new blob(0 + (0.1*l), 100.1 + ( 0.1*l) , 12.0 + ( 0.005*l) );
  }
  strokeWeight(2);
  blendMode(DIFFERENCE);
  
}

void draw(){
  
 fill(125);
  noStroke();
  rect(0,0,width,height);
  
 for (int l=myBlob.length-1; l>0; l--){
  myBlob[l].update();
 }
  

}

void mousePressed() {
  saveFrame("Art-####.tif"); 

}
