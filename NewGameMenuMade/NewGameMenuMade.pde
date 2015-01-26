//declare image and other variables.Also initialize teh variables
PImage bg;
float r=255;
float g=255;
float b=255;
float game=0;

//////////////////////////////SNAKE GAME////////////////////////////////////////////////////
//declare and initialize Arraylist                                                      ////
ArrayList<Integer> locX = new ArrayList<Integer>(), locY = new ArrayList<Integer>();    ////
//declare and initialize the block size for the snake game                              ////
float Bsz=20;                                                                           ////
//declare and initialize direction variable. This is used to make the snake move around ////
int dir=2;                                                                              ////
//declare and initialize the directions. The directions are: DOWN UP RIGHT LEFT.        ////
int[]dx= {                                                                              ////
  0, 0, 1, -1                                                                           ////
}                                                                                       ////
, dy = {                                                                                ////
  1, -1, 0, 0                                                                           ////
};                                                                                      ////
//declare and initialize boolean so the snake game can end or not                       ////
boolean gameover = false;                                                               ////
float ax, ay, w, h1;                                                                    ////
Food yummy;                                                                             ////
String s, p;                                                                            ////
int t, ps;                                                                              ////
float sw, sh, sh2, sw2;                                                                 ////
////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////DUCK HUNT/////////////////////////////////////////////////////
PImage background;                                                                      ////
PImage Duck;                                                                            ////
float randw;                                                                            ////
float randh;                                                                            ////
PFont h;                                                                                ////
int scr1=0;                                                                             ////
int scr2=0;                                                                             ////
int i;                                                                                  ////
float dif=1;                                                                            ////
float level;                                                                            ////
////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(1200, 800);
//////////////SNAKE GAME//////////////////////
  //intialize the image                   ////
  bg = loadImage("game menu.jpg");        ////
  noCursor();                             ////
  //starting point of the snake           ////
  locX.add(5);                            ////
  locY.add(5);                            ////
  println(frameRate);                     ////
  ax=12;                                  ////
  ax=10;                                  ////
  w=40;                                   ////
  h1=30;                                  ////
  yummy = new Food();                     ////
  p="Use w,a,s,d keys to move";           ////
  s="SNAKE!!!";                           ////
  sh2=height/2+80;                        ////
  sw=width/2;                             ////
  sw2=width/2;                            ////
  sh=height/2;                            ////
  t=0;                                    ////
  ps=0;                                   ////
//////////////////////////////////////////////

/////////////DUNK HUNT////////////////////////
randw=random(width/2);                    ////
  randh=width*2;                          ////
  background = loadImage("background.jpg");///
  Duck= loadImage("Duck.png");            ////
  i=50;                                   ////
  level=1;                                ////
//////////////////////////////////////////////
}
void draw() {
  noCursor();
  if (game==0) {
    background(bg);
    stroke(random(255), random(255), random(255));
    //Replace the mouse with a cooler looking cursor
    line(0, mouseY, width, mouseY);
    line(mouseX, 0, mouseX, height);

    //Change the color of the title and boxes to fade and reappear again
    fill(r, g, b);
    r-=0.5;
    g-=0.5;
    b-=0.5;
    if (r<2) {
      r=255;
    }
    if (g<2) {
      g=255;
    }
    if (b<2) {
      b=255;
    }

    textSize(100);
    textAlign(CENTER);
    text("KONK1", width/2, 100);
    textSize(40);
    textAlign(CENTER);
    text("Pick a Game", width/2, 150);
    //make the four boxes for the four games 
    rect(width/2-100, height-600, 200, 100);
    rect(width/2-100, height-475, 200, 100);
    rect(width/2-100, height-350, 200, 100);
    rect(width/2-100, height-225, 200, 100);
    textSize(30);
    textAlign(CENTER);
    fill(random(208), 2, 10);
    //Name the four boxes
    text("Duck Hunt", width/2, height-550);
    text("Connect 4", width/2, height-425);
    text("Air Hockey", width/2, height-300);
    text("Snake", width/2, height-175);
  }
  //When the first box is clicked, game  DUCK HUNT starts
   if( mousePressed && (mouseButton==RIGHT) && mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height-600 && mouseY<height-500){
      game=1;
    }
      if (game==1){
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
    text("New Game",50, 55);
    if (scr1>scr2) {
      text("New High Score:  "+ scr1, width/2, height/5);
    }
    text("to go back to main menu, press shift",width/2,height/2);
    if (keyPressed && keyCode==SHIFT){
      game=0;
      frameRate(60);
    }
    if (scr1<=scr2) {
      text("High Score:  "+scr2, width/2, height/5);
    }
    //menue
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
  //When box four is clicked on, game SNAKE begins
  if (mousePressed && (mouseButton==RIGHT) && mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height-225 && mouseY<height-125) {
    game=4;
  }

  if (game==4) {
    background(255);
    //draw the snake 
    for (int i = 0; i < locX.size (); i++) {
      fill(255, 0, 0);
      rect(locX.get(i)*Bsz, locY.get(i)*Bsz, Bsz, Bsz);
    }
    //if statement runs the game when it is not gameover
    if (!gameover) {
      //text
      fill(0, 0, 250);
      textSize(100);
      textAlign(LEFT);
      //move text
      sw=sw+1;
      text(s, sw, sh);
      //reset text
      if (sw>width) {
        sw=-400;
      }
      textAlign(LEFT);
      textSize(50);
      sw2=sw2+3;
      if (sw2>width) {
        sw2=-400;
      }
      text(p, sw2, sh2);
      textSize(25);
      textAlign(LEFT);
      text("Score:"+t, 10, 25);
      text("HI-Score:"+ps, width-300, 25);
      yummy.display();
      //Every 5 frames, move the snake
      if (frameCount%5==0) {
        locX.add(0, locX.get(0) + dx[dir]);
        locY.add(0, locY.get(0) + dy[dir]);
        //if the snake passes the left side, right side, bottom, or top of the screen, you lose
        if (locX.get(0) < 0 || locY.get(0) < 0 || locX.get(0) >= 60 || locY.get(0) >= 40) { 
          gameover=true;
          t=0;
        }
        //if the snake hits itself, you lose. For loop for every position in the arraylist besides the head
        for (int i=1; i<locX.size (); i++) {
          //if the head is equal to that position, then the you lose
          if (locX.get(0)==locX.get(i) && locY.get(0)==locY.get(i)) {
            gameover=true;
            t=0;
          }
        }
        yummy.resetfood();
      }
    }
    //gameover is true
    else {
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
      if (keyPressed && keyCode==SHIFT) {
        game=0;
        frameRate(60);
      }
    }
  }
}

void keyPressed() {
  //Make it so that when w,a,s,d keys are pressed the snake can actually move 
  //the ? is called a conditional operator and is used as a shortcut for writing an if and else statement. It takes three arguments
  int NewDir=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
  //Once snake is longer than one, snake cannot move back on itself
  if (NewDir!=-1 && (locX.size()<=1 || !(locX.get(1)==locX.get(0)+dx[NewDir] && locY.get(1)==locY.get(0)+dy[NewDir]))) {
    dir=NewDir;
  }
}

void mousePressed(){
 i--; 
}


