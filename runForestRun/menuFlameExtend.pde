class DarkParticle extends Particle {
  
  //it inherts from the particle class

  float x, y;
  float xSpeed, ySpeed;
  PImage fire;

  DarkParticle() {//default values
    x = width/2;//having the x centered to the screen
    y = 0;
    xSpeed = random(-4, 4);//giving random floats for is e.g. x axis -4px to 4px from the start point
    ySpeed = random(-5, 0);
    fire= loadImage("fire/menuFlame0.png");
  }

  void run() {//this function calls the functions below and is it simple to add this funtion in the main tab
    move();
    gravity();
    display();
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  void gravity() {
    ySpeed += 0.08;
  }

  void display() {
    image(fire, x, y, 30, 30);
  }
}