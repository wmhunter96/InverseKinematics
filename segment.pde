class Segment {
  PVector a;
  float angle = 0;
  float len;
  PVector b = new PVector();
  Segment parent = null;
  Segment child = null;

  Segment(float x, float y, float len_, float angle_) {
    a = new PVector(x, y);
    len = len_;
    angle = angle_;
    calculateB();
  }
  
  Segment(Segment parent_, float len_, float angle_) {
    parent = parent_;
    a = parent.b.copy();
    len = len_;
    calculateB();
  }

  void setA(PVector pos) {
    a = pos.copy();
    calculateB();
  }

  void calculateB() {
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    b.set(a.x+dx, a.y+dy);
  }

  void update() {
    calculateB();
  }

  void show() {
    stroke(255, 0, 0);
    strokeWeight(4);
    line(a.x, a.y, b.x, b.y);
  }
  void follow() {
    float targetX = child.a.x;
    float targetY = child.a.y;
    follow(targetX, targetY);
  }
  void follow(float tx, float ty) {
    PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target, a);
    angle = dir.heading();
    dir.setMag(len);
    dir.mult(-1);
    a = PVector.add(target, dir);
  }
}
