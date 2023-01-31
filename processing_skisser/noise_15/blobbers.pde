class blobbers {
  blob[] myBlob = new blob[30];

//// constructor
  blobbers(int num) {
    for (int l=myBlob.length-1; l>-1; l--) {
      myBlob[l] = new blob(random(0.01)*num + (0.01*l), 100.1 + random(0.01)+ ( 0.01*l), random(0.01)+12+(0.005*l), l );
    }
  }

  void update() {
    for (int l=myBlob.length-1; l>-1; l--) {
      myBlob[l].update();
    }
  }
}
