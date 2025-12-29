//Définit le type des cellules ainsi que leurs attributs.
enum TypeCell 
{
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN // others ?
}

//Classe plateau
class Board 
{
  //Déclaration des attributs de la classe.
  TypeCell _cells[][]; 
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  int _cellSize; // cells should be square
  
  Board(PVector position, int nbCellsX, int nbCellsY) {
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = CELL_SIZE;
    _position = position;
  }
  
  PVector getCellCenter(int i, int j) { 
    return new PVector(i*_cellSize + _cellSize/2, j*_cellSize + _cellSize/2);
  }
  
  void drawIt() {
  
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
    //Maintenant que _cells est rempli, on dessin la grille.

    strokeWeight(1);
    for(int i=0;i<_nbCellsX;i++){
      for(int j=0;j<_nbCellsY;j++){

        //print(_cells[i][j]);
        switch(_cells[i][j]){
          case EMPTY :
            noStroke();
            noFill();
            square(i*_cellSize,j*_cellSize,_cellSize);
            break;
          case WALL :
            stroke(0,0,255);
            noFill();
            square(i*_cellSize,j*_cellSize,_cellSize);
            break;
          case DOT :
            noStroke();
            fill(255,187,209);
            circle(i*_cellSize+_cellSize/2,j*_cellSize+_cellSize/2,10);
            break;
          case SUPER_DOT :
            noStroke();
            fill(255,187,209);
            circle(i*_cellSize+_cellSize/2,j*_cellSize+_cellSize/2,20);
            break;
          case PACMAN :
          break;
        } 
        
      }
    }

  }

}
