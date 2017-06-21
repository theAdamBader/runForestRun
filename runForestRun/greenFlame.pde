class GreenFire {

  //obstacles of fire for the player to dodge
  //green flame is small in size but faster than the others

  PImage [] greenFlame= new PImage [3];//calling an array of images

  int currentImage= 0;
  int frameStartTime= 0;//starts the frame and image at 0
  int x, y;
  int xSpeed;

  GreenFire() {//first constructor adds the default values  
    x= 700;
    y= 180;
    xSpeed= 11;

    for (int i = 0; i < greenFlame.length; i++) {//load image stand using a for loop
      greenFlame[i] = loadImage ("fire/greenFlame"+i+".png");//runs through each file known as
    }//e.g. greenFlame +i+ so increments by one every image
  }

  GreenFire(int xPos, int yPos) {//second contructor assigns the parameters
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

      if (currentImage >= greenFlame.length)// when it reachs the end of the array, it goes back to 0
      {
        currentImage = 0;
      }
    }
  }

  void display()
  {
    image(greenFlame[currentImage], x, y);//displays current image
  }

  void move() {
    x -= xSpeed;

    if (x <= -200) {//when the image hits -200px then its calls after the width of the screen by 400px
      x = width + 400;
    }
  }
}