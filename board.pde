//Définit le type des cellules ainsi que leurs attributs.
enum TypeCell 
{
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN // others ?
}

//Cette classe sert à gérer tous les détails relatifs au plateau.
class Board 
{

  //Déclaration des attributs du plateau.
  TypeCell _cells[][]; //Matrice qui recense le type de chaque cellule.
  float _offsetX;      //Décalage horizontal du plateau.
  float _offsetY;     //Décalage vertical du plateau.
  PVector _position;   //Position à laquelle on commence à dessiner le plateau
  int _nbCellsX;       //Nombre de cellules à l'horizontale.
  int _nbCellsY;       //Nombre de cellules à la verticale.
  int _cellSize;       //Taille des cellules.

  
  //Constructeur pour initialiser le plateau.
  Board(int nbCellsX, int nbCellsY) {

    _offsetX  = width/2 - (nbCellsX * CELL_SIZE) / 2;
    _offsetY  = height/2 - (nbCellsY * CELL_SIZE) / 2;
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = CELL_SIZE;
    _position = new PVector(_offsetX, _offsetY);
    boardInitialization();
  }

  //Pour initialiser le plateau.
  void boardInitialization() {

    //Génère un tableau dont les lignes sont composées des lignes du fichier level1.txt
    String[] lines = loadStrings("levels/level1.txt");
    if (lines == null) {
      print("Erreur, les lignes de la grille n'ont pas chargé.");
      return;
    }
    //Matrice qui représente le type des cellules du niveau.
    _cells = new TypeCell[_nbCellsX][_nbCellsY];

    for(int i=0;i<_nbCellsX;i++){
      for (int j=0;j<_nbCellsY;j++){
        
        char lettre = lines[j].charAt(i);

        switch(lettre) {
          case 'x' :
           _cells[i][j] = TypeCell.WALL;
            break;
          case 'V' :
           _cells[i][j] = TypeCell.EMPTY;
            break;
          case 'o' :
           _cells[i][j] = TypeCell.DOT;
            break;
          case 'O' :
           _cells[i][j] = TypeCell.SUPER_DOT;
            break;
          case 'P' :
           _cells[i][j] = TypeCell.PACMAN;
            break;
        }

      }
    }
  }
  
  //Pour récupérer le centre d'une cellule donnée.
  PVector getCellCenter(int i, int j) { 
    return new PVector(i*_cellSize + _offsetX + _cellSize/2, j*_cellSize + _offsetY + _cellSize/2);
  }

  //Cette fonction va dessiner le plateau.
  void drawIt() {

    strokeWeight(1);
    for(int i=0;i<_nbCellsX;i++){
      for(int j=0;j<_nbCellsY;j++){

        //print(_cells[i][j]);
        switch(_cells[i][j]){
          case EMPTY :
            noStroke();
            noFill();
            square(i*_cellSize + _offsetX, j*_cellSize + _offsetY, _cellSize);
            break;
          case WALL :
            stroke(0,0,255);
            noFill();
            square(i*_cellSize + _offsetX, j*_cellSize + _offsetY, _cellSize);
            break;
          case DOT :
            noStroke();
            fill(255,187,209);
            circle(i*_cellSize + _offsetX + _cellSize/2, j*_cellSize + _offsetY + _cellSize/2, 10);
            break;
          case SUPER_DOT :
            noStroke();
            fill(255,187,209);
            circle(i*_cellSize + _offsetX + _cellSize/2, j*_cellSize + _offsetY + _cellSize/2, 20);
            break;
          case PACMAN :
          break;
        } 
        
      }
    }

  }

}
