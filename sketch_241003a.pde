int white = 255;//Nathanael Hui
int fillColor1 = 255; // Period 4
int fillColor2 = 255; // 10/4/24
int fillColor3 = 255; //1-7 LAB 3b Fading Color Grid
int fillColor4 = 255;//setting variables
int adder = 1;
int quadrant = 0;
int xTextPos;
int yTextPos;
String quadrantNum;//setting string(Text)
 void setup(){
 size(200,200);
}

void draw(){
 noStroke();
 fill(fillColor1);//starting color = white
 rect(0,0,width/2,height/2);//halfs the value of the width or height, and sets where to draw the square (x and y pos)
 fill(fillColor2);
 rect(0,height/2,width/2,height/2);
 fill(fillColor3);
 rect(width/2,0,width/2,height/2);
 fill(fillColor4);
 rect(width/2,height/2,width/2,height/2);
  if(mouseX < width/2 && mouseY < height/2){//if mouse is greater or less than 1/2 height or width (the middle of both axies of the canvases) then set color to 0, set quadrant number and redraw square
    fill(white);
    fillColor1 = white;
    rect(0,0,width/2,height/2);
    quadrant = 2;
  }
  if(mouseX < width/2 && mouseY > height/2){
    fill(white);
    fillColor2 = white;
    rect(0,height/2,width/2,height/2);
    quadrant = 3;
  }
  if(mouseX > width/2 && mouseY < height/2){
    fill(white);
    fillColor3 = white;
    rect(width/2,0,width/2,height/2);
    quadrant = 1;
  }
  if(mouseX > width/2 && mouseY > height/2){
    fill(white);
    fillColor4 = white;
    rect(width/2,height/2,width/2,height/2);
    quadrant = 4;
  }
  if(keyPressed){//if key pressed 1-4, it sets the quickness of how quickly the darkness of the squares appear back *input*
   if(key == '1'){
     adder = 1;
   }else if(key == '2'){
     adder = 2;
   }else if(key == '3'){
     adder = 3;
   }else if(key == '4'){
     adder = 4;
   }
  }
  fill(30,200,250);
  textSize((width+height)/sqrt(width+height));//sets the text size (i just picked random numbers and it ended up working for bigger and smaller canvases)
  if (quadrant == 1){// if quadrant = 1-4, then display "Q#" X and Y positions are in the middle of each square (1/4 of the width or height, or 3/4 of the width or height)
    quadrantNum = "Q1";
    xTextPos = width*3/4;
    yTextPos = height/4;
  }
  if (quadrant == 2){
    quadrantNum = "Q2";
    xTextPos = width/4;
    yTextPos = height/4;
  }
  if (quadrant == 3){
    quadrantNum = "Q3";
    xTextPos = width/4;
    yTextPos = height*3/4;
  }
   if (quadrant == 4){
    quadrantNum = "Q4";
    xTextPos = width*3/4;
    yTextPos = height*3/4;
  }
  text(quadrantNum,xTextPos,yTextPos);//draws the text (Q#, x and y position stated above) *new feature* (typography)
  fillColor1 = fillColor1 - adder;//if fillcolor= white, then it subtracts the # of adder (basically the color control of it turning to black
  fillColor2 = fillColor2 - adder;
  fillColor3 = fillColor3 - adder;
  fillColor4 = fillColor4 - adder;
   if(fillColor1 <= 0){//limits the fillcolor value (cant go under 0)
  fillColor1 = 0;
  }
   if(fillColor2 <= 0){
  fillColor2 = 0;
  }
   if(fillColor3 <= 0){
  fillColor3 = 0;
  }
   if(fillColor4 <= 0){
  fillColor4 = 0;
  }
}
