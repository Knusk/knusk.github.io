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
int timer, timer_per_side;          /// Variabel som holder greie på den totale tiden brukt (i sekunder) ...
int now, timerTmp;  /// Disse brukes for å 'nullstille' timeren
String[] arkiv;     /// 'arkiv' er hele historien, lagret i en egen tekstfil.



void setup() {
  size(640, 360);

  // Create the font
  printArray(PFont.list());
  f = createFont("Trattatello", 24);
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
  lastInnBilde(side);
  lastInnTekst(side);
  noLoop();
}



void lastInnTekst(int s) {

  if ( (arkiv.length > s) && (arkiv[s] != null) ) {
    msg = arkiv[s];
  } else {
    msg = "The end!";
  }
  fill(0);
  textSize(24);
  text(msg, 100, 95, 400, 200);
  textSize(18);
  text(side, 620, 25);
}

void lastInnBilde(int s) {

  // bildene må ligge i en mappe som heter 'bilder' inne i mappen som heter 'data'
  // så må hvert bilde hete 'bilde_1.png, bilde_2.png' etc for å automatisk bli
  // lastet inn når du kommer til en ny side ...

  if (loadImage("bilder/bilde_"+s+".png") != null) {
    img = loadImage("bilder/bilde_"+s+".png");
    image(img, 30, 30);
  }
}


void keyPressed() {

  /// her kan man egentlig legge inn hele 'logikken' til historien
  /// Sjekk hvilken side du er på og sjekk om de svarer 'ja','nei'
  /// eller andre alternativer som du har gitt (kanskje 'vet ikke?') ...

  /* Første spørrepunkt er altså side 5 med 'ja' eller 'nei' */

  /// Det vil nok være best å bruke 'switch case' i dette tilfellet, som er en fin måte å spørre et
  /// spørsmål hvor svaret kan være veldig mye forskjellig (slik som vi har her)

  //
  /* switch - case ser sånn ut:
   
   denne kan f.eks. komme etter at vi har spurt et 'ja/nei'-spørsmål eller liknende, eller at vi i
   alle fall vet at her skal historien 'hoppe' til et annet sted ...
   
   if (hoppiteksten){   /// hoppiteksten er en boolean som vi setter til true dersom vi vet at vi skal hoppe videre ...
     switch(side) {
       case '3':
       side = 400;  // Vi hopper til riktig  sted ...
       break;
       case '9':
       side = 500;  // Vi hopper til riktig  sted ...
       break;
       case '19':
       side = 600;  // Vi hopper igjen til riktig  sted ...
       break;
       default:
       side = 999;   // Vi går til siste side (som kanskje gir en feilmelding eller noe sånt ...
       break;
       }
   }
   
   */

  if ( key == 'j' && side == 5 ) {
    /// her har altså brukeren svart 'ja' på å tjene lett-tjente penger
    /// så da må vi bestemme hvilken side han skal gå til og om det eventuelt
    /// er andre variabler (helse, moral, flaks, penger etc) som skal forandres

    side = 200;
  } else {
    /// hvis svaret er 'nei' så fortsetter vi som vanlig ...
    side++;
  }
  println("key == "+key);
  println("keyCode == "+keyCode);
  println("timer == " + timer);

  loop();
}
