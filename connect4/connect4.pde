int a,b = 0;

int cols=7;
int rows=6;

int[][] grid = new int[100][100];

int rx,ry,x,y,yx,yy,r1,r2,r3,r4,r5,r6,r7,fall,lx,ly;
int round;
int resetpressed;
int wait = 0;
int roundend=0;
int winner = 0;

int sr = 0;
int sy = 0;

void setup(){
  size(1200, 800);
  background(175,240,240);
  
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


void draw(){
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
  textSize(20);             
  fill(0);                       
  text("Control with arrow keys, Press 'R' to reset",415,550);
 
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
//textSize(20);
//fill(0);
//text("Return To Game Menu",65,255);
  //if(mousePressed && mouseX>375 && mouseX<825 && mouseY>650 && mouseY<800){
  
  //}  
}\
