//to add the music 
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer arcmusic;


//declare image and other variables.Also initialize the variables for the game menu
PImage bg;
float r=255;
float g=255;
float c=255;
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
ST st;                                                                                  ////
SES ses;                                                                                ////
Food yummy;                                                                             ////
String s, p;                                                                            ////
int t, ps;                                                                              ////
float sw, sh, sh2, sw2;                                                                 ////
////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////DUCK HUNT/////////////////////////////////////////////////////
PImage Duck;                                                                            ////
float randw, randh, level;                                                              ////
PFont h;                                                                                ////
int scr1=0;                                                                             ////
int scr2=0;                                                                             ////
int i;                                                                                  ////
float dif=1;                                                                            ////                                                                     
Scope scope;                                                                            ////
Game gamescreen;                                                                        ////
Menu menu;                                                                              ////
////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////CONNECT FOUR////////////////////////////////////////////////////
int a,b = 0;                                                                            ////                  
                                                                                        ////
int cols=7;                                                                             ////
int rows=6;                                                                             ////
                                                                                        ////
int[][] grid = new int[100][100];                                                       ////
                                                                                        ////
int rx,ry,x,y,yx,yy,r1,r2,r3,r4,r5,r6,r7,fall,lx,ly;                                    ////
int round;                                                                              ////
int resetpressed;                                                                       ////
int wait = 0;                                                                           ////
int roundend=0;                                                                         ////
int winner = 0;                                                                         ////                                                           
                                                                                        ////
int sr = 0;                                                                             ////
int sy = 0;                                                                             ////
////////////////////////////////////////////////////////////////////////////////////////////

////////////AIR HOCKEY//////////////////////////////////
int x1,y1,sz,speedY,speedX;                           ////
int padY,padW,padH ,padX1, padY1,padW1, padH1, padX;////
int scoreT=0;                                       ////
int scoreB=0;                                       ////
int running=0;                                      ////
////////////////////////////////////////////////////////


