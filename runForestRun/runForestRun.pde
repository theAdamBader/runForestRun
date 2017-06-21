/*RUN FOREST RUN
 
 You can find the instructions by introAndReference tab.
 
 */

//--------------------------------------------------------------------------//

import ddf.minim.*;//imported minim library to add audio

boolean buttonRight= false;
boolean buttonLeft= false;  //using boolean for button functions
boolean buttonUp= false;
boolean gamePaused= true;

boolean menuMusic= true;
boolean playGameMusic= true;//boolean for when a track is beinng called
boolean endMusic= true;

int gameState= 0;//using int instead boolean as I am calling three different variables: 0, 1 & 2
int score= 0;//using a score system starting at 0 and a highscore to keep track of your highscore
int highScore= 0;

PImage pause; //declaring an image to be called when pausing the game

Background back;
BlueFire blueFire;
Collision collision;
Extras extra;
Fire fire;
FireBoss fireBoss;
FireParticles particleSyetem;//calling a class and creating an object for that class
Firewall firewall;//calling them in an alphabetical order makes it easier to go back to them
ForestRunMenu menu;
GameOver GO;
GreenFire greenFire;
Soundtracks sounds;
Tree tree;

void setup() {
  size(768, 400, P2D);//rendering it to 2D
  smooth();

  back= new Background();//creating new objects 
  blueFire= new BlueFire();
  collision= new Collision();
  extra= new Extras();
  fire= new Fire();
  fireBoss= new FireBoss();
  firewall= new Firewall();
  GO= new GameOver();
  greenFire= new GreenFire();
  particleSyetem= new FireParticles();//creating a new object and calling two classes which are: particles and darkparticles
  menu= new ForestRunMenu();
  tree= new Tree(); 
  sounds= new Soundtracks();

  pause= loadImage("pause.png");//loading the pause image into setup
}

//--------------------------------------------------------------------------//

void draw() {
  if (gameState == 0) {//creating different state from when the game enters and using a simple function to add into my conditions

    menu();//makes it easier to find with the main program when facing a bug or error
  } 
  if (gameState == 1) {

    gameStart();//
  } 
  if (gameState == 2) {

    gameOver();
  }
}

//--------------------------------------------------------------------------//

void menu() {//creating a menu function
  background(0);
  menu.run();//menu.run() is calling a simple player image
  particleSyetem.display();//calling to display particle system. reason it is not run like the menu because while run has multiple functions, display only calls one function
  textSize(25);
  text("RUN FOREST RUN", 20, 50);
  textSize(12);
  text("Highscore: "+highScore, 20, 80);//this tracks your highscore for whenever you go back to your main menu

  if (menuMusic) {
    sounds.gameMenu(this);//when called the soundtrack will start playing
    menuMusic= false;
  }
}

void gameStart() {
  if (gamePaused == true) {// adding a pause function so when it is true, the game shall pause

    back.display();//calling a member function into an object

    tree.run();

    blueFire.run();

    fire.run();

    if (score > 3000) {//once you reach the 3000 mark an enemy is spwanned
      fireBoss.run();
    }

    if (score > 10000) {
      greenFire.run();
    }

    extra.display();//extra display is a background image however it is at the front of the screen to give it a look as if the player is running through the forest

    if (score > 300) {//once you reach the 300 mark a firewall appreas
      firewall.run();
    }

    collision.col();//calls a collision function for each enemy in the collision class

    if (gameState == 1) {
      score++;//when the game is playing it tracks your score for how far you have reached
      highScore= max (score, highScore);//adds the max value of that score into your highscore
    }
    textSize(12);
    text("Score: "+score, width/2-30, 30);
  }

  if (playGameMusic) {//when game starts it stops the pervious sound and plays the next sound
    sounds.stopSound();
    sounds.gameMusic(this);
    playGameMusic= false;
  }
}

void gameOver() {
  GO.display(); //calls the class, gameOver, to display 
  textSize(15);
  text("Score: "+score, width/2-15, 80);
  text("Highscore: "+highScore, width/2-30, 140);
  textSize(12);//using two different text sizes avoids the text to be one of the same size
  text("PRESS R to restart", width/2-30, 300);
  text("PRESS Q to the main menu", width/2-30, 330);

  if (endMusic) {
    sounds.stopSound();
    sounds.endGame(this);
    endMusic= false;
  }
}

void reset() {//reset funtions resets the positions of the enemies, the player and the score
  score= 0;
  tree.x=0;
  blueFire.x= -200;
  fire.x= -200;
  fireBoss.x= -200;
}

//--------------------------------------------------------------------------//

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      buttonRight= true;
    } else if (keyCode == LEFT) {//when pressed the button functions are called
      buttonLeft= true;
    }
  }
  if (key == ' ') {
    buttonUp= true;
  }

  if (gameState == 1) {
    if (key == 'p' || key == 'P') {//using a nested if statement allows you to call a button function when it meets its conditions
      gamePaused =! gamePaused;//this allows it not to interfere with the other game states
      image(pause, 30, 0);
    }
  }
  if (gameState == 2) {
    if (key == 'q' || key == 'Q') {
      gameState= 0;
      reset();

      sounds.stopSound();
      sounds.gameMenu(this);
      menuMusic= false;
    }
  } //when it goes to the game state 2 it would stop the track and play a different track depend whether you want to go back to the main menu or restart

  if (gameState == 2)
    if (key == 'r' || key == 'R') {
      gameState= 1;
      reset();

      sounds.stopSound();
      sounds.gameMusic(this);
      playGameMusic= false;
    }

  if (gameState == 0)
    if (key == 's' || key == 'S') {
      gameState = 1;

      sounds.stopSound();
      sounds.gameMusic(this);
      playGameMusic= false;
    }
}

void keyReleased() {
  if (key == CODED) {//when key released the button function becomes false
    if (keyCode == RIGHT) {
      buttonRight= false;
    } else if (keyCode == LEFT) {
      buttonLeft= false;
    }
  }
  if (key == ' ') {
    buttonUp= false;
  }
}