class Paddle {
  int pLength;
  int pWidth;
  int centerX;
  int centerY;
  int speed;
  
  // Constructor
  Paddle (int pl, int pw, int pcx, int pcy, int s) {
    pLength = pl;
    pWidth = pw;
    centerX = pcx;
    centerY = pcy;
    speed = s;
  }
  
  // Draw Paddle
  void drawPaddle () {
    int upperLeftX = centerX - pWidth/2;
    int upperLeftY = centerY - pLength/2;
    rect (upperLeftX, upperLeftY, pWidth, pLength);
  }
  
  // Move paddle up
  void moveUp () {
    if (centerY-speed >= pLength/2) {
      centerY -= speed;
    }
    else {
      centerY = pLength/2;
    }
  }
  
  // Move paddle down
  void moveDown () {
    if (centerY+speed <= height - pLength/2) {
      centerY += speed;
    }
    else {
      centerY = height - pLength/2 - 1;
    }
  }
}
