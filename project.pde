String [] wordBank = {"hook", "insult", "reason", "enlighten", "ponder", "ratty", "powerful", "certain", "alive", "utter", "annoyed", "laughable", "gold", "squalid", "cope", "shoe", "uninterested", "glistening", "gainsay", "spark", "spit", "shock", "thread", "melted", "net", "impartial", "expand", "withdraw", "solid", "watery", "things", "structure", "tremendous", "saponify", "flock", "juice", "kittens", "chairs", "quill", "abnormal", "obscene", "loose", "control", "spring", "grass", "gash", "healthy", "committee", "blue", "hue"};
String [] typeBank = {};//setting the variables and the arrays that will contain the words
String input = "";
String output = "";
int background = 40;
boolean isFinished = false;
int reset = -1;
String newOutput = "";
boolean newWords = false;
float outputTextLength;
float inputTextLength;
float resultTextLength;
float timer = 0.0;
String WPM;
boolean timerRunning = false;
float elapsedTime;
String results;
float resultsTextLength;

void setup() {
  frameRate(60);//*new function* it sets the amount of frames per second displayed on the window(i use it so that the timer is more accurate ( i think thats how it works))
  fullScreen();//*also a new function* it makes the screen full
  background(background);//sets bg color and text size
  textSize(width/40);
  for (int i=0; i<(wordBank.length/5); i++) {  //for loop that picks random words from word bank, sets it into type bank using splice, and sets the output (a string) to the words in the type bank
    typeBank = splice(typeBank, wordBank[int(random(50))], i);
    if (i<(wordBank.length/5)-1) {
      output += typeBank[i] + " ";
    }
    if (i == (wordBank.length/5)-1) {
      output += typeBank[i];
    }
  }
  outputTextLength = textWidth(output);//determines the length of the output (words displayed)
  textAlign(CENTER, CENTER);
  text("Type to start:", width/2, height/2);
}

void draw() {
  if (timerRunning && !isFinished) {  //timer it adds 1000 to track the seconds then later divides by 600000 to get wpm
    timer += 1000;
  }
  fill(60);
  rect(0, 0, width, height/10);
  if (input.equals(output)) {//ngl i accidentally pressed . and the .equals function showed up and it ended up working LOL (i used it since i couldn't get the == working) and it only works for strings
    fill(0, 255, 0); // Green if correct
    rect(width/45, height/45, width/20, height/20);
  } else {
    fill(255, 0, 0); // Red if incorrect
    rect(width/45, height/45, width/20, height/20);//visually shows if its correct or not
  }
  fill(60);
  rect((width-outputTextLength)/2, height/4.4, outputTextLength, height/19);//makes a box around the words, adjusting to the length
  fill(255);
  textAlign(CENTER, CENTER);
  text("Typing Test:", width/2, height/20);
  text(output, width/2, height/4);
  if (input.equals(output)) {
    isFinished = true;
    timerRunning = false;
    elapsedTime = timer;
    WPM = nf((wordBank.length/5)/(elapsedTime/6000000), 1, 2);//determines WPM
    results = "Hooray! Your WPM is: " + WPM + " Press enter to play again!" ;
    resultsTextLength = textWidth(results);//determines the text length
    fill(60, 20, 53);
    rect((width - resultsTextLength)/2, height/2.1, resultsTextLength, height/19);
    fill(255);
    text(results, width/2, height/2);
  }
  if (isFinished == true && newWords == false) { //basically like a forloop but i wanted to try to do it without a for loop
    reset += 1; //adds +1
    if (reset<wordBank.length/5) {
      typeBank = splice(typeBank, wordBank[int(random(50))], reset);

      if (reset<(wordBank.length/5)-1) {
        newOutput += typeBank[reset] + " ";
      }
      if (reset == (wordBank.length/5)-1) {
        newOutput += typeBank[reset];
      }
      if (reset == (wordBank.length/5)-1) {
        reset = -1;//resets to -1 since arrays start at 0, and we add 1, it goes from -1 to 0
        isFinished = false;
        newWords = true;
      }
    }
  }
}
void keyTyped() {
  if (keyPressed) {
    if (key != BACKSPACE) {
      fill(255);
      input += key;//sets your input to the key pressed
      inputTextLength = textWidth(input);
      if (key == ENTER) {
        input = input.substring(0, input.length() -1);//extracts part of a string, 0 being the start and subtracts the length by one (from previous knowlege), and when you press enter, it doesnt display enter
      }
      background(background);
      fill(60);
      rect((width-outputTextLength)/2, height/4.4, outputTextLength, height/19);
      rect(0, 0, width, height/10);
      fill(80);
      rect((width-inputTextLength)/2, height/2 + height/10, inputTextLength, height/19);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Typing Test:", width/2, height/20);
      text(input, width/2, height/2 + height/8); //displays eveyrthing so it doesnt like glitch out and flash or whatever its called
      text(output, width/2, height/4);
      if (key != ENTER) {
        timerRunning = true;
      }
    }
  }
}

void keyPressed() {
  noCursor();
  if (keyCode == BACKSPACE) {
    if (input.length()> 0) {
      input = input.substring(0, input.length() -1);//basically the same as the enter one but it doesnt display backspce
      inputTextLength = textWidth(input);
      background(background);
      fill(60);
      rect((width-outputTextLength)/2, height/4.4, outputTextLength, height/19);
      rect(0, 0, width, height/10);
      fill(80);
      rect((width-inputTextLength)/2, height/2 + height/10, inputTextLength, height/19);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Typing Test:", width/2, height/20);
      text(input, width/2, height/2 + height/8);
      text(output, width/2, height/4);
    }
  }
  if (keyCode == ENTER && newWords == true) {//when pressing enter when you complete the test, it resets your values
    input = "";
    timer = 0.0;
    isFinished = false;
    newWords = false;
    output = newOutput;
    outputTextLength = textWidth(output);
    newOutput = "";
  }
}

void mousePressed() {
  cursor();//*new function* hides your cursor when you type and shows it when you move your mouse
}

void mouseMoved() {
  cursor();
}
