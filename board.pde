enum TypeCell 
{
  EMPTY, WALL, DOT, SUPER_DOT // others ?
}

class Board 
{
  TypeCell _cells[][];
  PVector _position;
  int _nbCellsX;
  int _nbCellsY;
  int _cellSize; // cells should be square
  
  Board(PVector position, int nbCellsX, int nbCellsY, int cellSize) {
    //Reste à savoir quoi faire de position
    _nbCellsX = nbCellsX;
    _nbCellsY = nbCellsY;
    _cellSize = cellSize;
  }
  
  PVector getCellCenter(int i, int j) {
    return null;
  }
  
  void drawIt() {
    //Génère un tableau dont les lignes sont composées des lignes du fichier level1.txt
    String[] lines = loadStrings("./levels/level1.txt"); 
    char[][] temp = new char[lines.length][];
    for (int i = 0; i<lines.length;i++){
      temp[i] = lines[i].toCharArray();
    }
    for(int i=0;i<temp.length;i++){
      for(int j=0;j<temp[i].length;j++){
        //Voir pour se passer de temp en utilisant enum TypeCell.
      }
    }
  }
}
