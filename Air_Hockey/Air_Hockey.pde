int x,y,sz,speedY,speedX,padY,padW,padH ,padX1, padY1,padW1, padH1, padX;
int scoreT=0;
int scoreB=0;
int running=1;

void setup(){
  size(850,600);
   padX1=width/2-20;
  padY1=height-50;
  padW1=100;
  padH1=10;
  padY=50;
  padW=100;
  padH=10;
  x=width/2;
  y=height/2;
  sz=20;
   speedY=-3;
   speedX=3;
}

void draw(){
    //Game End
  if (running==2) {
    background(100);
    textSize(50);
    fill(random(0, 100), random(0, 100), random(0, 100));
    text("WE HAVE A WINNER!!!", width/2-250, height/2);
  }
  if (scoreB==7 || scoreT==7) {
    running=2;
  }
  //game begins
   if (running==1) {
  background(255);
  fill(0);
  y=y+speedY;
  x=x+speedX;
    strokeWeight(random(2, 12));
    stroke(random(64, 36), 97, random(99));
    fill(random(179), 2, 2);
  ellipse(x,y,sz,sz);
 
 //reset the ball after score 
  if (y-sz/2<0){
      x=width/2;
      y=height/2;
      speedY=2;
      speedX=-2;
  }
  if (y+sz/2>height){
      x=width/2;
      y=height/2;
      speedY=-2;
      speedX=2;
   }
  
  padX=mouseX;
    rect(padX, padY, padW, padH);
    //bounce off of first paddle
    if (y-sz/2 <= padY+padH && x+sz/2 <= padX+padW && x+sz/2 >= padX) {
      speedY=+5;
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
if (y+sz/2 >= padY1 && x+sz/2 <= padX1+padW1 && x+sz/2 >= padX1){
  speedY=-5;
}

//left side and right side 
  if (x-sz/2<0) {
      speedX*=-1.5;
    }
    if (x+sz/2>width) {
      speedX*=-1.5;
       
    }

// Pongball score board
    fill(237, 69, 7);
    textSize(50);
    fill(0, 250, 185);
    text(scoreB, width/2, 150);
    fill(211, 0, 14);
    text(scoreT, width/2, height-150);
  if (y-sz/2<=0) {
      scoreT+=1;
    }
    if (y+sz/2>=height) {
      scoreB+=1;
    }
}
}
