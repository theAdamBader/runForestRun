class FireParticles {

  ArrayList<Particle> particles;

  FireParticles() {
    particles = new ArrayList<Particle>();//calls an arraylist of particles which are the small flames
  }

  void display() {

    addParticle();


    for (int i = 0; i < particles.size(); i++ ) { //it would loop through the particles
      Particle p = (Particle) particles.get(i);
      p.run();
    }

    if (particles.size() > 150) {//when the size the the particles are great than 150 then the particles are removed
      particles.remove(0);
    }

    howTo();
  }


  void addParticle() {

    float r = random(1);//creating a variable r by 1

    if (r < 0.5) {//if r is less than 50 precent then small flame particles will appear else if greater than larger flames appear
      particles.add(new Particle());
    } else {
      particles.add(new DarkParticle());
    }
  }

  void howTo() {//how to play the game
    textSize(12);
    text("PRESS S TO START", width/2-50, 380);
    text("HOW TO PLAY", width/1.3, 170);
    text("MOVE RIGHT= RIGHT ARROW", width/1.4, 190);
    text("MOVE LEFT= LEFT ARROW", width/1.4, 210);
    text("JUMP= SPACE BAR", width/1.4, 230);
    text("PAUSE= PRESS P", width/1.4, 250);
  }
}