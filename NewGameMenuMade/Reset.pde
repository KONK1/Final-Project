class Reset {


  void resetgame() {
    //resets the game
    //if the 'r' key is pressed then the game is reset
    if (keyPressed) {
      if (key == 'r' || key == 'R') {
        resetpressed = 1;
      }
    }
    //initializes variables for after the game is reset
    if (resetpressed == 1) {
      roundend=0;
      winner=0;
      round = 1;
      r1= 1;
      r2= 1;
      r3= 1;
      r4= 1;
      r5= 1;
      r6 = 1;
      r7 = 1;
      ry=50;
      rx=600;
      yx=600;
      yy=50;
      x=430;
      y=430;
      //creates background and game board
      noStroke();
      background(175, 240, 240);
      fill(130, 60, 30);
      rect(425, 150, 350, 350, 0);

      for (y=155; y<775; y+=50)
      {
        for (x=430; x<775; x+=50)
        {
          fill(175, 240, 240);
          rect(x, y, 40, 40);
        }
      }
      fill(130, 60, 25);
      rect(425, 450, 350, 50);

      for (int a = 0; a < 10; a++) {
        for (int b = 0; b < 10; b++) {
          grid[a][b] = 21;
        }
      }
      resetpressed = 0;
    }
  }
}
