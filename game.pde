//Enumération, pour gérer les "états" du jeu.
enum GameState 
{
  MENU,
  PLAYING
}

/*La classe Jeu, sûrement la plus importante du projet.

Elle permet de gérer les règles du jeu.
C'est ici que toute la logique se fera.*/

class Game {

  //On déclare les attributs d'une partie.
  Board _board;       //Chaque partie possède un plateau.
  Hero _hero;         //Chaque partie possède aussi un Pac-Man.
  Ghost[] _ghost_list; //Chaque partie possède une liste de fantômes.
  GameState _state;   //Le jeu possède aussi un état. Important pour afficher le menu.
  String _levelName;  // ?
  Menu _menu;         //Chaque partie possède sa propre instance de menu.
  int _score;     //Le score de la partie.

  //Constructeur d'une partie.
  Game(Board board, Hero hero, Menu menu, Ghost[] ghost_list) {
    _board = board;
    _hero = hero;
    _menu = menu;
    _state = GameState.MENU;
    _ghost_list = ghost_list;
    _score = 0;
  }
  
  //Cette fonction est utilisée dans le prog. pr. poue update à chaque frame.
  void update() {

    //Gérer l'interaction entre PacMan et les Pac-gommes.
    EatDots(_hero._cellX, _hero._cellY);
    //On actualise les déplacement du héros en Premier.
    _hero.move(_board);

  }
  
  //Cette fonction ne gère pas la logique, que l'affichage.
  void drawIt() {
    
    _board.drawIt(); //Dessin du plateau
    _hero.drawIt();  //Dessin du héros (sur le plateau du coup.)
    int offset = 0;
    for(Ghost g : _ghost_list) {
      g.drawIt(img, offset);
      offset++;
  }
    //Néanmoins si l'état du jeu vaut MENU, on affiche le menu.
    if (_state == GameState.MENU) {
      _menu.drawIt();
    }
    text("Score : " + str(_score), 50, 50);
    fill(255);
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
      case 0 :
        TriggerMenu();
        break;
    }
  }

  //Appelée quand une touche de la souris est préssée.
  void handleMouse() {
    if (_state == GameState.MENU) { //Si le jeu est sur le menu 
      for (Bouton b : _menu._liste_boutons) {
        if (b.overButton()) {
          b._couleur = color(0,255,255);
          break;
        }
      }
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
    
    if (_board._cells[x][y] == TypeCell.DOT){
      _board._cells[x][y] = TypeCell.EMPTY;
      _score += 10;
    }else if (_board._cells[x][y] == TypeCell.SUPER_DOT){
      _board._cells[x][y] = TypeCell.EMPTY;
      _score += 50;
    }
  }
}
