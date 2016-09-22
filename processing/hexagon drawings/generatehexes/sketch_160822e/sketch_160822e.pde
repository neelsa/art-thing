ArrayList<Hexagon> hexagons = new ArrayList<Hexagon>();
int radius = 35;

void setup() {
  size(1000,1000);
  frameRate(1);
  int startX = int(random(width));
  int startY = int(random(height));
  hexagons.add(new Hexagon(startX,startY));

}


void addHex(Hexagon h) {
  for(Hexagon hexagon : hexagons) {
    if( hexagon.distance(h) < radius)
     return;
  }
  hexagons.add(h);
}
int counter = 0;
void draw() {
  counter++;
  fill(0,100*counter,200);
  ArrayList<Hexagon> newHexes = new ArrayList();
  
  for(Hexagon hexagon : hexagons) {
    hexagon.display();
     hexagon.grow(newHexes);
  }
  
  for(Hexagon hex : newHexes) {
    addHex(hex);
  }
}