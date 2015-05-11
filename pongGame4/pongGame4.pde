Ball ball;
Paddle leftPaddle;
Paddle rightPaddle;

boolean keyE;
boolean keyUp;
boolean keyD;
boolean keyDown;

// Initial Setup that is run once at the beginning
void setup() {
  size(640, 360);
  int diameter = 55;
  int centerX = width/2;
  int centerY = height/2;
  int xSpeed = 5;
  int ySpeed = 5;
  int maxYSpeed = 10;
  
  ball = new Ball (diameter, centerX, centerY, xSpeed, ySpeed, maxYSpeed);
  
  int pLength = height/2;
  int pWidth = diameter/3;
  int pCenterX = pWidth/2;
  int pCenterY = height/2;
  int pSpeed = 5;
  leftPaddle = new Paddle (pLength, pWidth, pCenterX, pCenterY, pSpeed);
  pCenterX = width - pWidth/2;
  rightPaddle = new Paddle (pLength, pWidth, pCenterX, pCenterY, pSpeed);
  
}

// The main loop that will be run 
void draw() {
  background(209);
  ball.action(leftPaddle, rightPaddle);
  leftPaddle.drawPaddle();
  rightPaddle.drawPaddle();
  checkKeyInput();

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
}

