class Ball {
  int diameter;
  int centerX;
  int centerY;
  int xSpeed;
  int ySpeed;
  int maxYSpeed;
  int leftScore;
  int rightScore;
  int maxScore;
  
  // Constructor
  Ball (int d, int cx, int cy, int xs, int ys, int mys, int ms) {
    diameter = d;    
    centerX = cx;
    centerY = cy;
    xSpeed = xs;
    ySpeed = ys;
    maxYSpeed = mys;
    maxScore = ms;
    resetScore();
  }
  
  // Reset scores
  void resetScore() {
    leftScore = 0;
    rightScore = 0;
  }
  
  boolean gameOver() {
    return leftScore >= maxScore || rightScore >= maxScore;
  }
  // Main function of the ball
  void action(Paddle lp, Paddle rp) {
    adjustMovingDirection(lp,rp);
    moveBall();
    drawBall();
  }
  
  // Draw the ball
  void drawBall () {
    ellipse(centerX, centerY, diameter, diameter);
  }
  
  // Determine whether the ball needs to change direction before moving the ball
  void adjustMovingDirection(Paddle lp, Paddle rp) {
    if (isTouchingLeftPaddle(lp)) {
      bouncePaddleY(lp);
      if (xSpeed <0) {
        xSpeed = -xSpeed;
      }
    }
    else if (isTouchingRightPaddle(rp)) {
      bouncePaddleY(rp);
      if (xSpeed > 0) {
        xSpeed = -xSpeed;
      }
    }
    else if (isTouchingVerticalWall()) {
      bounceVerticalWall();
    }
    else if (isTouchingHorizontalWall()){
      bounceHorizontalWall();
    }
  }
  
  boolean isTouchingLeftPaddle (Paddle lp) {
    boolean isTouchingLeft = (centerX < lp.pWidth + diameter/2 && 
                              centerY < lp.centerY+lp.pLength/2 && 
                              centerY > lp.centerY-lp.pLength/2);
    return isTouchingLeft;
  }
  
  boolean isTouchingRightPaddle (Paddle rp) {
    boolean isTouchingRight = (centerX > width - rp.pWidth - diameter/2 && 
                              centerY < rp.centerY+rp.pLength/2 && 
                              centerY > rp.centerY-rp.pLength/2);
    return isTouchingRight;
  }
  // Determines whether the ball is touching left and right walls of the canvas
  boolean isTouchingVerticalWall() {
    boolean isTouchingLeft = centerX < diameter/2;
    boolean isTouchingRight = centerX > (width - diameter/2);
    
    // Update the score
    if(isTouchingLeft) {
      rightScore += 1;
    }
    if(isTouchingRight) {
      leftScore += 1;
    }
    
    return isTouchingLeft || isTouchingRight;
  }
  
  // Determines whether the ball is touching top and bottom walls of the canvas
  boolean isTouchingHorizontalWall() {
    boolean isTouchingTop = centerY < diameter/2;
    boolean isTouchingBottom = centerY > (height - diameter/2);
    return isTouchingTop || isTouchingBottom;
  }
  
  // Change the direction of the ball based on the position it hits the paddle
  void bouncePaddleY (Paddle p) {
    int offsetFromMiddle = p.centerY - centerY;
    int currentDirection;
    if (ySpeed==0){
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
    int nextAbsoluteSpeed = maxYSpeed * abs(offsetFromMiddle)/ ( p.pLength/2 );
    
    ySpeed = currentDirection * nextAbsoluteSpeed;
  }
  
  // Change the x speed of the ball to bounce on vertical wall
  void bounceVerticalWall() {
    xSpeed = -xSpeed;
  }
  // Change the y speed of the ball to bounce on horizontal wall
  void bounceHorizontalWall() {
    ySpeed = -ySpeed;
    centerY += ySpeed;
  }
  
  // Move the ball by the current speed
  void moveBall() {
    centerX = centerX + xSpeed;
    centerY = centerY + ySpeed;
  }
}


