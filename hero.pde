class Hero {
  // position on screen
  PVector _position;
  PVector _posOffset;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  
  // move data
  PVector _direction;
  boolean _moving; // is moving ? 
    
  Hero() {
    _cellX = 11; //Position en X sur le plateau.
    _cellY = 12; //Position en Y sur le tableau.
    _position = new PVector(_cellX * CELL_SIZE + CELL_SIZE / 2, _cellY * CELL_SIZE + CELL_SIZE / 2);
    _posOffset = new PVector(0,0); //
    _size = CELL_SIZE * 0.8; //Taille de PacMan
    _direction = new PVector(0,0);
    _moving = false;
  }
  
  // Initie le déplacement du héros en modifiant sa direction. (et son attribut _moving).
  void launchMove(PVector dir) {
    _moving = true;
    _direction = dir;
  }

  void move(Board board) {
    //Pour que PacMan se déplace.

    if (_moving != false) {

      // Case sur laquelle on veut se déplacer :
      int nvCellX = _cellX + int(_direction.x);
      int nvCellY = _cellY + int(_direction.y);

      //D'abord vérifier qu'on ne se déplace pas sur un mur :
      if (board._cells[nvCellX][nvCellY] != TypeCell.WALL) {
        _cellX = nvCellX;
        _cellY = nvCellY;
      }

      //Maintenant on déplace PacMan :
      _position = board.getCellCenter(_cellX, _cellY);
    }
  }
  
  
  void drawIt() {
    fill(255,255,0);
    noStroke();
    ellipse(_position.x, _position.y, _size, _size);
  }
}
