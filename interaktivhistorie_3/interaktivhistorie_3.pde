/**
 *** Et slags system for å lage en interaktiv historie ...
 *** Sidetall er en indikator for hvor du er i historien, men hver side kan også ha alternativt innhold
 *** F.eks. s==12 og alt==1
 */

PFont f;            /// Dette er en variabel for å 'holde på' den fonten du vil bruke.
/// Det går fint å lage flere av disse for flere fonter ...
PImage img;         /// En variabel for å hente inn bilder ...
int side;           /// En variabel som holder orden på sidetallet du er på ...
int alt;            /// Alternative sider? Sidespor?
String msg;         /// msg = melding = Teksten som dukker opp hver side
/// Det vil si... det er en tekstfil som blir lastet inn (for hele historien), og denne variabelen brukes på hver side for å vise riktig tekst ...
int timer;          /// Variabel som holder greie på den totale tiden brukt (i sekunder) ...
int now, timerTmp;  /// Disse brukes for å 'nullstille' timeren
String[] arkiv;     /// 'arkiv' er hele historien, lagret i en egen tekstfil.



void setup() {
  size(640, 360);

  // Create the font
  //printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);

  side = 0;  // vi begynner med 0 da det er det arrays begynner med; altså arkiv[0] er den første linja med tekst i vårt dokument
  msg = "";   // Vi gjør klar 'msg' til å ta i mot en ny melding ...
  now = hour()*360+minute()*60+second();  /// dette er kun for å starte vår timer på 0 sekunder ...
  timerTmp = now;
  arkiv = loadStrings("historien.txt");
  /// eksemepl på hvordan teksten kan fremstå i 'arkivet' ...
  ///arkiv={"Du er alene på en mørk landevei","Foran deg står en stor katt","Du lurer på hvorfor katten er så stor?"};
}

void draw() {
  now = hour()*360+minute()*60+second();
  timer = now - timerTmp;
  background(102);
  lastInnBakgrunn(side);
  lastInnTekst(side);
  noLoop();
}



void lastInnTekst(int s) {

  if (arkiv.length > s) {
    msg = arkiv[s];
  } else {
    msg = "The end!!";
  }
  fill(0);
  textSize(24);
  text(msg, 100, 95, 400, 200);
  textSize(18);
  text(side, 620, 25);
}

void lastInnBakgrunn(int s) {

  if (loadImage("bilder/bilde_"+s+".png") != null) {
    img = loadImage("bilder/bilde_"+s+".png");
    image(img, 30, 30);
  }
}


void keyPressed() {
  if (key=='a') {
    msg = "Hei! Du trykket på bokstaven 'a'???";
  } else {
    msg = "Du trykket på en annen bokstav";
  }
  println("key == "+key);
  println("keyCode == "+keyCode);
  println("timer == " + timer);
  side++;
  loop();
}
