int diameter = 55;
int centerX = diameter/2;
int centerY = diameter/2;
int speed = 5;

void setup() {
  size(640, 360);
  centerY = height/2;
}

void draw() {
  background(209);
  if (isTouchingEdge()) {
    bounce();
    moveBall();
  }
  else {
    moveBall();
  }
  ellipse(centerX, centerY, diameter, diameter);
}

boolean isTouchingEdge() {
  return centerX > (width - diameter/2) || (centerX < diameter/2);
}

void bounce() {
  speed = -speed;
}

void moveBall() {
  centerX = centerX + speed;
}

