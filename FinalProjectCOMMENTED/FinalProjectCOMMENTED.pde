
import gifAnimation.*; 

import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

StopWatch sw = new StopWatch();

int level = 1;
int nbr_dead = 0;
int numEnemy;
int baseEnemyHealth = 5;

class EnemySprite extends Sprite {
  int pathIndex = 0;
  int health = 5;
  EnemySprite(PApplet p, String img, int n) {
    super(p, img, n);
  }
}

Sprite balloon;
EnemySprite[] enemies = new EnemySprite[100];

boolean pathGo = true;
int[] path = new int[100];
int pathSize;
int pathCount;

float pathX;
float pathY;
int pathRoute;

int currentEnemyIndex = 0;
int spawnInterval = 3000;
int lastSpawnTime = 0;

int playerHealth = 10;
int healthLossPerEnemy = 1;

Sprite shopUnit1, shopUnit2, shopUnit3;
Sprite heldUnit = null;
ArrayList<Sprite> placedUnits = new ArrayList<Sprite>();

HashMap<Sprite, Integer> lastAttackTime = new HashMap<Sprite, Integer>();
HashMap<Sprite, Integer> attackCooldowns = new HashMap<Sprite, Integer>();
HashMap<Sprite, Integer> attackDamages = new HashMap<Sprite, Integer>();
HashMap<Sprite, Float> unitRanges = new HashMap<Sprite, Float>();
HashMap<Sprite, String> unitRangeColors = new HashMap<Sprite, String>();
HashMap<Sprite, Integer> upgradeCosts = new HashMap<Sprite, Integer>();

int unit1Cost = 20;
int unit2Cost = 80;
int unit3Cost = 10;

float unit1Range = 200;
float unit2Range = 150;
float unit3Range = 400;

int unit1Damage = 2;
int unit2Damage = 5;
int unit3Damage = 1;

int unit1Cooldown = 1000;
int unit2Cooldown = 5000;
int unit3Cooldown = 500;

PImage clickerButton;
PImage upgrade1;
PImage upgrade2;
PImage upgrade3;
PImage BJ;
PImage winLose;
PImage hit;
PImage stand;
PImage play;
PImage slotSelect;
PImage BJSelect;
PImage[] animation;

int points = 0;
int buttonSize = height / 3;

int upgrade1X = width / 12;
int upgrade1Y = height / 16;
int upgrade2X = width / 12;
int upgrade2Y = height / 16;
int upgrade3X = width / 12;
int upgrade3Y = height / 16;

int slotSelectX = width / 12;
int slotSelectY = height / 16;
int BJSelectX = width / 12;
int BJSelectY = height / 16;

int playX = width / 4;
int playY = height / 12;
int hitX = width / 12;
int hitY = height / 16;
int standX = width / 12;
int standY = height / 16;

int addingMultiplier = 1;

int slotsNum1 = 0;
int slotsNum2 = 0;
int slotsNum3 = 0;

boolean slotsTF;
boolean bjTF;
boolean standTF = false;

int dealerBJ1;
int dealerBJ2;
int playerHit = 0;
int dealerHit = 0;
String dealerBJNum = " ";
String playerBJNum = " ";
int playerBJ1;
int playerBJ2;
int totalPlayerBJNum;
int totalDealerBJNum;
String resultText = " ";

int[] multipliers = {1, 3, 15, 2, 3};
int[] costs = {300, 900, 8100};

boolean gameStartBJ = true;
boolean gameStartSlots = true;
boolean midGameBJ = true;
boolean pause = false;

Gif slotGif;

