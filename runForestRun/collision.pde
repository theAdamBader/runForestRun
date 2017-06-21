class Collision {


  Collision() {
  }

  void col() { 

    if (dist(tree.x, tree.y, blueFire.x, blueFire.y)<=25) {//calls the distance between two points the x and y axis
     gameState = 2;//when there is less or equal than 30 px between the player and enemy then game state 2 activates
    }

    if (dist(tree.x, tree.y, fire.x, fire.y)<=80) {
     gameState = 2;
    }
    
     if (score > 10000) {
      if (dist(tree.x, tree.y, greenFire.x, greenFire.y)<=30) {
        gameState = 2;
      }
    }

    if (score > 3000) {
     if (dist(tree.x, tree.y, fireBoss.x, fireBoss.y)<=60) {
       gameState = 2;
     }
    }

    if (score > 300) {//when you hit the 300 score mark then the distance between the player and the wall starts as if there is no condition for it
     if (dist(tree.x, tree.y, firewall.x, firewall.y)<=300) {//the player would hit an invisible wall so using a nested if is the best condition for this collision
       gameState = 2;
     }
    }
  }
}