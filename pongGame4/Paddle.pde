class Paddle {
  int pLength;
  int pWidth;
  int pCenterX;
  int pCenterY;
  int pSpeed;
  
  // Constructor
  Paddle (int pl, int pw, int pcx, int pcy, int s) {
    pLength = pl;
    pWidth = pw;
    pCenterX = pcx;
    pCenterY = pcy;
    pSpeed = s;
  }
  
  // Draw Paddle
  void drawPaddle () {
    int upperLeftX = pCenterX - pWidth/2;
    int upperLeftY = pCenterY - pLength/2;
    rect (upperLeftX, upperLeftY, pWidth, pLength);
  }
  
  // Move paddle up
  void moveUp () {
    if (pCenterY-pSpeed >= pLength/2) {
      pCenterY -= pSpeed;
    }
    else {
      pCenterY = pLength/2;
    }
  }
  
  // Move paddle down
  void moveDown () {
    if (pCenterY+pSpeed <= height - pLength/2) {
      pCenterY += pSpeed;
    }
    else {
      pCenterY = height - pLength/2 - 1;
    }
  }
}
