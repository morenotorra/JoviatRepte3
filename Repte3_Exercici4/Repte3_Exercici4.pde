Mover mover;

void setup() {
  size(640, 360);

  // Es crea un nou objecte de tipus Mover. 
  mover = new Mover();
}

void draw() {
  background(255);

  // Crida a les funcions de la classe Mover. 
  mover.update();
  mover.checkEdges();
  mover.display();
}
