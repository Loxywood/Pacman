class Ghost {

    // position on board
    int _cellX, _cellY;
    PVector _position;
    float _offsetX = 0;
    float _offsetY = 0;
    //PVector _posOffset;

    // display size
    float _size;
    // move data
    PVector _direction;
    boolean _moving;

    PImage _ghost_sprite;
    Ghost[] ghost_list;

    Ghost (int cellX, int cellY){

        _offsetX = width/2 - (23*CELL_SIZE)/2;
        _offsetY = height/2 - (22*CELL_SIZE)/2;

        _cellX = cellX;
        _cellY = cellY;
        _position = new PVector(cellX*CELL_SIZE+CELL_SIZE/2+_offsetX,cellY*CELL_SIZE+CELL_SIZE/2+_offsetY);
        //_posOffset = new PVector(0,0);
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