class Ball {
  int diameter;
  int centerX;
  int centerY;
  int xSpeed;
  int ySpeed;
  int maxYSpeed;
  
  // Constructor
  Ball (int d, int cx, int cy, int xs, int ys, int mys) {
    diameter = d;    
    centerX = cx;
    centerY = cy;
    xSpeed = xs;
    ySpeed = ys;
    maxYSpeed = mys;
  }
  
  // Main function of the ball
  void action() {
    adjustMovingDirection();
    moveBall();
    drawBall();
  }
  
  // Draw the ball
  void drawBall () {
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
    int currentDirection = (ySpeed==0)? 0 : ySpeed / abs(ySpeed);
    int nextDirection = -currentDirection;
    int nextAbsoluteSpeed = maxYSpeed * offsetFromMiddle/ ( height/2 );
    
    ySpeed = nextDirection * nextAbsoluteSpeed;
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
}


