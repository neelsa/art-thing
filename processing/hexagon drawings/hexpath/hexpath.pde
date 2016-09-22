
Hexagon[][] hexagon;   

int radius = 30;
int hexCountX, hexCountY;
int startX, startY;

void setup() {
  size (1000,1000);

  smooth();
  frameRate(10);
  hexCountX = (height/(radius));
  println(height);
  println(hexCountX);
  hexCountY = (width/(radius)*2);
  hexagon = new Hexagon [hexCountX][hexCountY];
  createHexGrid();
  
  for(int i = 0; i < 1; i++) {
  startX = int(random(hexCountX)); //<>//
  println(startX);
  startY = int(random(hexCountY));
  
  if(startX > 0 && startY > 0 && startX < hexCountX && startY < hexCountY) {
  hexagon[startX][startY].flip();
  }
  }
  
}

void createHexGrid() { 
  for (int i = 0; i < hexCountX; i++) {
    for (int j = 0; j < hexCountY; j++) {
      createHexagon(i, j);
    }
  }
}

void createHexagon(int x, int y) { 
  float xPos, yPos;
  if ((y % 2) == 0) {
    xPos = 3 * radius * x;
    yPos = .866 * radius * y;
  } else {
    xPos = 3 * radius * (x + .5);
    yPos = .866 * radius * y;
  }
  hexagon[x][y] = new Hexagon(xPos, yPos, radius);
  setNeighbors(hexagon[x][y], x, y);
}

void setNeighbors(Hexagon h, int x, int y) {
  if (y % 2 == 0) {
    setNeighbor(h, 1, x, y-1);
    setNeighbor(h, 2, x+1, y);
    setNeighbor(h, 3, x, y+1);
    setNeighbor(h, 4, x-1, y+1);
    setNeighbor(h, 5, x-1, y);
    setNeighbor(h, 6, x-1, y-1);
  } else {
    setNeighbor(h, 1, x+1, y-1);
    setNeighbor(h, 2, x+1, y);
    setNeighbor(h, 3, x+1, y+1);
    setNeighbor(h, 4, x, y+1);
    setNeighbor(h, 5, x-1, y);
    setNeighbor(h, 6, x, y-1);
  }
}

void setNeighbor(Hexagon h, int index, int x, int y) {
  if (x >= 0 && y >= 0 && x < hexCountX && y < hexCountY) 
    h.setNeighbor(index, hexagon[x][y]);
}

void draw() {
  for (int i = 0; i < hexCountX; i++) {
    for (int j = 0; j < hexCountY; j++) {
        hexagon[i][j].display();
    }
  }
}