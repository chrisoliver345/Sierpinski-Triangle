int depth = 0;
void setup() {
  size(800, 600);
}
void draw() {
  background(255);
  fill(0);
  makeFractal(new PVector(0, height), new PVector(width, height), new PVector(width/2, 0), depth, 0); 
}
void mousePressed() {depth++;}
void keyPressed() {if (depth != 0) {depth--;}}

void makeFractal(PVector lowerLeft, PVector lowerRight, PVector topCenter, int maxDepth, int curDepth) {
  if(curDepth < maxDepth) {
    PVector middleLeft = new PVector(lowerLeft.x + (topCenter.x - lowerLeft.x) / 2, lowerLeft.y + (topCenter.y - lowerLeft.y) / 2);
    PVector middleRight = new PVector(lowerRight.x + (topCenter.x - lowerRight.x) / 2, lowerRight.y + (topCenter.y - lowerRight.y) / 2);
    PVector bottomCenter = new PVector(lowerLeft.x + (lowerRight.x - lowerLeft.x) / 2, lowerLeft.y);
    int newDepth = curDepth + 1;
    makeFractal(middleLeft,   middleRight,  topCenter,   maxDepth, newDepth);
    makeFractal(lowerLeft,    bottomCenter, middleLeft,  maxDepth, newDepth);
    makeFractal(bottomCenter, lowerRight,   middleRight, maxDepth, newDepth);
  } else {
    triangle(lowerLeft.x, lowerLeft.y, lowerRight.x, lowerRight.y, topCenter.x, topCenter.y);
  }
}
