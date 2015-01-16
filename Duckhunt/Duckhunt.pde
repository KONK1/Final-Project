PImage background;
PImage Duck;
float randw;
float randh;
PFont h;
int scr1=0;
int scr2=0;
int i;
float dif=1;
float level;

void setup() {
  size(1200, 800);
  randw=random(width/2);
  randh=width*2;
  background = loadImage("background.jpg");
  Duck= loadImage("Duck.png");
  i=50;
  level=1;
}
void draw() {
  if (randh<width) {
    strokeWeight(0);
    background(background);
    randw=randw+level*random(5);
    randh=randh+level*random(2);
  }  
  fill(0);  
  strokeWeight(0);


  h=createFont("Arial", 30, true);
  //man
  image(Duck, randw-45, randh-25, 100, 75);

  textFont(h);
  fill(255, 255, 255);
  text("Your Score", width/2, 25);
  text(scr1, width/2, 50);
  text("shots remaining" + i, width-300, 50);

  //scope
  strokeWeight(2);
  noCursor();
  fill(0, 0);
  ellipse(mouseX, mouseY, 50, 50);
  line(mouseX-25, mouseY, mouseX+25, mouseY);
  line(mouseX, mouseY-25, mouseX, mouseY+25);
  fill(200, 20, 20);
  ellipse(mouseX, mouseY, 5, 5);

  //shoot
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


  if (randh>height+20 || i<0 || randw>width-20) {
    cursor();
    background(200, 20, 20);
    textFont(h);
    fill(0);
    text("Your Score:  "+ scr1, width/2, height/6);
    randh=height+200;
    fill(255, 255, 255);
    rect(20, 20, 220, 45);
    fill(0);
    text("New Game", 45, 55);
    if (scr1>scr2) {
      text("New High Score:  "+ scr1, width/2, height/5);
    }
    if (scr1<=scr2) {
      text("High Score:  "+scr2, width/2, height/5);
    }
    //menue
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
  
  if (i<0) {
  }
}

void mousePressed(){
 i--; 
}

