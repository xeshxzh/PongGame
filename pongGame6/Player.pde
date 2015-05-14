class Player {
  Ball ball;
  Paddle paddle;
  
  Player (Ball b, Paddle p) {
    ball = b;
    paddle = p;
  }
  
  // Move paddle based on the current prediction
  void play() {
    if (isBallComing()) {
      if (yLandingPoint()>paddle.centerY) {
        paddle.moveDown();
      }
      else {
        paddle.moveUp();
      }
    }
  }
  
  // Determine if the ball is coming towards the paddle
  boolean isBallComing() {
    return ball.xSpeed < 0;
  }
  
  // Predict the y value when it hits the paddle
  int yLandingPoint () {
    int yLandingPoint = ball.centerY - ball.centerX* ball.ySpeed/ball.xSpeed;
    return yLandingPoint;
  }  
}
