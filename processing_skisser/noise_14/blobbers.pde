class blobbers {

  blob[] myBlob = new blob[10];


//// constructor
  blobbers() {
    for (int l=myBlob.length-1; l>0; l--) {
      myBlob[l] = new blob(0 + (0.1*l), 100.1 + ( 0.1*l), 12.0 + ( 0.005*l) );
    }
  }

  void update() {

   

    for (int l=myBlob.length-1; l>0; l--) {
      myBlob[l].update();
    }
  }
}
