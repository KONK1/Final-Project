class Scope{
  
  Scope(){
  }
  
  
  void display(){
    strokeWeight(2);
  noCursor();
  fill(0, 0);
  ellipse(mouseX, mouseY, 50, 50);
  line(mouseX-25, mouseY, mouseX+25, mouseY);
  line(mouseX, mouseY-25, mouseX, mouseY+25);
  fill(200, 20, 20);
  ellipse(mouseX, mouseY, 5, 5);
  }
  
  void shoot(){
    if (mouseX>randw-20 && mouseX<randw+20 && mouseY>randh-10 && mouseY<randh+50 && mousePressed) {

    fill(200, 20, 20);
    strokeWeight(0);
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    ellipse(random(randw-50, randw+50), random(randh-35, randh+100), random(5, 20), random(5, 20));
    randw=random(width/2);
    randh=random(height/2);
    scr1=scr1+1;
  }
  }
}
  
