class Hexagon {  //<>//
  float centerX;
  float centerY;
  float centerDistance = 2*cos(TWO_PI/12)*radius;

  Hexagon(float x, float y) {
    centerX = x;
    centerY = y;
  }

  float distance(Hexagon h) {
    return distance(h.centerX, h.centerY);
  }

  float distance(float x, float y) {
    float xDist = centerX - x;
    float yDist = centerY - y;
    return sqrt(xDist*xDist + yDist*yDist);
  }

  void display() {
    noStroke();
    beginShape();
    float angle = 0;
    for (int i = 0; i<6; i++) {
      vertex(centerX + radius*sin(angle), centerY + radius*cos(angle));
      angle += TWO_PI/6;
    }
    endShape(CLOSE);
  }

  void drawEdges() {
    float angle = TWO_PI/12;
    for (int i = 0; i <6; i ++) {
      if (!hasNeighbor(angle)) {
        drawEdge(angle);
      }
      angle += TWO_PI/6;
    }
  }

  void drawEdge(float angle) {
    float x1 = centerX + radius * sin(angle + TWO_PI/12);
    float y1 = centerY + radius * cos(angle + TWO_PI/12);
    float x2 = centerX + radius * sin(angle - TWO_PI/12);
    float y2 = centerY + radius * cos(angle - TWO_PI/12);
    line(x1, y1, x2, y2);
  }

  void grow(ArrayList<Hexagon> hexes) {
    float angle = TWO_PI/12;

    for (int i = 0; i<6; i++) {
      if (random(-1, pow(3, neighbors().size())) < 0) 
        hexes.add(new Hexagon(centerX + centerDistance*sin(angle), centerY + centerDistance*cos(angle)));
      angle += TWO_PI/6;
    }
  }

  boolean hasNeighbor(float angle) {
    for (Hexagon hex : hexagons) {
      float x = centerX + centerDistance*sin(angle);
      float y = centerY + centerDistance*cos(angle);
      if (hex.distance(x, y) < radius/2) 
      return true;
    }
    return false;
  }

  ArrayList<Hexagon> neighbors() {
    ArrayList<Hexagon> neighbors = new ArrayList();
    for (Hexagon hex : hexagons) {
      if (distance(hex) < centerDistance*1.5)
      neighbors.add(hex);
    }
    return neighbors;
  }
}