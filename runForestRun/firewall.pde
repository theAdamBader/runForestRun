class Firewall {

  //obstacles of firewall for the player to not to go to back to the screen

  PImage [] fireWall= new PImage [2];

  int currentImage= 0;
  int frameStartTime= 0;
  int x, y;

  Firewall() {//first constructor adds the default values 
    x= -50;
    y= 0;

    for (int i = 0; i < fireWall.length; i++) {//load image stand using a for loop
      fireWall[i] = loadImage ("fire/firewall"+i+".png");//runs through each file known as
    }//e.g. firewall +i+ so increments by one every image
  }

  Firewall(int xPos, int yPos){//second contructor assigns the parameters
    x= xPos;
    y= yPos;
  }

  void run() {//this function calls the functions below and is it simple to add this funtion in the main tab
    update();
    display();
  }


  void update() //enemy functions
  {
    if (millis() - frameStartTime > 100)
    {
       // reset the current frameStartTime to the current time
      frameStartTime = millis();
    
      currentImage ++;//increments the image by one every frame
      
      if (currentImage >= fireWall.length)// when it reachs the end of the array, it goes back to 0
      {
        currentImage = 0;
      }
    }
  }

  void display()
  {
    // display the current image
    image(fireWall[currentImage], x, y);
  }
}