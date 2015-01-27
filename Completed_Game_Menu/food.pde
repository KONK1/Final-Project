class Food {
  //declare variables
  float apX, apY, Bsz;

  Food() {
    //initialize variables
    apX=12;
    apY=10;
    Bsz=20;
  }

  void display() {
    //starting point for apple
    fill(0, 255, 0); 
    rect(apX*Bsz, apY*Bsz, Bsz, Bsz);
  }

  void resetfood() {
    //if snake touches the apple
    if (locX.get(0)==apX && locY.get(0)==apY) { 
      //Screen flashes red. Just to make sure snake eats apple.
      background(random(255), 0, 0);
    //new apple 
      apX = (int)random(0, w); 
      apY = (int)random(0, h1);
      //increase the score
      t++;
      //set the high score 
      if (t>ps) {
        ps=t;
      }
    } else { 
      //makes the snake grow in size
      locX.remove(locX.size()-1);
      locY.remove(locY.size()-1);
    }
  }
} 
