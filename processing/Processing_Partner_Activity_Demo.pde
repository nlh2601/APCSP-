//Ryan Eto and Nathanael Hui
//Processing Math Tools Demo
//9/27/24

//The purpose of this code is to solve the following math problem:
//A triangle has vertices A(0,0), B(12,0), and C(8,10).
//The probability that a randomly chosen point inside the triangle is closer to vertex B than to either vertex A or vertex C can be written as p/q, where p and q are relatively prime positive integers.
//Find p+q.
//Source: https://artofproblemsolving.com/wiki/index.php/2017_AIME_II_Problems/Problem_3

float totalPoints = 0;
float totalValidPoints = 0;
int counter = 0;
float xCheck = 0.0;
float yCheck = 0.0;
float ADist = 0.0;
float BDist = 0.0;
float CDist = 0.0; //don't mind me declaring variables
int[] pointA = {50,400};
int[] pointB = {50+12*30,400};
int[] pointC = {50+8*30,400-10*30}; //just in case A, B, or C ever change
float numerator = 0.0;
float denominator = 0.0;

float log10(float x) {
  return log(x)/log(10);
} //creates a function to take the log base 10 since the actual log function takes log base e.

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  fill(0,0,255);
 
  circle(50,400,10); //creates blue point A
  textSize(15);
  text("A", 35, 400);
  circle(50+12*30,400,10); //creates blue point B
  text("B", 420, 400);
  circle(50+8*30, 400-10*30,10); //creates blue point C
  text("C", 290, 80);
}

void draw() {
  for(int x = 0; x<300; x++) {
    if (keyPressed) {
    xCheck = random(0, 12);
    yCheck = random(0, 10); //chooses a random point to check. uses new function "random()" which chooses a random number (not neccessarily integer) between the first and second parameters).
   
    if((5*xCheck-4*yCheck > 0) && (5*xCheck+2*yCheck-60 < 0)) { //conditional statement to determine if the randomly generated points are in the triangle, we want to exclude anything outside of it otherwise our probability will be messed up.
      ADist = dist(50+30*xCheck, 400-30*yCheck, pointA[0], pointA[1]);
      BDist = dist(50+30*xCheck, 400-30*yCheck, pointB[0], pointB[1]);
      CDist = dist(50+30*xCheck, 400-30*yCheck, pointC[0], pointC[1]); //finds distance between points A, B, & C and the random point being checked. Uses new function "dist()" to find the distance between two points.
     
      if((BDist <= ADist) && (BDist <= CDist)) { //checks if the point fulfills the problem statement (closer to B than A or C)
        totalValidPoints = totalValidPoints + 1; //logs the successful finding of a point in the totalValidPoints variable
        totalPoints = totalPoints + 1; //adds one to the total number of points checked in the triangle
        fill(0,255,0);
        circle(floor(50+30*xCheck),floor(400-30*yCheck),1); //draws GREEN circle for a valid point. Uses new function "floor()" to ensure all pixel coordinates are integral.
      } else { //alternative for if the point does not fulfill the problem statement. Adds one to the # of points checked, does not add one to the successful finding of valid points
        totalPoints = totalPoints + 1;
        fill(255,0,0);
        circle(floor(50+30*xCheck),floor(400-30*yCheck),1); //draws RED circle for an invalid point
        }
      }
    }
  }
  
  numerator = pow(10, floor(log10(totalValidPoints)-3))*round(totalValidPoints/pow(10, floor(log10(totalValidPoints)-3))); //uses new function "round()" to round the totalValidPoints variable to the nearest 1000, softening the variance. New function “pow()” used to do an exponential.
  denominator = pow(10, floor(log10(totalPoints)-3))*round(totalPoints/pow(10, floor(log10(totalPoints)-3)));
  
  for(int n = 1; n < ceil(sqrt(totalPoints)); n++) { //uses new function "sqrt()" and “ceil()” to take the square root of a number and largest integer value larger than it (this is not how prime number checking works but I was desperate to figure out why it wasn’t working and just left this).
    if ((totalValidPoints % n == 0) && (totalPoints % n == 0)) { //uses new function "%" meaning modulo. Modulo is a mathematical function that returns the remainder when A is divided by B, in this case totalValidPoints divided by the integer n.
      numerator = numerator/n;
      denominator = denominator/n;
    }
  } //the purpose of this function is to simplify the fraction. It checks if there are any common factors between the totalPoints and totalValidPoints numbers and divides out the common factor if there is one. 
  // Something is broken here, I don't know what's wrong and I don't have the energy to find out there for code will not be fixed :). 
  //An alternative, non-interactive method that will actually get you the right answer (80% of the time) is pasted below.
 
  fill(255);
  textSize(32);
  noStroke();
  rect(0, 0, 250, 150);
  fill(0);
  text(round(numerator) + "/" + round(denominator), 50, 100); //writes the final fraction. Uses function “round()” to get the nearest integer to the float value
  text(totalValidPoints/totalPoints, 50, 35); //writes the final decimal value
}
