import java.util.Map;
import java.util.Set;
import java.util.Iterator;

Hexagon[][] hexagon;   

int radius = 30;
int hexCountX, hexCountY;
int startX, startY;
HashMap<Integer, Hexagon> hexes = new HashMap<Integer, Hexagon>();

void setup() {
  size (500, 500);

  //find a place to start
  startX = int(random(width));
  startY = int(random(height));
  println(startX);
  println(startY);

  Point p = new Point(startX, startY);
  //add first hex
  hexes.put(p.hash(), new Hexagon(p, radius));
}

void draw() {
  //draw hexes

  for (Hexagon hex : hexes.values()) {
    hex.display();
  }

  //add to edges
  grow();
}

void grow() {
  //for each hex
  for (Hexagon hex : hexes.values()) {
    //iterate through edges
 
  }

  //figure out which edges are borders
  //maybe add a new hex there
}


void prune() {
}