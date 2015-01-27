class Coin {


  void beginround() {
    ry=75;
    yy=75;
    fall=0;
    frameRate(10);

    //movement of the coin 
    if (keyPressed) {
      if (key=='r' ||  key=='R') {
        resetpressed=1;
      }
      //moves coin right if the right arrow is pressed 
      if (key==CODED && keyCode == RIGHT) {
        rx+=50;
        yx+=50;
        while (wait<100000000) wait++;
        wait = 0;
      }
      //moves coin left if the left arrow is pressed    
      if (key == CODED && keyCode == LEFT) {
        rx-=50;
        yx-=50;
        while (wait < 100000000) wait++;
        wait = 0;
      }
      //drops coin in the column if the down arrow is pressed
      if (key == CODED && keyCode == DOWN) {
        fall = 1;
      }
    }
    for (y=425; y<400; y+=50)
    {
      for (x=430; x<800; x+=50)
      {
        fill(175, 240, 240);
        rect(x, y, 40, 40);
      }
    }
  }

  //draws the coins
  //draws the red coin
  void redcoin() {
    fill(190, 5, 5);
    ellipse(rx, ry, 40, 40);
  }
  //draws the yellow coin
  void yellowcoin() {
    fill(245, 250, 15);
    ellipse(rx, ry, 40, 40);
  }
}
