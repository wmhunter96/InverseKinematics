float cart2cpux(float val) {
  val = val + (width/2);
  return val;
}

float cart2cpuy(float val) {
  val = (height/2) - val;
  return val;
}

float cpu2cartx(float val) {
  val = val - (width/2);
  return val;
}

float cpu2carty(float val) {
  val = (height/2) - val;
  return val;
}

float thetagen(float x, float y) {
  float val = degrees(atan2(y, x));
  return val;
}

float pol2cartx(float r, float theta) {
  float x = r * cos(radians(theta));
  return x;
}

float pol2carty(float r, float theta) {
  float y = r * sin(radians(theta));
  return y;
}

void drawgrid() {
  int videoScale = 20;
  int cols, rows;
  cols = width/videoScale;
  rows = height/videoScale;

  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, videoScale, videoScale);
    }
  }
}
