class Point {
  final float x;
  final float y;

  Point(float a, float b) {
    x = a;
    y = b;
  }


  float distance(Point a) {
    return sqrt((a.x - x) * (a.x - x) + (a.y - y) * (a.y - y));
  }
}