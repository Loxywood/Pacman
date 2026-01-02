class Ghost {

    // position on board
    int _cellX, _cellY;
    PVector _position;
    PVector _posOffset;

    // display size
    float _size;
    // move data
    PVector _direction;
    boolean _moving;

    PImage _ghost_sprite;
    Ghost[] ghost_list;

    Ghost (int cellX, int cellY){
        _cellX = cellX;
        _cellY = cellY;
        _position = new PVector(cellX*CELL_SIZE+CELL_SIZE/2,cellY*CELL_SIZE+CELL_SIZE/2);
        _posOffset = new PVector(0,0);
        _direction = new PVector(0,0);
        _ghost_sprite = createImage(CELL_SIZE,CELL_SIZE,ARGB);
        _size = 1;
        _moving = false;
    }

    void drawIt(PImage img, int offset) {
        int sprite_size = img.height/19;

            PImage ghostSprite = img.get(sprite_size * (13 + offset)+10, -10, sprite_size, sprite_size); //Récupère les spritees des fantômes (à peu près).
            ghostSprite.resize(CELL_SIZE, CELL_SIZE);
            image(ghostSprite, _position.x - CELL_SIZE/2, _position.y - CELL_SIZE/2, CELL_SIZE, CELL_SIZE);
    }
}