class SES{
  SES(){
  }
  void display(){
fill(0); 
    textSize(30); 
    textAlign(CENTER); 
    text("Sorry, game over!!! Press space to restart", width/2, height/2);
    text("Or Press shift to go to menu", width/2, height/2+50);
    //if you press the spacebar, the game resets
    if (keyPressed &&key==' ') { 
      //clear the arraylist for LocX and locY
      locX.clear(); 
      locY.clear(); 
      //readd snake in the beginning of the screen
      locX.add(5);  
      locY.add(5); 
      gameover = false;     
    }
    //back button so that you can go back to the menu
     if (keyPressed && keyCode==SHIFT) {
        game=0;
        frameRate(60);
     }
  }
}
