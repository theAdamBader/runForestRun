class GameOver {

  PImage gameOver;
  PVector v1, v2, v3, v4;//declaring 4 different objects
  PVector position;


  GameOver() {

    gameOver= loadImage("gameOver.png");
    textureMode(NORMAL);
    v1 = new PVector(50, 200);
    v2 = new PVector(300, 200);//different co-ordinates 
    v3 = new PVector(300, 300);
    v4 = new PVector(50, 300);
    position= new PVector (230, -60);//placing new postion to move the whole object
  }

  void display() {
    background(0);//postions of image at 0,0 
    beginShape();//beginning of the shape 
    texture (gameOver);//taking the image gameOver from setup
    PVector v1new = PVector.add(position, v1);//adding postion moves the object without changing the object
    vertex(v1new.x, v1new.y, 0, 0);//postion of the vertex 
    PVector v2new = PVector.add(position, v2);
    vertex(v2new.x, v2new.y, 1, 0);
    PVector v3new = PVector.add(position, v3);
    vertex(v3new.x, v3new.y, 1, 1);
    PVector v4new = PVector.add(position, v4);
    vertex(v4new.x, v4new.y, 0, 1);
    endShape(CLOSE);//closing the shape
  }
}