class Hexagon { //<>//
  float centerX;
  float centerY;


  Hexagon(float x, float y) {
    centerX = x;
    centerY = y;
  }

  float distance(Hexagon h) {
    float xDist = centerX - h.centerX;
    float yDist = centerY - h.centerY;
    return sqrt(xDist*xDist + yDist*yDist);
  }

  void display() {
    beginShape();
    float angle = 0;
    for (int i = 0; i<6; i++) {
      vertex(centerX + radius*sin(angle), centerY + radius*cos(angle));
      angle += TWO_PI/6;
    }
    endShape(CLOSE);
  }

  void grow(ArrayList<Hexagon> hexes) {
    float angle = TWO_PI/12;
    float distance = 2*cos(TWO_PI/12)*radius;
    
    for (int i = 0; i<6; i++) {
      if(random(-1,10)<0) 
      hexes.add(new Hexagon(centerX + distance*sin(angle), centerY + distance*cos(angle)));
      angle += TWO_PI/6;
    }
  }
}