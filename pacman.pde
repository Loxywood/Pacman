Game game;
Board board;
PVector test = new PVector(0,0); //à virer.

void setup() {
  background(0);
  size(1150,1100, P2D);
  game = new Game();
  board = new Board(test,23,22,CELL_SIZE);
  board.drawIt();
}

void draw() {
  game.update();
  game.drawIt();
}

void keyPressed() {
  game.handleKey(key);
}

void mousePressed() {
}
