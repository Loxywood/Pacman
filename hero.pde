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
    _position = new PVector(11 * CELL_SIZE + CELL_SIZE / 2, 16 * CELL_SIZE + CELL_SIZE / 2);
    _posOffset = new PVector(0,0); //
    _cellX = 11; //Position en X sur le plateau.
    _cellY = 10; //Position en Y sur le tableau.
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
    if (_moving) {
      int vitesse = 2; // pixels par frame
      _position.x += _direction.x * vitesse;
      _position.y += _direction.y * vitesse;
    }
  }
  
  
  void drawIt() {
    fill(255,255,0);
    noStroke();
    ellipse(_position.x, _position.y, _size, _size);
  }
}
