class FireBoss {

  //obstacles of fire for the player to dodge
  //fire boss move slighty slower than the others but it is larger than the other enemies

  PImage [] bigFlame= new PImage [3];////calling an array of images

  int currentImage= 0;
  int frameStartTime= 0;
  int x, y;
  int xSpeed= 6;

  FireBoss() {//first constructor adds the default values  
    x= 700;
    y= 250;

    for (int i = 0; i < bigFlame.length; i++) {//load image stand using a for loop
      bigFlame[i] = loadImage ("fire/bigFlame"+i+".png");//runs through each file known as
    }//e.g. bigFlame +i+ so increments by one every image
  }

  FireBoss(int xPos, int yPos) {//second contructor assigns the parameters
    x= xPos;
    y= yPos;
  }

  void run() {//this function calls the functions below and is it simple to add this funtion in the main tab
    update();
    display();
    move();
  }

  void update() //enemy functions
  {
    if (millis() - frameStartTime > 100)
    {
       // reset the current frameStartTime to the current time
      frameStartTime = millis();
    
      currentImage ++;//increments the image by one every frame
      
      if (currentImage >= bigFlame.length)// when it reachs the end of the array, it goes back to 0
      {
        currentImage = 0;
      }
    }
  }

  void display()
  {
    // display the current image
    image(bigFlame[currentImage], x, y);
  }

  void move() {
    x -= xSpeed;

    if (x <= -200) {//when the image hits -200px then its calls after the width of the screen by 2000px
      x = width + 2000;
    }
  }
}