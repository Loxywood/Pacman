class Game 
{
  Board _board;
  Hero _hero;
  
  String _levelName;
  
  Game() {
    _board = new Board(new PVector(0,0),23,22);
    _hero = new Hero();
  }
  
  void update() {
    _hero.move(_board);
  }
  
  //
  void drawIt() {
    _board.drawIt();
    _hero.drawIt();
  }

  //Cette fonction s'occupe de gérer les entrées clavier pour les déplacmeent.
  void handleKey(int k) {
    switch (k) {
      case UP :
        _hero.launchMove(new PVector(0,-1));
        break;
      case 'z' :
        _hero.launchMove(new PVector(0,-1));
        break;
      case DOWN :
        _hero.launchMove(new PVector(0,1));
        break;
      case 's' :
        _hero.launchMove(new PVector(0,1));
        break;
      case LEFT :
        _hero.launchMove(new PVector(-1,0));
        break;
      case 'q' :
        _hero.launchMove(new PVector(-1,0));
        break;
      case RIGHT :
        _hero.launchMove(new PVector(1,0));
        break;
      case 'd' :
        _hero.launchMove(new PVector(1,0));
    }
  }
}
