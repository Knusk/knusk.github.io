class blobbers {

  blob[] myBlob = new blob[10];


//// constructor
  blobbers() {
    for (int l=myBlob.length-1; l>0; l--) {
      myBlob[l] = new blob(random(0.1) + (0.1*l), 100.1 + random(0.1)+ ( 0.1*l), 12.0 + random(0.1) + ( 0.005*l) );
    }
  }

  void update() {

   

    for (int l=myBlob.length-1; l>0; l--) {
      myBlob[l].update();
    }
  }
}
