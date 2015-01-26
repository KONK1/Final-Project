class Menu{
  
  Menu(){
  }
  
  void display(){
    textAlign(LEFT);
    rect(width/3-350, height-200, 200, 100);
    fill(255, 255, 255);
    text("Easy", width/3-300, height-150);
    fill(0);
    rect(width/2-250, height-200, 200, 100);
    fill(255, 255, 255);
    text("Medium", width/2-200, height-150);
    fill(0);
    rect(width/2+50, height-200, 200, 100);
    fill(255, 255, 255);
    text("Hard", width/2+100, height-150);
    if (mousePressed && mouseX>width/3-350 && mouseX<width/3-150 && mouseY>height-200 && mouseY<height-100) {
      level=1;
    }
    if (level<1.3) {
      ellipse(width/3-325, height-120, 25, 25);
    }
    if (mousePressed && mouseX>width/2-250 && mouseX<width/2-50 && mouseY>height-200 && mouseY<height-100) {
      level=1.5;
    }
    if (level>1 && level<2) {
      ellipse(width/2-220, height-120, 25, 25);
    }
    if (mousePressed && mouseX>width/2+50 && mouseX<width/2+250 && mouseY>height-200 && mouseY<height-100) {
      level=2;
    }
    if (level>1.7) {
      ellipse(width/2+70, height-120, 25, 25);
    }

    if (mousePressed && mouseX>20 && mouseX<240 && mouseY>20 && mouseY<65) {
      if (scr1>scr2) {
        scr2=scr1;
      }
      scr1=0;
      randw=random(20, width-20);
      randh=random(height/2);
      i=50;
    }
  }
}
