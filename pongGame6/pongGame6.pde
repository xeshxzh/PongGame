Ball ball;
Paddle leftPaddle;
Paddle rightPaddle;
Player player;

boolean keyE;
boolean keyUp;
boolean keyD;
boolean keyDown;
boolean keySpace;

// Initial Setup that is run once at the beginning
void setup() {
  size(640, 360);
  frameRate(120);
  int diameter = 55;
  int centerX = width/2;
  int centerY = height/2;
  int xSpeed = 2;
  int ySpeed = 2;
  int maxYSpeed = 3;
  int maxScore = 5;
  ball = new Ball (diameter, centerX, centerY, xSpeed, ySpeed, maxYSpeed, maxScore);
  
  int pLength = height/2;
  int pWidth = diameter/3;
  int pCenterX = pWidth/2;
  int pCenterY = height/2;
  int pSpeed = 5;
  leftPaddle = new Paddle (pLength, pWidth, pCenterX, pCenterY, pSpeed);
  pCenterX = width - pWidth/2;
  rightPaddle = new Paddle (pLength, pWidth, pCenterX, pCenterY, pSpeed);
  
  player = new Player(ball, leftPaddle);  
}

// The main loop that will be run 
void draw() {
  background(209);
  showScore();
  leftPaddle.drawPaddle();
  rightPaddle.drawPaddle();
  checkKeyInput();
  if (ball.gameOver()) {
    ball.drawBall();
    showGameOver();
    if (keySpace) {
      ball.resetScore();
    }
  }
  else {
    ball.action(leftPaddle, rightPaddle);
    player.play();
  }
}

// Show Game Over Message
void showGameOver() {
  text("Game Over!", width/2, height/2);
  text("Press space to restart...", width/2, height * 2/3);
}

// Show the current score
void showScore() {
  textAlign(CENTER, BOTTOM);
  textSize(height/10);
  text(ball.leftScore + " : " + ball.rightScore, width/2, height/5);
} 

// Check any meaningful key input
void checkKeyInput () {
  if (keyE) {    
    leftPaddle.moveUp();
  }
  if (keyD) {    
    leftPaddle.moveDown();
  }
  if (keyUp) {
    rightPaddle.moveUp();
  }
  if (keyDown) {    
    rightPaddle.moveDown();
  }
}

// Set boolean variables to true based on key input
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      keyUp = true;
    } else if (keyCode == DOWN) {
      keyDown = true;
    } 
  }
  if (key == 'e' || key == 'E') {
      keyE = true;
  }
  if (key == 'd' || key == 'D') {
      keyD = true;
  }
  if (key == ' ') {
    keySpace = true;
  }
}

// Reset boolean variables to false based on key input
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      keyUp = false;
    } else if (keyCode == DOWN) {
      keyDown = false;
    } 
  }
  if (key == 'e' || key == 'E') {
      keyE = false;
  }
  if (key == 'd' || key == 'D') {
      keyD = false;
  }    
  if (key == ' ') {
    keySpace = false;
  }
}

