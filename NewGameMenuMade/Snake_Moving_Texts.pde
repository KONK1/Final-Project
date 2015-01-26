class SMT{
  
  SMT(){
    
  }
  
  void display(){
      //text
      fill(0, 0, 250);
      textSize(100);
      textAlign(LEFT);
      text(s, sw, sh);
      textAlign(LEFT);
      textSize(50);
      text(p, sw2, sh2);
      textSize(25);
      textAlign(LEFT);
      text("Score:"+t, 10, 25);
      text("HI-Score:"+ps, width-300, 25);
  }
  
  void moveText(){
     //move text
      sw=sw+1;    
      //reset text when it reaches past the width
      if (sw>width) {
        sw=-400;
      }
      //move text
      sw2=sw2+3;
      //reset text when it reaches past the width
      if (sw2>width) {
        sw2=-400;
      }
  }
}
     
