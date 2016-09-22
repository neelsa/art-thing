float xLoc = 500;
float yLoc = 500;
Point nextPoint = new Point(500, 500);
float nextAngle = 0;
Triangle next = new Triangle(new Point(500, 500), 0);
Triangle current;

ArrayList<Triangle> triangles = new ArrayList<Triangle>();

void setup() {
  size(1000, 1000);
  frameRate(10);
}

void draw() {
  //Triangle t = new Triangle(nextPoint, nextAngle);
  current = next;
  triangles.add(current);
  current.drawTriangleLines();

  while (hasTriangle(next.center)) {
    next = current.generateNext();
  }
}

boolean hasTriangle(Point p) {
  for (Triangle tri : triangles) {
    if (tri.center.distance(p) < 1.5* outerRadius * cos(TWO_PI/6))
      return true;
  }
  return false;
}

void drawTriangle(Triangle t) {
  t.drawSimple();
}

void drawTriangleLines(Triangle t) {
 t.drawTriangleLines(); 
}

//mostly just for debugging geometries
Point drawLine(Point p, float angle, float l) { //angle in radians
  float newX = p.x + l * sin(angle);
  float newY = p.y + l * cos(angle);
  line(p.x, p.y, p.x + l * sin(angle), p.y + l * cos(angle));
  return new Point(newX, newY);
}