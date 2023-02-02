class blobbers {
  blob[] myBlob = new blob[30];

//// constructor
  blobbers(int num) {
    for (int l=myBlob.length-1; l>-1; l--) {
      myBlob[l] = new blob(num*0.001*l, 2, 3, l );
    }
  }

  void update() {
    for (int l=myBlob.length-1; l>-1; l--) {
      myBlob[l].update();
    }
  }
}
