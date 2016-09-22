import processing.pdf.*;

ArrayList<Hexagon> hexagons = new ArrayList<Hexagon>();
int radius = 35;
int generations = 150;


void setup() {
  size(1600, 800); //a little over 22"x11" - should fit in a 24"x12" piece
  beginRecord(PDF, "hex.pdf"); 
  frameRate(24);
  int startX = int(random(width));
  int startY = int(random(height));
  hexagons.add(new Hexagon(startX, startY));
}


void addHex(Hexagon h) {
  for (Hexagon hexagon : hexagons) {
    // no duplicates
    if ( hexagon.distance(h) < radius)
      return;
  }
  hexagons.add(h);
}
int counter = 0;
void draw() {
  if (counter < generations) {
    background(255);
    counter++;
    fill(0, 100*counter, 200);
    ArrayList<Hexagon> newHexes = new ArrayList();

    for (Hexagon hexagon : hexagons) {
      //hexagon.display();
      hexagon.drawEdges();
      hexagon.grow(newHexes);
    }

    for (Hexagon hex : newHexes) {
      addHex(hex);
    }
  } else {
    endRecord();
    exit();
  }
}