class ForestRunMenu {

  //obstacles of fire for the player to dodge

  PImage [] forestFire= new PImage [5];

  int currentImage= 0;
  int frameStartTime= 0;
  int x, y;

  ForestRunMenu() {
    x= 0;
    y= 270;

    for (int i = 0; i < forestFire.length; i++) {//load image stand using a for loop
      forestFire[i] = loadImage ("rfr/runFire"+i+".png");//runs through each file known as
    }//e.g. runFire +i+ so increments by one every image
  }
  
   ForestRunMenu(int xPos, int yPos) {
    x= xPos;
    y= yPos;
   }

  void run() {//this function calls the functions below and is it simple to add this funtion in the main tab
    update();
    display();
    move();
  }


  void update() //background functions
  {
    if (millis() - frameStartTime > 100)
    {
       // reset the current frameStartTime to the current time
      frameStartTime = millis();
    
      currentImage ++;//increments the image by one every frame
      
      if (currentImage >= forestFire.length)
      {
        currentImage = 0;// when it reachs the end of the array, it goes back to 0
      }
    }
  }

  void display()
  {
    // display the current image
    image(forestFire[currentImage], x, y);
  }

  void move() {
    x += 4;

    if (x > width + 200) {
      x = 0;
    }
  }
}