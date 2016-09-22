class Point {
 final int x;
 final int y;
 
 Point(int a, int b) {
   x = a;
   y = b;
 }
 
 int hash() {
   return x * height + y;
 }
}