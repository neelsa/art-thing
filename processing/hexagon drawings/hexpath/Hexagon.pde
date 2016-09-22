class Hexagon {
  float x, y, radi;
  int angle = 60;
  Hexagon[] neighbors;
  boolean shouldDraw = false;

  Hexagon(float cx, float cy, float r)
  {
    x=cx;
    y=cy;
    radi=r;
    neighbors = new Hexagon[7];
  }

  void setNeighbor(int i, Hexagon h) {
    neighbors[i] = h;
  }

  void flip() {
    shouldDraw = true;
  }

  void display() {
    if (shouldDraw) {
      noStroke();
      beginShape();

      for (int i = 0; i < 6; i++)
      {
        vertex(x + radi * cos(radians(angle * i)), 
          y + radi * sin(radians(angle * i)));
      }

      fill(0, 1500, 200);

      endShape(CLOSE);
    }
  }
}