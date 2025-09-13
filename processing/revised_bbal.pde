int moveX = 200; //setting variables, //Nathanael hui 
int moveY = 200; //Pd 4, 
int rightWall = 400; // 9.24.24, 
int leftWall = 0; //sets boundaries lab 1-3 bouncing ball
int topWall = 0;
int bottomWall = 400;
int sideXTouched; //sees if side is touched
int sideYTouched;
int ballSizeW = 10;
int ballSizeH = 10;
int speedX = 4;
int speedY = 4;
int colorRed = 0;
int colorGreen = 0;
int colorBlue = 0;
void setup(){
 size(400,400); 
 background(200,0,140);
}

void draw(){
  
  if (ballSizeW <= 10){
    ballSizeW = 10;
  }
  if (ballSizeW >= 50){
    ballSizeW = 50;
  }
  if (ballSizeH <= 10){
    ballSizeH = 10;
  }
  if (ballSizeH >= 50){
    ballSizeH = 50;
  }

  
  if (moveX >= rightWall){//seeing if it touches the right wall
    sideXTouched = 1;
  }
  
  if (moveY >= bottomWall){//seeing if it touches the right wall
    sideYTouched = 1;
  }
  
  if (moveX <= leftWall){//seeing if it touches the left wall
    sideXTouched = 0;
  }
  if (moveY <= topWall){//seeing if it touches the right wall
    sideYTouched = 0;
  }
  
  if (sideXTouched == 1){
    moveX = moveX - speedX;//-1 step 
   background(200,30,140);//erases bg then shows circle so it doesnt have a trail
   fill(0,180,18);
   ellipse(moveX,moveY,ballSizeW,ballSizeH);
  } else {
    moveX = moveX + speedX;//+1 step
   background(200,0,140);
   fill(colorRed,colorGreen,colorBlue);
   ellipse(moveX,moveY,ballSizeW,ballSizeH);//tried to make it bounce but it doesnt work
  }
  
  if (sideYTouched == 1){
    moveY = moveY - speedY;//-1 step 
   background(200,30,140);//erases bg then shows circle so it doesnt have a trail
   fill(colorRed,colorGreen,colorBlue);
   ellipse(moveX,moveY,ballSizeW,ballSizeH);
  } else {
    moveY = moveY + speedY;//+1 step
   background(200,0,140);
   fill(colorRed,colorGreen,colorBlue);
   ellipse(moveX,moveY,ballSizeW,ballSizeH);//tried to make it bounce but it doesnt work
  }
  if (key == CODED){
   if (keyCode == UP){
      ballSizeW = ballSizeW + 5;
      ballSizeH = ballSizeH + 5;
     } else if (keyCode == DOWN) {
      ballSizeW = ballSizeW - 5;
      ballSizeH = ballSizeH - 5;
     }
   }
  if (keyPressed) {
   if (key == 'q' || key == 'Q'){
     speedX = speedX + 1;
   }
   if (key == 'w' || key == 'W'){
     speedX = speedX - 1;
   }
   if (key == 'e' || key == 'E'){
     speedY = speedY + 1;
   }
   if (key == 'r' || key == 'R'){
     speedY = speedY - 1;
   }
  }
  if (speedX <= 0){
    speedX = 0;
  }
  if (speedX >= 50){
    speedX = 50;
  }
  if (speedY <= 0){
    speedY = 0;
  }
  if (speedY >= 50){
    speedY = 50;
  }
  
  if (moveX >= rightWall){//seeing if it touches the right wall
    colorRed = 255;
    colorGreen = 0;
    colorBlue = 0;
  }
  
  if (moveY >= bottomWall){//seeing if it touches the right wall
    colorRed = 0;
    colorGreen = 255;
    colorBlue = 0;
  }
  
  if (moveX <= leftWall){//seeing if it touches the left wall
    colorRed = 0;
    colorGreen = 0;
    colorBlue = 255;
  }
  if (moveY <= topWall){//seeing if it touches the right wall
    colorRed = 255;
    colorGreen = 255;
    colorBlue = 255;
  }
}
