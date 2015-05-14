int diameter = 55;
int centerX = diameter/2;
int centerY = diameter/2;
int xSpeed = 5;
int ySpeed = 5;
int paddleLength = height;
int maxYSpeed = 10;

// Initial Setup that is run once at the beginning
void setup() {
  size(640, 360);
  centerY = height/2;
}

// The main loop that will be run 
void draw() {
  background(209);
  adjustMovingDirection();
  moveBall();
  ellipse(centerX, centerY, diameter, diameter);
}

// Determine whether the ball needs to change direction before moving the ball
void adjustMovingDirection() {
  if (isTouchingVerticalWall()) {
    bouncePaddle();
  }
  if (isTouchingHorizontalWall()){
    bounceHorizontalWall();
  }
}

// Determines whether the ball is touching left and right walls of the canvas
boolean isTouchingVerticalWall() {
  boolean isTouchingLeft = centerX < diameter/2;
  boolean isTouchingRight = centerX > (width - diameter/2);
  return isTouchingLeft || isTouchingRight;
}

// Determines whether the ball is touching top and bottom walls of the canvas
boolean isTouchingHorizontalWall() {
  boolean isTouchingTop = centerY < diameter/2;
  boolean isTouchingBottom = centerY > (height - diameter/2);
  return isTouchingTop || isTouchingBottom;
}

// Change the direction of the ball based on the position it hits the paddle
void bouncePaddle () {
  int offsetFromMiddle = abs(centerY - height/2);
  int currentDirection;
  if (ySpeed==0) {
    if (offsetFromMiddle == 0) {
      currentDirection = 0;
    }
    else {
     currentDirection = -offsetFromMiddle/abs(offsetFromMiddle);
   }
  }
  else {
    currentDirection = ySpeed / abs(ySpeed);
  }
  int nextAbsoluteSpeed = maxYSpeed * offsetFromMiddle/ ( height/2 );
  
  ySpeed = currentDirection * nextAbsoluteSpeed;
  xSpeed = -xSpeed;
}

// Change the x speed of the ball to bounce on vertical wall
void bounceVerticalWall() {
  xSpeed = -xSpeed;
}
// Change the y speed of the ball to bounce on horizontal wall
void bounceHorizontalWall() {
  ySpeed = -ySpeed;
}

// Move the ball by the current speed
void moveBall() {
  centerX = centerX + xSpeed;
  centerY = centerY + ySpeed;
}

