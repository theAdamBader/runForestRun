class Fire {

  //obstacles of fire for the player to dodge
  //this is a normal fire compare to the other two enemies

  PImage [] flame= new PImage [3];//calling an array of images

  int currentImage= 0;
  int frameStartTime= 0;
  int x, y;
  int xSpeed= 7;

  Fire() {//first constructor adds the default values  
    x= 700;
    y= 270;

    for (int i = 0; i < flame.length; i++) {//load image stand using a for loop
      flame[i] = loadImage ("fire/flame"+i+".png");//runs through each file known as
    }//e.g. flame +i+ so increments by one every image
  }

  Fire(int xPos, int yPos) {//second contructor assigns the parameters
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
      
      if (currentImage >= flame.length)// when it reachs the end of the array, it goes back to 0
      {
        currentImage = 0;
      }
    }
  }

  void display()
  {
    // display the current image
    image(flame[currentImage], x, y);
  }

  void move() {
    x -=xSpeed;

    if (x <= -200) {//when the image hits -200px then its calls after the width of the screen by 200px
      x = width + 200;
    }
  }
}