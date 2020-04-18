Mover[] liniesSol = new Mover[50]; // Es crea un array de 50 línies per poder mostrar les línies del sol. 
Mover[] marietes = new Mover[60]; // Es crea un array de 60 el·lipses per poder mostrar les marietes. 

void setup() {

  size(600, 600);
  background(255);

  // Es genera un primer bucle per anar generant totes les línies del sol (liniesSol[i]). 
  for (int i = 0; i < liniesSol.length; i++) { 
    liniesSol[i] = new Mover();
  }

  // Es genera un primer bucle per anar generant totes les línies del sol (marietes[i]). 
  for (int i = 0; i < marietes.length; i++) { 
    // S'inicialitza l'array d'objectes Mover(). 
    marietes[i] = new Mover();
  }
}

void draw() {

  background(255);

  // Es crea un primer bucle per generar el moviment i per mostrar la visualització de les 50 línies del sol mitjançant els mètodes updateSol i displaySol. 
  for (int i = 0; i < liniesSol.length; i++) { 

    // Es criden les funcions de tots els mètodes dins l'array de liniesSol[i].
    liniesSol[i].updateSol();
    liniesSol[i].displaySol();
  }

  // Es crea un segon bucle per generar el moviment i per mostrar la visualització dels 60 
  // el·lipses de les marietes mitjançant els mètodes updateMarietes i displayMarietes. 
  for (int i = 0; i < marietes.length; i++) {

    // Es criden les funcions de tots els mètodes dins l'array de marietes[i].
    marietes[i].updateMarietes();    
    marietes[i].displayMarietes();
  }
}

class Mover {

  PVector locationSol;
  PVector velocitySol;
  float topspeedSol;

  PVector locationMarietes;
  PVector velocityMarietes;
  PVector accelerationMarietes;
  float topspeedMarietes;

  Mover() {

    // Es crea una localització aleatòria per les línies del sol. 
    locationSol = new PVector(random(width), random(height)); 

    // Es defineix la velocitat que tindrà en direcció a l'eix Y.
    velocitySol = new PVector(0, 3); 

    // Es defineix quina serà la seva velocitat màxima. 
    topspeedSol = 3; 

    // Es crea una localització aleatòria per a l'ubicació de les marietes. 
    locationMarietes = new PVector(random(width), random(height));

    // Es defineix la velocitat que tindrà en direcció a l'eix Y.
    velocityMarietes = new PVector(0, 0);

    // Es defineix quina serà la seva velocitat màxima. 
    topspeedMarietes = 4;
  }

  void updateSol() {

    // Es defineix la velocitat de les línies del sol. 
    velocitySol.limit(topspeedSol);

    // Es defineix quin serà el seu límit, el qual anirà disminuint en cada updateSol(). 
    locationSol.add(velocitySol);
  }

  // Es mostren les línies del sol amb les caracterísitiques de les seves línies, els seus colors i les seves bores. 
  void displaySol() {

    stroke(255, 255, 000);
    fill(255, 255, 000);
    line(locationSol.x, locationSol.y, 4, 4);
  }

  void updateMarietes() {

    // Es crea un algoritme que troba el vector, el qual apunta cap al ratolí.
    PVector mouse = new PVector(mouseX, mouseY);    
    PVector dir = PVector.sub(mouse, locationMarietes);

    // Es normalitza el vector.
    dir.normalize();

    // S'escala el vector.
    dir.mult(0.5);

    // Se li aplica l'acceleració.
    accelerationMarietes = dir;

    // La velocitat canvia per acceleració i la ubicació canvia per la velocitat.
    velocityMarietes.add(accelerationMarietes);
    velocityMarietes.limit(topspeedMarietes);
    locationMarietes.add(velocityMarietes);
  }

  // Es mostren les marietes amb les caracterísitiques de les seves línies, els seus colors i les seves bores. 
  void displayMarietes() {
    stroke(010, 010, 010);
    fill(255, 035, 001);
    ellipse(locationMarietes.x, locationMarietes.y, 16, 16);
  }
}
