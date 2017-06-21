class Soundtracks {

  AudioPlayer player;

  Minim minim;

  void gameMusic(Object Play) {//the main game

    try {//executes the function below when an even happens
      minim= new Minim(Play);
      player=minim.loadFile("soundtrack/hope.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {//catch will handle the event occuring 
      e.printStackTrace();
    }
  }

  void gameMenu(Object Play) {//menu

    try {
      minim= new Minim(Play);
      player=minim.loadFile("soundtrack/menu.mp3");//locate file
      player.play();//when opened play this
      player.loop();//play the track when it ends.
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }

  void endGame(Object Play) {//gameOver

    try {
      minim= new Minim(Play);
      player=minim.loadFile("soundtrack/over.mp3");//locate file
      player.play();//when opened play this
    }
    catch (Exception e ) {
      e.printStackTrace();
    }
  }

  void stopSound() {//to stop the soundtrack
    player.close();
    minim.stop();
  }
}