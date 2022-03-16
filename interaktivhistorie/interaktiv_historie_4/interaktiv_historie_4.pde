/**
 *** Et slags system for å lage en interaktiv historie ...
 *** Sidetall er en indikator for hvor du er i historien, men hver side kan også ha alternativt innhold
 *** F.eks. s==12 og alt==1
 */

PFont f;                        /// Dette er en variabel for å 'holde på' den fonten du vil bruke.
/// Det går fint å lage flere av disse for flere fonter ...
PImage img;                     /// En variabel for å hente inn bilder ...
int side;                       /// En variabel som holder orden på sidetallet du er på ...
String msg;                     /// msg = melding = Teksten som dukker opp hver side
/// Det vil si... det er en tekstfil som blir lastet inn (for hele historien), og denne variabelen brukes på hver side for å vise riktig tekst ...
int timer, timer_per_side;      /// Variabel som holder greie på den totale tiden brukt (i sekunder) ...
int now, timerTmp;              /// Disse brukes for å 'nullstille' timeren
String[] manus;                 /// 'arkiv' er hele historien, lagret i en egen tekstfil.

import processing.video.*;
Movie film_1, film_2;


void setup() {
  size(640, 360);

  // Create the font
  //printArray(PFont.list());
  f = createFont("Trattatello", 24);
  textFont(f);

  side = 0;                               // vi begynner med 0 da det er det arrays begynner med; altså arkiv[0] er den første linja med tekst i vårt dokument
  msg = "";                               // Vi gjør klar 'msg' til å ta i mot en ny melding ...
  now = hour()*360+minute()*60+second();  /// dette er kun for å starte vår timer på 0 sekunder ...
  timerTmp = now;
  manus = loadStrings("historien.txt");
  manus = splice(manus, "START", 0);
  film_1 = new Movie(this, "filmer/360.mov");
  film_2 = new Movie(this, "filmer/film_2.mp4");
}

void draw() {
  now = hour()*360+minute()*60+second();
  timer = now - timerTmp;
  background(102);
  lastInnBilde(side);          /// egendefinert funksjon som laster inn bildet som heter "bilde_2.png"
  /// dersom du er på side 2, og dersom det er et bilde som heter akkurat det.
  lastInnTekst(side, timer);   /// egendefinert funksjon som laster inn og viser teksten, sidetallet og timeren
  /// som tilhører den gitte siden (sidetallet).

  lastInnFilm(side);           /// egendefinert funksjon for å vise filmer ...
}


///// her kommer de egendefinerte funksjonene ...
void lastInnTekst(int s, int t) {
  if ( (manus.length > s) && (manus[s] != null) ) {
    msg = manus[s];
  } else {
    msg = "The end!";
  }

  textSize(40);
  fill(0);
  textLeading(42);
  text(msg, 100, 95, 400, 300);
  fill(230, 230, 220);
  text(msg, 101, 96, 400, 300);

  textSize(18);
  text("Side: "+s, 570, 25); /// sidetallet oppe i høyre hjørne
  text("Timer: "+t, 570, 45);  /// timer ... usikker på om det er noe bruk for den, men dog ...
  loop();
}

void lastInnBilde(int s) {

  // bildene må ligge i en mappe som heter 'bilder' inne i mappen som heter 'data'
  // så må hvert bilde hete 'bilde_1.png, bilde_2.png' etc for å automatisk bli
  // lastet inn når du kommer til en ny side ...

  if (loadImage("bilder/bilde_"+s+".png") != null) {
    img = loadImage("bilder/bilde_"+s+".png");
    image(img, -30, -30, img.width*0.5, img.height*0.5);  //// plassering og skalering av bildene (likt for alle per nå)
  }
}

void lastInnFilm(int s) {
  //// egen greie for å vise film
  if ( side == 12) {
    film_1.play();
    image(film_1, 0, 0, width, height);
    println("Skulle kjøre film nå ...");
  } else if ( side == 13) {
    film_2.play();
    film_1.stop();
    image(film_2, 0, 0, width, height);
    println("Film_2 skal kjøre film nå ...");
  } else if ( side != 13 && side != 12) {
    film_2.stop();
    film_1.stop();
  }
}

void keyPressed() {

  /// her kan man egentlig legge inn hele 'logikken' til historien
  /// Sjekk hvilken side du er på og sjekk om de svarer 'ja','nei'
  /// eller andre alternativer som du har gitt (kanskje 'vet ikke?') ...

  /* Første spørrepunkt er altså side 5 med 'ja' eller 'nei' */


  if ( side == 4 )
  {
    if (key == 'j' ) {
      /// her har altså brukeren svart 'ja' og vi hopper til side 100 ...
      side = 100;
    } else if ( key == 'n') {
      /// hvis svaret er 'nei' så fortsetter vi som vanlig ...
      side++;
    }
  }
  else if ( keyCode == 32 ){  /// her er hva som skjer når man ikke skal velge noe, og bare gå videre ...
    side++;
  }

  println("key == "+key);
  println("keyCode == "+keyCode);
  println("timer == " + timer);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