void setup() {
  size(1200, 800);
  //music in the background
   minim = new Minim(this);
  arcmusic = minim.loadFile("Arcade.mp3");
  arcmusic.loop();
  
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
  st = new ST();                          ////
  ses = new SES();                        ////
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
  i=50;                                   ////
  level=1; 
  scope = new Scope();                    ////
  gamescreen = new Game();                ////
  menu = new Menu();                      ////
  //////////////////////////////////////////////
 
 ////////////CONNECT FOUR///////////////////////
 padX1=width/2-20;                          ////
  padY1=height-50;                          ////
  padW1=100;                                ////
  padH1=10;                                 ////
  padY=50;                                  ////
  padW=100;                                 ////
  padH=10;                                  ////
  x1=width/2;                                ////
  y1=height/2;                               ////
  sz=20;                                    ////
   speedY=-3;                               ////
   speedX=3;                                ////
////////////////////////////////////////////////
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
    fill(r, g, c);
    r-=0.5;
    g-=0.5;
    c-=0.5;
    if (r<2) {
      r=255;
    }
    if (g<2) {
      g=255;
    }
    if (c<2) {
      c=255;
    }

    textSize(100);
    textAlign(CENTER);
    text("KONK1", width/2, 100);
    textSize(40);
    textAlign(CENTER);
    text("Right Click to pick a Game", width/2, 150);
    textSize(20);
    text("*AIR HOCKEY* press shift to go back to main menu after six points",width/2,height-60);
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
  if ( mousePressed && (mouseButton==RIGHT) && mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height-600 && mouseY<height-500) {
    game=1;
  }
  if (game==1) {
    gamescreen.display();
    //duck
    gamescreen.duck();
    h=createFont("Arial", 30, true);
    textFont(h);
    fill(255, 255, 255);
    text("Your Score", width/2, 25);
    text(scr1, width/2, 50);
    text("shots remaining" + i, width-300, 50);

    //scope
     scope.display();
    //shoot
   scope.shoot();

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
      text("New Game", 50, 55);
      if (scr1>scr2) {
        text("New High Score:  "+ scr1, width/2, height/5);
      }
      text("to go back to main menu, press shift", width/2, height/2);
      if (keyPressed && keyCode==SHIFT) {
        game=0;
        frameRate(60);
      }
      if (scr1<=scr2) {
        text("High Score:  "+scr2, width/2, height/5);
      }
      //menue
      menu.display();
  }
  }
  //When Box two is clicked on, CONNECT FOUR will start
  if( mousePressed && (mouseButton==RIGHT) && mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height-475 && mouseY<height-375){
game=2;
  for(int a=0; a<cols; a++){
  for(int b=0; b<rows; b++){
    grid[a][b] = 21;
  }
 }

//initialize variables
round =1;
  r1= 1;
  r2= 1;
  r3= 1;
  r4= 1;
  r5= 1;
  r6 = 1;
  r7 = 1;
  lx = 1;
  ly = 1;
  ry=450;
  rx=600;
  yx=600;
  yy=450;
  x=430;
  y=430;
  //create background and game board
  noStroke();
  background(175,240,240);
  fill(130,60,30);
  rect(425,150,350,350,0);

  for(y=155;y<775;y+=50)
  {
   for(x=430;x<775;x+=50)
   {
   fill(175,240,240);
   rect(x,y,40,40);
   }
  }
  fill(130,60,25);
  rect(425,450,350,50);
}
 
 
 if (game==2){
   //creates border shepes
  fill(0,0,0);
  rect(0,0,375,height);
  rect(825,0,width,height);
  fill(0,10,200);
  rect(0,0,width,100);
  fill(255);
  //creates scoreboard and instructions
  PFont k;
  k=createFont("Arial",200,true);
  textFont(k);
  fill(190,5,5);
  text(sr,150,height/2+100);
  fill(245,250,15);
  text(sy,width-250,height/2+100);
  beginround();
  textAlign(LEFT);
  textSize(20);             
  fill(0);                       
  text("Control with arrow keys, Press 'R' to reset",415,550);
  text("Press shift to go back to main menu",440,570);
 
 //winner is listed and score changes
  if (winner == 1 && roundend == 0)
 {
   roundend = 1;
     
   textSize(45);
 
   if(round%2 == 0)
   {
     fill(190,5,5);
     text("Red Wins!",485,625);
     roundend = 1;
     sr+=1;
   }
   
   if(round%2 == 1)
  {
     fill(245,250,15);
     text("Yellow Wins!",460,625);
     roundend = 1;
     sy+=1;
  }
    
 }
 
 //allows coin to be placed in a column
 if (fall == 1){
         
       
      if (rx == 450)
      {
        ry = 475-50*r1;
        yy = ry;
        if(round%2 == 1) grid[1][r1] = 1;
        if(round%2 == 0) grid[1][r1] = 5;
        r1++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
         
                 
      if (rx == 500)
      {
        ry = 475-50*r2;
        yy = ry;
        if(round%2 == 1) grid[2][r2] = 1;
        if(round%2 == 0) grid[2][r2] = 5;
        r2++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
      if (rx == 550)
      {
        ry = 475-50*r3;
        yy = ry;
        if(round%2 == 1) grid[3][r3] = 1;
        if(round%2 == 0) grid[3][r3] = 5;
        r3++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
  
      if (rx == 600)
      {
        ry = 475-50*r4;
        yy = ry;
        if(round%2 == 1) grid[4][r4] = 1;
        if(round%2 == 0) grid[4][r4] = 5;
        r4++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
       
 
      if (rx == 650)
      {
        ry = 475-50*r5;
        yy = ry;
        if(round%2 == 1) grid[5][r5] = 1;
        if(round%2 == 0) grid[5][r5] = 5;
        r5++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
      
      if (rx == 700)
      {
        ry = 475-50*r6;
        yy = ry;
        if(round%2 == 1) grid[6][r6] = 1;
        if(round%2 == 0) grid[6][r6] = 5;
        r6++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      }
 
      if (rx == 750)
      {
        ry = 475-50*r7;
        yy = ry;
        if(round%2 == 1) grid[7][r7] = 1;
        if(round%2 == 0) grid[7][r7] = 5;
        r7++;
           while(wait < 100000000) wait++;
   wait = 0;
        round++;
      } 
 }      
          
  if(round%2 == 1)
 {
  redcoin();
 if (fall == 1) yellowcoin();
 }
 
  if(round%2 == 0)
 {
  yellowcoin();
  if (fall == 1) redcoin();
 }
 
 //keep coin from leaving the game area
 if(rx>800){
   rx=600;
 }
 if(yx>800){
   yx=600;
 }
 if(rx<400){
   rx=600;
 }
 if(yx<400){
   yx=600;
 }
  
resetgame();
check();

fill(10,50,200);
rect(375,650,450,150);
if (keyPressed && keyCode==SHIFT){
  game=0;
  frameRate(60);
}
 }
 //When box three is clicked on, game Air Hockey starts
 if (mousePressed && (mouseButton==RIGHT) && mouseX>width/2-100 && mouseX<width/2+100 && mouseY>height-350 && mouseY<height-250){
   game=3;
 }
 
 if (game==3){
   running=1;
 }
 
  //Game End  
  if (scoreB==7 || scoreT==7) {
    running=2;
     if (keyPressed && keyCode==SHIFT){
      game=0;
      stroke(1);
      strokeWeight(1);
    }
  }
 
  //game begins
   if (running==1) {
  background(255);
  fill(0);
  y1=y1+speedY;
  x1=x1+speedX;
    strokeWeight(random(2, 12));
    stroke(random(64, 36), 97, random(99));
    fill(random(179), 2, 2);
  ellipse(x1,y1,sz,sz);
 
 //reset the ball after score 
  if (y1-sz/2<0){
      x1=width/2;
      y1=height/2;
      speedY=2;
      speedX=-2;
  }
  if (y1+sz/2>height){
      x1=width/2;
      y1=height/2;
      speedY=-2;
      speedX=2;
   }
  
  padX=mouseX;
    rect(padX, padY, padW, padH);
    //bounce off of first paddle
    if (y1-sz/2 <= padY+padH && x1+sz/2 <= padX+padW && x1+sz/2 >= padX) {
      speedY= 5;
    }
    rect(padX1, padY1, padW1, padH1);
//controls to move second paddle
if (keyPressed && keyCode==LEFT) {
      padX1=padX1-8;
    }
    if (keyPressed && keyCode==RIGHT) {
      padX1=padX1+8;
    }
//bounce off of second paddle
if (y1+sz/2 >= padY1 && x1+sz/2 <= padX1+padW1 && x1+sz/2 >= padX1){
  speedY=-5;
}

//left side and right side 
  if (x1-sz/2<0) {
      speedX*=-1.5;
    }
    if (x1+sz/2>width) {
      speedX*=-1.5;
       
    }

// Pongball score board
    fill(237, 69, 7);
    textSize(50);
    fill(0, 250, 185);
    text(scoreB, width/2, 150);
    fill(211, 0, 14);
    text(scoreT, width/2, height-150);
  if (y1-sz/2<=0) {
      scoreT+=1;
    }
    if (y1+sz/2>=height) {
      scoreB+=1;
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
    //Run the game when it is not gameover
    if (!gameover) {
      st.display();
      st.moveText();
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
      ses.display();
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

void mousePressed() {
  i--;
}

void resetgame(){
  //resets the game
  if(keyPressed){
    if(key == 'r' || key == 'R'){
      resetpressed = 1;
    }
  }
  //initializes variables for after the game is reset
  if (resetpressed == 1){
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
   ry=450;
   rx=600;
   yx=600;
   yy=450;
   x=430;
   y=430;
   //creates background and game board
  noStroke();
  background(175,240,240);
  fill(130,60,30);
  rect(425,150,350,350,0);
  
  for(y=155;y<775;y+=50)
  {
   for(x=430;x<775;x+=50)
   {
   fill(175,240,240);
   rect(x,y,40,40);
   }
  }
  fill(130,60,25);
  rect(425,450,350,50);
  
  for (int a = 0; a < 10; a++) {
    for (int b = 0; b < 10; b++) {
    grid[a][b] = 21;
  }
}
  resetpressed = 0;
}
}

void check(){  
  
//horizontal check
  for (a=0; a < 7;a++){
    for (b = 0; b<7;b++){
        int Check = (grid[b][a]) + (grid[b+1][a]) + (grid[b+2][a]) + (grid[b+3][a]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
           lx = a*50+25;
          ly = b*50+25;
        }
    }
  }
  //vertical check
    for (a=0; a < 7;a++){
    for (b = 0; b<8;b++){
        int Check = (grid[b][a]) + (grid[b][a+1]) + (grid[b][a+2]) + (grid[b][a+3]);
        if (Check == 20 || Check == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
    }
  }
  // diagonal check
  for (int a =0; a < 8-4; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
    
    for (int a=0; a < 8-4; a++) {
      for (int b=3; b < 8; b++) {
        int tCheck = (grid[b][a]) + (grid[b-1][a+1]) + (grid[b-2][a+2]) + (grid[b-3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
   
  for (int a=0; a < 8-4; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a+1]) + (grid[b+2][a+2]) + (grid[b+3][a+3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
  for (int a=6; a < 8; a++) {
      for (int b=0; b < 8-4; b++) {
        int tCheck = (grid[b][a]) + (grid[b+1][a-1]) + (grid[b+2][a-2]) + (grid[b+3][a-3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
  for (int a =3; a < 8; a++) {
      for (int b=3; b < 8; b++) {
        int tCheck = (grid[b][a]) + (grid[b-1][a-1]) + (grid[b-2][a-2]) + (grid[b-3][a-3]);
        if (tCheck == 20 || tCheck == 4)
        {
          winner = 1;
          lx = a*50+25;
          ly = b*50+25;
        }
      }
    }
 
}

void beginround(){
  ry=75;
  yy=75;
  fall=0;
  frameRate(10);
  
//movement of the coin 
if(keyPressed){
  if(key=='r' ||  key=='R'){
    resetpressed=1;
  }
  
  if(key==CODED && keyCode == RIGHT){
    rx+=50;
    yx+=50;
    while(wait<100000000) wait++;
    wait = 0;
  }
    
    if (key == CODED && keyCode == LEFT) {
    rx-=50;
    yx-=50;
       while(wait < 100000000) wait++;
   wait = 0;
   }
   if (key == CODED && keyCode == DOWN) {
     fall = 1;
    }
}
for(y=425;y<400;y+=50)
  {
   for(x=430;x<800;x+=50)
   {
   fill(175,240,240);
   rect(x,y,40,40);
   }
  }
}

//draws the coins
void redcoin(){
  fill(190,5,5);
  ellipse(rx,ry,40,40);
}
 
void yellowcoin(){
  fill(245,250,15);
  ellipse(rx,ry,40,40);
}