public void setup() {
  fullScreen();
  background(255);

  pathSize = displayHeight / 10;

  fill(255);
  rect(0, 0, displayWidth / 2, displayHeight);

  fill(198,152,116);
  rect(0, 0, pathSize + 20f, displayHeight);

  pathX = random(pathSize + 20f, displayWidth / 2 - pathSize);
  pathY = 0;
  fill(0, 255, 0);
  rect(pathX, pathY, pathSize, pathSize);

  shopUnit1 = new Sprite(this, "pork.png", 1);
  shopUnit1.setXY(pathSize / 2f, pathSize / 2f);
  shopUnit1.setVisible(true);

  shopUnit2 = new Sprite(this, "cow.png", 1);
  shopUnit2.setXY(pathSize / 2f, pathSize * 1.5f);
  shopUnit2.setVisible(true);

  shopUnit3 = new Sprite(this, "kfc.png", 1);
  shopUnit3.setXY(pathSize / 2f, pathSize * 2.5f);
  shopUnit3.setVisible(true);

  registerMethod("pre", this);
  startNewLevel();
  frameRate(120); 
  fullScreen(); 
  clickerButton = loadImage("maccy.png");
  upgrade1 = loadImage("maccy.png");
  upgrade2 = loadImage("maccy.png");
  upgrade3 = loadImage("maccy.png");
  BJ = loadImage("table.png");
  hit = loadImage("button.png");
  stand = loadImage("button.png");
  play = loadImage("button.png");
  slotSelect = loadImage("button.png");
  BJSelect = loadImage("button.png");

  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  slotGif = new Gif(this, "slots.gif");
  slotsTF = false;
  bjTF = false;

}


public void resizeImage() {
  if (mouseX >= 3*width/4 - height/6 && mouseX <= 3*width/4 + height/6 &&
      mouseY >= height/4 - height/6 && mouseY <= height/4 + height/6) {
    buttonSize = height/3 + height/24;
  } else {
    buttonSize = height/3;
  }

  if (mouseX >= 18*width/32 - upgrade1X/2 && mouseX <= 18*width/32 + upgrade1X/2 &&
      mouseY >= 3*height/32 - upgrade1Y/2 && mouseY <= 3*height/32 + upgrade1Y/2) {
    upgrade1X = width/12 + width/24;
    upgrade1Y = height/16 + height/24;
  } else {
    upgrade1X = width/12;
    upgrade1Y = height/16;
  }

  if (mouseX >= 18*width/32 - upgrade2X/2 && mouseX <= 18*width/32 + upgrade2X/2 &&
      mouseY >= height/4 - upgrade2Y/2 && mouseY <= height/4 + upgrade2Y/2) {
    upgrade2X = width/12 + width/24;
    upgrade2Y = height/16 + height/24;
  } else {
    upgrade2X = width/12;
    upgrade2Y = height/16;
  }

  if (mouseX >= 18*width/32 - upgrade3X/2 && mouseX <= 18*width/32 + upgrade3X/2 &&
      mouseY >= 13*height/32 - upgrade3Y/2 && mouseY <= 13*height/32 + upgrade3Y/2) {
    upgrade3X = width/12 + width/24;
    upgrade3Y = height/16 + height/24;
  } else {
    upgrade3X = width/12;
    upgrade3Y = height/16;
  }

  if (mouseX >= 18*width/32 - width/24 && mouseX <= 18*width/32 + width/24 &&
      mouseY >= 47*height/64 - width/32 && mouseY <= 47*height/64 + height/32) {
    slotSelectX = width/12 + width/24;
    slotSelectY = height/16 + height/24;
  } else {
    slotSelectX = width/12;
    slotSelectY = height/16;
  }

  if (mouseX >= 18*width/32 - width/24 && mouseX <= 18*width/32 + width/24 &&
      mouseY >= 53*height/64 - width/32 && mouseY <= 53*height/64 + height/32) {
    BJSelectX = width/12 + width/24;
    BJSelectY = height/16 + height/24;
  } else {
    BJSelectX = width/12;
    BJSelectY = height/16;
  }

  if (mouseX >= 3*width/4 - width/8 && mouseX <= 3*width/4 + width/8 &&
      mouseY >= 17*height/18 - width/24 && mouseY <= 17*height/18 + height/24) {
    playX = width/4 + width/24;
    playY = height/12 + height/24;
  } else {
    playX = width/4;
    playY = height/12;
  }

  if (mouseX >= 30*width/32 - width/24 && mouseX <= 30*width/32 + width/24 &&
      mouseY >= 47*height/64 - width/32 && mouseY <= 47*height/64 + height/32) {
    hitX = width/12 + width/24;
    hitY = height/16 + height/24;
  } else {
    hitX = width/12;
    hitY = height/16;
  }

  if (mouseX >= 30*width/32 - width/24 && mouseX <= 30*width/32 + width/24 &&
      mouseY >= 53*height/64 - width/32 && mouseY <= 53*height/64 + height/32) {
    standX = width/12 + width/24;
    standY = height/16 + height/24;
  } else {
    standX = width/12;
    standY = height/16;
  }
}


