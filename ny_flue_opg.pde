ArrayList<Flue> flueListe = new ArrayList<Flue>(); //en liste hvor man kan ændre i den data den lagrer. Det er den der bliver "taget" fluer fra nåår man indsætter nye

void setup() {
  size(500, 500);
}

void draw() {
  clear();
  background(150);
  for (int i=0; i<flueListe.size(); i++) { 
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt(); //fra "for loop" til her: en måde hvorpå man siger at det er det alle fluerne i listen gør
}
}

void keyPressed() {
  if (key != 'e' && key != 'E'){
    Flue fff = new Flue();
    flueListe.add(fff); // når man trykker på en knap så tilføjer den en flue fra flue listen et tilfældigt sted
  }
  if (key == 'e' || key == 'E') {
     flueListe.add(new Flue(random(0.5, 2)));
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY)); // når man trykker på skærmen så tilføjer den en ny flue fra flue listen der hvor der så bliver trykket
}

/////////////////////////////////////////////////////////
class Flue {  // vi laver en class som hedder flue der så er det der bliver indsat hver gang vi vil indsætte "flue" overfor

  float positionX, positionY; 
  float distanceFlyttet;
  float vinkel = 0;   //variabler som kan defineres til at sige hvad fluen skal gøre 
  float fscale =1;
  float speed = 1; 
  
  Flue() {
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);   //Beskriver hvor koordinat systemet er henne
  }

 Flue(float gscale){
   positionX  = random(0, height);
   positionY  = random(0, width);
   vinkel     = random(0, 2*PI); 
   fscale = gscale; //beskriver koordinatsystem når "e" bliver trykket på
   
 }

  Flue(float a, float b) {
    positionX = a;
    positionY = b;
    vinkel    = random(0, 2*PI); //Beskriver hvor fluen er henne på koordinat systemet
  }

  void flyt() {
    distanceFlyttet = distanceFlyttet + speed; //funktion der flytter fluen i den retning den peger bestemt ovenfor
    if(cos(vinkel) * (distanceFlyttet * fscale) + positionX > width)
    speed = speed * -1;
    if(cos(vinkel) * (distanceFlyttet * fscale) + positionX < 0 )
    speed = speed * -1;
    if(sin(vinkel) * (distanceFlyttet * fscale) + positionY < 0 )
    speed = speed * -1;
    if(sin(vinkel) * (distanceFlyttet * fscale) + positionY > height)
    speed = speed * -1; //gør så fluer vender om når rammer væg
  }

  void tegnFlue() {
    pushMatrix(); //gemmer det nuværende koordinat system 
    translate(positionX, positionY);
    rotate(vinkel);
    translate(distanceFlyttet, 0);  //ændre koordinat systemets placering
    scale (fscale);  
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);  //tegner fluen
    if (positionX > 500|| positionY > 500 || height < 0 || width < 0){
      vinkel*=-1;
    }
    popMatrix(); //går tilbage til nuværende koordinat sytem
  }
}
