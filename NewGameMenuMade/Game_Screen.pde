class Game {
  PImage background;
  PImage Duck;
  Game() {
    background = loadImage("background.jpg");
    Duck= loadImage("Duck.png");
  }

  void display() {
    if (randh<width) {
      strokeWeight(0);
      background(background);
      randw=randw+level*random(5);
       randh=randh+level*random(2);
    }
      strokeWeight(0);
    }
   void duck(){
      image(Duck, randw-45, randh-25, 100, 75);
   }
  }


