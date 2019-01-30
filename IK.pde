float r1 = 100;
int cenx = width/2;
int ceny = height/2;
Segment seg;

void setup() {
  size(600, 600);
  Segment current= new Segment(cenx, ceny, r1, 0);

  for (int i = 0; i < 5; i++) {
    Segment next = new Segment(current, r1, i);
    current.child = next;
    current = next;
  }
  seg = current;
}

void draw() {
  //void setup() {   //
  //  size(600, 600);  //
  background(255);

  float x = 100;
  float y = 0;

  strokeWeight(1);
  drawgrid();

  /*
  //point
   strokeWeight(10);
   point(cenx, ceny);
   //arm1
   strokeWeight(4);
   
   stroke(204, 102, 0);
   line(cenx, ceny, cart2cpux(pol2cartx(r1, thetagen(x, y))), cart2cpuy(pol2carty(r1, thetagen(x, y))));
   strokeWeight(10);
   
   point(cart2cpux(pol2cartx(r1, thetagen(x, y))), cart2cpuy(pol2carty(r1, thetagen(x, y))));
   
   strokeWeight(4);
   stroke(4, 102, 0);
   line(cenx, ceny, cart2cpux(x), cart2cpuy(y));
   strokeWeight(10);
   
   point(cart2cpux(x), cart2cpuy(y));
   
   strokeWeight(4);
   line(cenx, ceny, cart2cpux(pol2cartx(r1, thetagen(cpu2cartx(mouseX), cpu2carty(mouseY)))), cart2cpuy(pol2carty(r1, thetagen(cpu2cartx(mouseX), cpu2carty(mouseY)))));
   strokeWeight(10);
   
   point(cart2cpux(pol2cartx(r1, thetagen(cpu2cartx(mouseX), cpu2carty(mouseY)))), cart2cpuy(pol2carty(r1, thetagen(cpu2cartx(mouseX), cpu2carty(mouseY)))));
   
   strokeWeight(4);
   */

  seg.follow(mouseX, mouseY);
  seg.update();
  seg.show();
  Segment next = seg.parent;
  while (next != null) {
    next.follow();
    next.update();
    next.show();
    next = next.parent;
  }

  //println(cpu2carty(mouseY));
  //print(thetagen(x, y));
  //print(pol2cartx(r1, thetagen(x, y)));
}
