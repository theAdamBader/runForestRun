//Particle class that is linked to the menu screen

class Particle {

  float x, y;
  float xSpeed, ySpeed;
  PImage fire;

  Particle() {//default values
    x = width/2;//having the x centered to the screen
    y = 0;
    xSpeed = random(-2, 2);//giving random floats for is e.g. x axis -2px to 2px from the start point
    ySpeed = random(-5, 0);
    fire= loadImage("fire/menuFlame1.png");
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
    ySpeed += 0.1;
  }

  void display() {
    image(fire, x, y, 20, 20);
  }
}