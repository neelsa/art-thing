import processing.pdf.*;

Hexagon[][] hexagon;       

int rad = 30;
int hexcountx, hexcounty;

void setup()
{
  //randomSeed(0);
  size(1200, 800, PDF, "hexes.pdf");

  smooth();
  frameRate(50);
   hexcountx = (height/(rad));
  hexcounty = (width/(rad)*2);
  hexagon = new Hexagon [hexcountx][hexcounty];
  for (int i = 0; i < hexcountx; i++) {
      for (int j = 0; j < hexcounty; j++) {
         float r = random(-1,1);
         if ((j % 2) == 0) {
          hexagon[i][j] = new Hexagon(
          (3 * rad * i), (.866 * rad * j), rad, r > 0);
         } else {
          hexagon[i][j] = new Hexagon(
          3 * rad * (i + .5), .866 * rad * j, rad, r > 0);
          }
        }
      }
      
}

void draw(){
  for (int i = 0; i < hexcountx; i ++ ) {     
    for (int j = 0; j < hexcounty; j ++ ) {
      hexagon[i][j].display();
    }
  } 
  exit();
}

class Hexagon{
float x,y,radi;
float angle = 360.0 / 6;
boolean shaded = true;
   
Hexagon(float cx, float cy, float r, boolean b)
{
  x=cx;
  y=cy;
  radi=r;
  shaded = b;
}

void display(){
   noStroke();
  beginShape();
 
  for (int i = 0; i < 6; i++)
  {
    vertex(x + radi * cos(radians(angle * i)),
      y + radi * sin(radians(angle * i)));
  }
 
  if(shaded) {
    fill(0,1500,200);
  } else {
    fill(0);
  }

  endShape(CLOSE);
}
}