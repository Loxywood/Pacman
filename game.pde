//Enumération, pour gérer les "états" du jeu.
enum GameState 
{
  MENU,
  PLAYING
}

/*La classe Jeu, sûrement la plus importante du projet.

Elle permet de gérer les règles du jeu.
C'est ici que toute la logique se fera.*/

class Game 
{

  //On déclare les attributs d'une partie.
  Board _board;       //Chaque partie possède un plateau.
  Hero _hero;         //Chaque partie possède aussi un Pac-Man.
  GameState _state;   //Le jeu possède aussi un état. Important pour afficher le menu.
  String _levelName;  // ?
  Menu _menu;         //Chaque partie possède sa propre instance de menu.
  

  //Constructeur d'une partie.
  Game() {
    _board = new Board(new PVector(0,0),23,22);
    _hero = new Hero();
    _menu = new Menu();
    _state = GameState.MENU;
  }
  
  //Cette fonction est utilisée dans le prog. pr. poue update à chaque frame.
  void update() {

    //On actualise les déplacement du héros en Premier.
    _hero.move(_board);
    //Gérer l'interaction entre PacMan et les Pac-gommes.
    EatDots(_hero._cellX, _hero._cellY);

  }
  
  //Cette fonction ne gère pas la logique, que l'affichage.
  void drawIt() {

    _board.drawIt(); //Dessin du plateau
    _hero.drawIt();  //Dessin du héros (sur le plateau du coup.)

    //Néanmoins si l'état du jeu vaut MENU, on affiche le menu.
    if (_state == GameState.MENU) {
      _menu.drawIt();
    }
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
        break;
    }
  }

  void TriggerMenu() {
    if (_state == GameState.PLAYING) {
      _state = GameState.MENU;
    } else {
      _state = GameState.PLAYING;
    }
  }

  //Pour gérer le fait que PacMan mange les Pac-gommes.
  void EatDots(int x, int y) {
    
    if ((_board._cells[x][y] == TypeCell.DOT)||(_board._cells[x][y] == TypeCell.SUPER_DOT)){
      _board._cells[x][y] = TypeCell.EMPTY;
    }
  }
}
