class Tree {

  float x, y;
  float xSpeed, ySpeed;//using floats to create the variables to go with the constructor and add gravity to the player 
  float gravity= 4;

  PImage[] jump= new PImage[3];//calls an array of images
  PImage[] moveR= new PImage[4];
  PImage[] moveL= new PImage[4];

  Tree() {//first constructor adds the default values 
    x= 10;
    y= 225;
    xSpeed= 6;
    ySpeed= 10;

    for (int i = 0; i < moveR.length; i++) {//load image run using a for loop
      moveR[i] = loadImage ("rfr/run"+i+".png");//runs through each file known as
    }//e.g. run +i+ so increments by one every image

    for (int i = 0; i < moveR.length; i++) {//load image run using a for loop
      moveL[i] = loadImage ("rfr/left"+i+".png");
    }

    for (int i = 0; i < jump.length; i++) {//load image jump using a for loop
      jump[i] = loadImage ("rfr/jump"+i+".png");
    }
  }


  Tree(float xPos, float yPos, float moveSpeed, float jumpSpeed) {//second contructor assigns the parameters
    x= xPos;
    y= yPos;
    xSpeed= moveSpeed;
    ySpeed= jumpSpeed;
  }

  //-----------------------------------------------------------------------------------------------------------------------------//    

  int movingRightIndex;
  void moveRight() {
    if (frameCount % 3 == 0)//calling each frame using frameCount and using mod 3 to calculate the speed to the next frame
      movingRightIndex = int (random(0, moveR.length));//mod calculates the differences between each frame
    image(moveR[movingRightIndex], x, y);//smaller the mod; the faster each frame goes
  }

  int movingLeftIndex;
  void moveLeft() {
    if (frameCount % 3 == 0)
      movingLeftIndex = int (random(0, moveR.length));
    image(moveL[movingLeftIndex], x-42, y-30);
  }

  int jumpingIndex;
  void jumpping() {
    if (frameCount % 20 == 0)//using mod 20 to slow the speed of the jump frames
      jumpingIndex= int (random(0, jump.length));
    image( jump[jumpingIndex], x, y-30);
  } 

  //-----------------------------------------------------------------------------------------------------------------------------// 
  
  void run(){//this function calls the functions below and is it simple to add this funtion in the main tab
  display();
  gravity();
  }

  void display() {
    if (buttonRight) {
      if (x >= width/1.2)
      {
        x= width/1.2;//it allows the character not to go off screen
      }
      moveRight(); //calls the right move function
      x+=xSpeed * 2;//increasing the xSpeed by multiplying it by two
    } else if (buttonLeft) {//using else if statement allows the player to change images so they do not overlap each other
      if (x < 50)
      {//this allows it not to go off screen 
        x= 50;
      }
      moveLeft(); 
      x-=xSpeed * 3.0;//increasing speed by three so it is faster and more risky to hit the firewall than when running right
    } else if (buttonUp) {
      if (x >= width/1.2)
      {////it allows the character not to go off screen when jumping
        x= width/1.2;
      }
      x+=xSpeed * 3;
      tree.y-=ySpeed;//the player would jump diagonally

      jumpping();
    } else {
      moveRight();//else the player would seem like he is running
    }
  }

  //-----------------------------------------------------------------------------------------------------------------------------//   

  void gravity() {
    if (y>225) {//gravity for character not to drop
      y=225;
    }
    if (y < 120) {//for the character not to jump too high
      y=120;
    }
    y+=gravity;
  }
}