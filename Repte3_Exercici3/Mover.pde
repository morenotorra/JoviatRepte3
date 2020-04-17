class Mover {

  PVector location;
  PVector velocity;
  //Acceleration is the key!
  PVector acceleration;
  //The variable topspeed will limit the magnitude of velocity.
  float topspeed;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 10;
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    //Step 1: 
    //Compute direction
    PVector dir = PVector.sub(mouse, location);

    //Step 2: 
    //Normalize
    dir.normalize();

    //Step 3: 
    //Scale
    dir.mult(0.5);

    //Step 4: 
    //Accelerate
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
}