public void blackjackNumbers() {
  resultText = " ";
  totalDealerBJNum = 0;
  totalPlayerBJNum = 0;

  dealerBJ1 = int(random(1,14));
  if (dealerBJ1 >= 10) dealerBJ1 = 10;
  dealerBJ2 = int(random(1,14));
  if (dealerBJ2 >= 10) dealerBJ2 = 10;

  playerBJ1 = int(random(1,14));
  if (playerBJ1 >= 10) playerBJ1 = 10;
  playerBJ2 = int(random(1,14));
  if (playerBJ2 >= 10) playerBJ2 = 10;

  totalDealerBJNum = dealerBJ1 + dealerBJ2;
  dealerBJNum = "Dealer: " + totalDealerBJNum;

  totalPlayerBJNum = playerBJ1 + dealerBJ2;
  playerBJNum = "Player: " + totalPlayerBJNum;
}

public void blackjackHit() {
  if (!standTF) {
    playerHit = int(random(1,14));
    if (playerHit > 10) playerHit = 10;
    totalPlayerBJNum += playerHit;
    playerBJNum = "Player: " + totalPlayerBJNum;
  } else {
    while (totalDealerBJNum <= 16) {
      dealerHit = int(random(1,14));
      if (dealerHit > 10) dealerHit = 10;
      totalDealerBJNum += dealerHit;
      dealerBJNum = "Dealer: " + totalDealerBJNum;
    }

    if (totalPlayerBJNum <= 21 && totalDealerBJNum <= 21) {
      if (totalDealerBJNum < totalPlayerBJNum) {
        resultText = "win";
        points *= multipliers[4];
      } else if (totalDealerBJNum > totalPlayerBJNum) {
        resultText = "lose";
        points = 0;
      } else {
        resultText = "tie";
      }
    } else if (totalPlayerBJNum > 21) {
      resultText = "lose";
      points = 0;
    } else if (totalDealerBJNum > 21) {
      resultText = "win";
      points *= multipliers[4];
    } else {
      resultText = "lose";
      points = 0;
    }

    midGameBJ = true;
  }
}

public void randomSlotsNumbers() {
  slotsNum1 = int(random(10));
  slotsNum2 = int(random(10));
  slotsNum3 = int(random(10));
}

public void slotChecker() {
  if (slotsNum1 == slotsNum2 || slotsNum2 == slotsNum3 || slotsNum1 == slotsNum3) {
    resultText = "win";
    points *= multipliers[3];
  } else if (slotsNum1 == slotsNum2 && slotsNum2 == slotsNum3) {
    resultText = "win";
    points *= multipliers[4];
  } else {
    resultText = "lose";
    points = 0;
  }
}


public void pre() {
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
  if (nbr_dead == numEnemy) {
    level++;
    baseEnemyHealth = 5 + level * level; 
    startNewLevel();
  }
  S4P.updateSprites(elapsedTime);
}

