int outerRadius = 50; //triangle radius
int innerRadius = outerRadius/7*5; 

class Triangle {
  Point center;
  float angle;

  Triangle(Point p, float a) {
    center = p;
    angle = a;
  }

  void drawSimple() {

    Point a = new Point(center.x + innerRadius*sin(angle), center.y + innerRadius*cos(angle));
    Point b = new Point(center.x + innerRadius*sin(angle + TWO_PI/3), center.y + innerRadius*cos(angle + TWO_PI/3));
    Point c = new Point(center.x + innerRadius*sin(angle - TWO_PI/3), center.y + innerRadius*cos(angle - TWO_PI/3));

    triangle(a.x, a.y, b.x, b.y, c.x, c.y);
  }

  void drawTriangleLines() {  
    float s = 2 * innerRadius * sin(TWO_PI/6) / 5; //step = triangle side length/5
    Point a = new Point(center.x + innerRadius*sin(angle), center.y + innerRadius*cos(angle));
    Point b = new Point(center.x + innerRadius*sin(angle + TWO_PI/3), center.y + innerRadius*cos(angle + TWO_PI/3));
    Point c = new Point(center.x + innerRadius*sin(angle - TWO_PI/3), center.y + innerRadius*cos(angle - TWO_PI/3));

    //angles
    float cToA = angle + PI/6;
    float aToB = cToA + TWO_PI/3;
    float bToC = aToB + TWO_PI/3;

    /* code to check my angle math :p
     line(a.x, a.y, b.x, b.y);
     line(a.x, a.y, a.x  + s*5 *sin(aToB), a.y + s*5*cos(aToB));
     
     line(b.x, b.y, c.x, c.y);
     line(b.x, b.y, b.x  + s*5 *sin(bToC), b.y + s*5*cos(bToC));
     
     line(c.x, c.y, a.x, a.y);
     line(c.x, c.y, c.x  + s*5 *sin(cToA), c.y + s*5*cos(cToA));*/

    quad(
      a.x, a.y, 
      b.x, b.y, 
      b.x + s * sin(bToC), b.y + s * cos(bToC), 
      a.x - s * sin(cToA), a.y - s * cos(cToA)
      );
    quad(
     a.x - 2 * s * sin(cToA), a.y - 2 * s * cos(cToA), 
     b.x + 2 * s * sin(bToC), b.y + 2 * s * cos(bToC), 
     b.x + 3 * s * sin(bToC), b.y + 3 * s * cos(bToC), 
     a.x - 3* s * sin(cToA), a.y - 3 * s * cos(cToA)
     );
     
     triangle( 
     a.x - 4 * s * sin(cToA), a.y - 4 * s * cos(cToA), 
     b.x + 4 * s * sin(bToC), b.y + 4 * s * cos(bToC), 
     c.x, c.y
     );
  }

  Point fore() {
    float d = outerRadius* cos(TWO_PI/6);
    float newAngle = angle - TWO_PI/6;
    return new Point(center.x + 2* d * sin(newAngle), center.y + 2 * d * cos(newAngle));
  }

  Point aft() {
    float d = outerRadius* cos(TWO_PI/6);
    float newAngle = angle - TWO_PI/6 - TWO_PI/3;
    return new Point(center.x + 2* d * sin(newAngle), center.y + 2 * d * cos(newAngle));
  }

  Triangle generateNext() {
    Point nextP;
    float nextAngle;

    if (random(0, 1) > 0.5) {
      nextP = aft();
    } else {
      nextP = fore();
    }

    if (random(0, 1) > 0.5) {
      nextAngle = angle + PI/3;
    } else {
      nextAngle = angle + PI;
    }

    return new Triangle(nextP, nextAngle);
  }
}