//declare image and other variables
PImage bg;
float r=255;
float g=255;
float b=255;
void setup() {
  size(1200, 800);
  //intialize the image
  bg = loadImage("game menu.jpg");
  noCursor();
}
void draw() {
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
   text("Pick a Game", width/2,150);
   //make the four boxes for the four games 
   rect(width/2-100,height-600,200,100);
    rect(width/2-100,height-475,200,100);
    rect(width/2-100,height-350,200,100);
    rect(width/2-100,height-225,200,100);
       textSize(30);
       textAlign(CENTER);
       fill(random(208),2,10);
   //Name the four boxes
    text("Duck Hunt",width/2,height-550);
    text("Connect 4",width/2,height-425);
    text("Air Hockey",width/2,height-300);
    text("Snake",width/2,height-175);
}

