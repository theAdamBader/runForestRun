class Extras {

  PImage bush;//calling an image, bush which gives the illusion that the player is running through the forest
  int xBackground= -100;


  Extras() {
    bush= loadImage ("bush.png");
  }

  void display() //background functions
  {
    image (bush, xBackground, 0);//calling two images, one to start with xBackground= -100 and the other adds the background image where x=0 
    image (bush, xBackground+bush.width, 0);
    xBackground -= 5; //moving image
    if (xBackground < -bush.width) //using if statement to call the image back when its met the condition giving the illusions that the image is looping
    {
      xBackground = 0;
    }
  }
}