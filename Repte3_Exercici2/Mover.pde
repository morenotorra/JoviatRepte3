class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  // Variable de tipus float que limitarà la magnitud de la velocitat. 
  float topspeed;

  // Es crea un constructor amb els paràmetres necessaris per dur a terme l'activitat. 
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 10;
  }

  // Es du a terme l'acceleració mitjançant la velocitat i la variable float que limitarà la magnitud de la velocitat. 
  void update() {
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