public void draw() {
    background(#C19A6B);
  resizeImage();
  float drawX = pathX;
  float drawY = pathY;

  fill(180);
  rect(0, 0, displayWidth / 2, displayHeight);

  fill(198,152,116);
  rect(0, 0, pathSize + 20f, displayHeight);

  if (pathGo) {
    pathSet();
    pathGo = false;
  }

  fill(0, 255, 0);
  stroke(0);
  rect(drawX, drawY, pathSize, pathSize);

  for (int j = 0; j < 3; j++) {
    drawY += pathSize;
    fill(232, 220, 202);
    stroke(0);
    rect(drawX, drawY, pathSize, pathSize);
  }

  for (int i = 0; i < pathCount; i++) {
    if (path[i] == 0) drawY += pathSize;
    else if (path[i] == 1) drawX -= pathSize;
    else if (path[i] == 2) drawX += pathSize;

    fill(232, 220, 202);
    stroke(0);
    rect(drawX, drawY, pathSize, pathSize);
  }

  fill(255, 0, 0);
  stroke(0);
  rect(drawX, drawY, pathSize, pathSize);

  S4P.drawSprites();

  if (heldUnit != null) {
    heldUnit.setXY(mouseX, mouseY);
  }

  int now = millis();
  if (now - lastSpawnTime > spawnInterval) {
    spawnEnemy();
    lastSpawnTime = now;
  }

  for (int i = 0; i < numEnemy; i++) {
    EnemySprite e = enemies[i];
    if (e.isVisible() && !e.isDead()) {
      followPath(e);
    }
  }

  for (Sprite tower : placedUnits) {
    float range = unitRanges.getOrDefault(tower, 200f);
    String rangeColor = unitRangeColors.getOrDefault(tower, "blue");

    if (rangeColor.equals("blue")) fill(0, 0, 255, 50);
    else if (rangeColor.equals("brown")) fill(150, 75, 0, 50);
    else if (rangeColor.equals("orange")) fill(255, 165, 0, 50);

    noStroke();
    ellipse((float)tower.getX(), (float)tower.getY(), 2 * range, 2 * range);
    stroke(0);

    for (EnemySprite e : enemies) {
      if (e.isVisible() && !e.isDead()) {
        float d = dist((float)tower.getX(), (float)tower.getY(), (float)e.getX(), (float)e.getY());
        if (d < range) {
          int lastTime = lastAttackTime.getOrDefault(tower, 0);
          int cooldown = attackCooldowns.getOrDefault(tower, 1000);
          if (now - lastTime >= cooldown) {
            int damage = attackDamages.getOrDefault(tower, 1);
            e.health -= damage;
            lastAttackTime.put(tower, now);
            if (e.health <= 0) {
              e.setVisible(false);
              e.setDead(true);
              nbr_dead++;
            }
          }
        }
      }
    }
  }

  for (EnemySprite e : enemies) {
    if (e.isVisible() && !e.isDead()) {
      fill(255, 0, 0);
      rect((float)e.getX() - 10, (float)e.getY() - 30, 20, 5);
      fill(0, 255, 0);
      float healthRatio = e.health / (float)baseEnemyHealth;
      rect((float)e.getX() - 10, (float)e.getY() - 30, 20 * healthRatio, 5);
    }
  }

  fill(0);
  textSize(32);
  text("Health: " + playerHealth, 100, 40);
  text("points: " + points, 100, 80);
  text("Level: " + level, 100, 120);
  text("Enemies Left: " + (numEnemy - nbr_dead), 100, 160);

  textSize(16);
  for (Sprite tower : placedUnits) {
    int cost = upgradeCosts.getOrDefault(tower, 5);
    fill(0);
    text("Upgrade: " + cost, (float)tower.getX() - 20, (float)tower.getY() + 40);
  }

  if (playerHealth <= 0) {
    delay(10);
    fill(255, 0, 0);
    textSize(64);
    text("GAME OVER", displayWidth / 4f - 150, displayHeight / 2f);
    noLoop();
  }
  fill(255);
  fill(0);
  textSize(20);
  image(clickerButton, 3 * width / 4, height / 4, buttonSize, buttonSize);

  image(upgrade1, 18 * width / 32, 3 * height / 32, upgrade1X, upgrade1Y);
  text("Expand factories: 300", 18 * width / 32, 5 * height / 32);
  image(upgrade2, 18 * width / 32, height / 4, upgrade2X, upgrade2Y);
  text("Expand factories: 900", 18 * width / 32, 10 * height / 32);
  image(upgrade3, 18 * width / 32, 13 * height / 32, upgrade3X, upgrade3Y);
  text("Expand factories: 8100", 18 * width / 32, 15 * height / 32);

  text("points: " + points, 18 * width / 20, height / 20);

  fill(255);
  image(slotSelect, 18 * width / 32, 47 * height / 64, slotSelectX, slotSelectY);
  image(BJSelect, 18 * width / 32, 53 * height / 64, BJSelectX, BJSelectY);
  fill(0);
  textSize(30);
  text("slots", 18 * width / 32, 47 * height / 64);
  text("21", 18 * width / 32, 53 * height / 64);
  fill(255);

  if (points == 0) {
    gameStartBJ = false;
    gameStartSlots = false;
  } else {
    gameStartBJ = true;
    gameStartSlots = true;
  }

  if (bjTF == true) {
    image(BJ, 3 * width / 4, 7 * height / 9, width / 3, 3 * height / 9);
    image(play, 3 * width / 4, 17 * height / 18, playX, playY);
    image(hit, 30 * width / 32, 47 * height / 64, hitX, hitY);
    image(stand, 30 * width / 32, 53 * height / 64, standX, standY);
    noStroke();
    fill(#C19A6B);
    rect(3 * width / 4, 22 * height / 36, width / 4, height / 20);
    fill(0);
    textSize(30);
    text("hit", 30 * width / 32, 47 * height / 64);
    text("stand", 30 * width / 32, 53 * height / 64);
    text("play", 3 * width / 4, 17 * height / 18);
    fill(255);
    text(playerBJNum, 3 * width / 4, 60 * height / 72);
    text(dealerBJNum, 3 * width / 4, 56 * height / 72);
    fill(0);
    text(resultText, 3 * width / 4, 22 * height / 36);
  } 
  else if (slotsTF == true) {
    image(slotGif, 3 * width / 4, 7 * height / 9, width / 3, 3 * height / 9);
    image(play, 3 * width / 4, 17 * height / 18, playX, playY);
    noStroke();
    fill(#C19A6B);
    rect(3 * width / 4, 22 * height / 36, width / 4, height / 20);
    fill(0);
    textSize(56);
    text(slotsNum1, 92 * width / 128, 62 * height / 81);
    text(slotsNum2, 97 * width / 128, 62 * height / 81);
    text(slotsNum3, 102 * width / 128, 62 * height / 81);
    textSize(30);
    text(resultText, 3 * width / 4, 22 * height / 36);
    text("play", 3 * width / 4, 17 * height / 18);
  }
}

public void spawnEnemy() {
  float enemyX = pathX;
  float enemyY = pathY;
  if (currentEnemyIndex < numEnemy) {
    EnemySprite e = enemies[currentEnemyIndex];
    e.setXY(enemyX + pathSize / 2f, enemyY + pathSize / 2f);
    e.setSpeed(100f, (3f * PI) / 2f);
    e.setAccXY(0f, 0f);
    e.setVisible(true);
    e.setDead(false);
    e.pathIndex = 0;
    e.health = baseEnemyHealth;
    float scaleFactor = 1.0 + (level - 1) * 0.1f;
    e.setScale(scaleFactor);
    currentEnemyIndex++;
  }
}

public void followPath(EnemySprite e) {
  int index = e.pathIndex;
  float targetX = pathX + pathSize / 2f;
  float targetY = pathY + pathSize * 3 + pathSize / 2f;

  for (int i = 0; i < index; i++) {
    if (path[i] == 0) targetY += pathSize;
    else if (path[i] == 1) targetX -= pathSize;
    else if (path[i] == 2) targetX += pathSize;
  }

  float dx = targetX - (float)e.getX();
  float dy = targetY - (float)e.getY();
  float distVal = dist((float)e.getX(), (float)e.getY(), targetX, targetY);

  if (distVal < 10f) {
    e.pathIndex++;
    if (e.pathIndex > pathCount) {
      e.setVisible(false);
      e.setDead(true);
      nbr_dead++;
      playerHealth -= healthLossPerEnemy;
      return;
    }
  } else {
    float angle = atan2(dy, dx);
    e.setSpeed(100f, angle);
  }
}

public void mousePressed() {
  if (mouseX >= 3*width/4 - height/6 && mouseX <= 3*width/4 + height/6 &&
      mouseY >= height/4 - height/6 && mouseY <= height/4 + height/6) {
    points += 1 * addingMultiplier; 
  }

  if (mouseX >= 18*width/32 - upgrade1X/2 && mouseX <= 18*width/32 + upgrade1X/2 &&
      mouseY >= 3*height/32 - upgrade1Y/2 && mouseY <= 3*height/32 + upgrade1Y/2) {
    if (points >= costs[0]) {
      points -= costs[0];
      addingMultiplier += multipliers[0]; 
    }
  }


  if (mouseX >= 18*width/32 - upgrade2X/2 && mouseX <= 18*width/32 + upgrade2X/2 &&
      mouseY >= height/4 - upgrade2Y/2 && mouseY <= height/4 + upgrade2Y/2) {
    if (points >= costs[1]) {
      points -= costs[1];
      addingMultiplier += multipliers[1];
    }
  }


  if (mouseX >= 18*width/32 - upgrade3X/2 && mouseX <= 18*width/32 + upgrade3X/2 &&
      mouseY >= 13*height/32 - upgrade3Y/2 && mouseY <= 13*height/32 + upgrade3Y/2) {
    if (points >= costs[2]) {
      points -= costs[2];
      addingMultiplier += multipliers[2];
    }
  }
  if (mouseButton == LEFT) {
    if (dist(mouseX, mouseY, (float)shopUnit1.getX(), (float)shopUnit1.getY()) < pathSize / 2f && points >= unit1Cost) {
      heldUnit = new Sprite(this, "pork.png", 1);
      heldUnit.setVisible(true);
      points -= unit1Cost;
      attackCooldowns.put(heldUnit, unit1Cooldown);
      attackDamages.put(heldUnit, unit1Damage);
      unitRanges.put(heldUnit, unit1Range);
      unitRangeColors.put(heldUnit, "blue");
    } else if (dist(mouseX, mouseY, (float)shopUnit2.getX(), (float)shopUnit2.getY()) < pathSize / 2f && points >= unit2Cost) {
      heldUnit = new Sprite(this, "cow.png", 1);
      heldUnit.setVisible(true);
      points -= unit2Cost;
      attackCooldowns.put(heldUnit, unit2Cooldown);
      attackDamages.put(heldUnit, unit2Damage);
      unitRanges.put(heldUnit, unit2Range);
      unitRangeColors.put(heldUnit, "brown");
    } else if (dist(mouseX, mouseY, (float)shopUnit3.getX(), (float)shopUnit3.getY()) < pathSize / 2f && points >= unit3Cost) {
      heldUnit = new Sprite(this, "kfc.png", 1);
      heldUnit.setVisible(true);
      points -= unit3Cost;
      attackCooldowns.put(heldUnit, unit3Cooldown);
      attackDamages.put(heldUnit, unit3Damage);
      unitRanges.put(heldUnit, unit3Range);
      unitRangeColors.put(heldUnit, "orange");
    }
  } else if (mouseButton == RIGHT) {
    for (Sprite tower : placedUnits) {
      if (dist(mouseX, mouseY, (float)tower.getX(), (float)tower.getY()) < pathSize / 2f) {
        int damage = attackDamages.getOrDefault(tower, 1);
        int cost = upgradeCosts.getOrDefault(tower, 5);
        if (points >= cost && damage < 20) {
          attackDamages.put(tower, damage * 2);
          points -= cost;
          upgradeCosts.put(tower, cost * cost);
        }
        break;
      }
    }
  }
}

public void mouseReleased() {
  if (heldUnit != null) {
    Sprite placed = heldUnit;
    placed.setXY(mouseX, mouseY);
    placed.setVisible(true);
    placedUnits.add(placed);
    lastAttackTime.put(placed, 0);
    upgradeCosts.put(placed, 5);
    heldUnit = null;
  }
  if (mouseX >= 18*width/32 - width/24 && mouseX <= 18*width/32 + width/24 &&
      mouseY >= 47*height/64 - width/32 && mouseY <= 47*height/64 + height/32) {
    slotsTF = true;
    bjTF = false;
    resultText = " ";
  }
  else if (mouseX >= 18*width/32 - width/24 && mouseX <= 18*width/32 + width/24 &&
           mouseY >= 53*height/64 - width/32 && mouseY <= 53*height/64 + height/32) {
    bjTF = true;
    slotsTF = false;
    resultText = " ";
  }

  if (slotsTF == true) {
    if (mouseX >= 3*width/4 - width/8 && mouseX <= 3*width/4 + width/8 &&
        mouseY >= 17*height/18 - width/24 && mouseY <= 17*height/18 + height/24 &&
        gameStartSlots == true) {
      slotGif.play();
      slotGif.ignoreRepeat();
      randomSlotsNumbers();
      slotChecker();
    }
  }

  if (bjTF == true) {
    if (mouseX >= 3*width/4 - width/8 && mouseX <= 3*width/4 + width/8 &&
        mouseY >= 17*height/18 - width/24 && mouseY <= 17*height/18 + height/24 &&
        midGameBJ == true && gameStartBJ == true) {
      midGameBJ = false;
      standTF = false;
      blackjackNumbers();
    }

    if (mouseX >= 30*width/32 - width/24 && mouseX <= 30*width/32 + width/24 &&
        mouseY >= 47*height/64 - width/32 && mouseY <= 47*height/64 + height/32 &&
        gameStartBJ == true && midGameBJ == false) {
      blackjackHit();
    }

    if (mouseX >= 30*width/32 - width/24 && mouseX <= 30*width/32 + width/24 &&
        mouseY >= 53*height/64 - width/32 && mouseY <= 53*height/64 + height/32 &&
        gameStartBJ == true && midGameBJ == false) {
      standTF = true;
      blackjackHit();
    }
  }
}

public void pathSet() {
  pathCount = 0;
  pathX = random(pathSize + 20f, displayWidth / 2 - pathSize);
  pathY = 0;
  int move;
  float tempX = pathX;
  float tempY = pathY;

  for (int i = 0; i < 3; i++) {
    tempY += pathSize;
    fill(232, 220, 202);
    stroke(0);
    rect(tempX, tempY, pathSize, pathSize);
  }

  for (int i = 0; i < 10000; i++) {
    move = int(random(0, 6));
    if (move == 0 || move == 3 || move == 4) {
      tempY += pathSize;
      path[pathCount] = 0;
    } else if (move == 1) {
      tempX -= pathSize;
      path[pathCount] = 1;
    } else if (move == 2) {
      tempX += pathSize;
      path[pathCount] = 2;
    } else {
      continue;
    }

    if (tempX < pathSize + 20f || tempX > displayWidth / 2f - (pathSize - 5f) || tempY > displayHeight - (pathSize - 5f)) {
      break;
    }

    fill(232, 220, 202);
    stroke(0);
    rect(tempX, tempY, pathSize, pathSize);
    pathCount++;
  }
}

public void startNewLevel() {
  nbr_dead = 0;
  currentEnemyIndex = 0;
  lastSpawnTime = millis();
  numEnemy = int(random(5, 10 + level));
  pathGo = true;

  for (int i = 0; i < enemies.length; i++) {
    if (enemies[i] == null) {
      enemies[i] = new EnemySprite(this, "enemy.png", 1);
      enemies[i].setDomain(0, 0, displayWidth / 2f + pathSize - 5f, displayHeight + pathSize + 200f, Sprite.REBOUND);
    }
    enemies[i].setVisible(false);
    enemies[i].setDead(true);
  }
}
