Mover[] movers = new Mover[60];

void setup() {
  size(640, 360);
  background(255);
  for (int i = 0; i < movers.length; i++) {

    // S'inicialitza l'array d'objectes Mover(). 
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {

    // Crida les funcions de tots els mètodes dins l'array. 
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 4;
  }

  void update() {

    // Algoritme que troba el vector que apunta cap al ratolí.
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);

    // Es normalitza el vector.
    dir.normalize();

    // S'escala el vector.
    dir.mult(0.5);

    // Se li aplica l'acceleració.
    acceleration = dir;

    // La velocitat canvia per acceleració i la ubicació canvia per la velocitat.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  // Mètode que mostra el resultat del codi que s'han executat mitjançant un el·lipse i aplicant-li color. 
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }

  // Mètode que mira les bores de la consola i hi aplica els canvis necessaris. 
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
