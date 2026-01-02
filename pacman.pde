//Programme principal.

Game game;
Board board;
Menu menu;
Ghost[] ghost_list;
PImage img;

//Met en place .
void setup() {
  img = loadImage("img/pacman_sprites.png");
  background(0); //Fond en noir.
  fullScreen(); //Plein écran.
  game = new Game(); //Initialisation de la partie.
  menu = new Menu();
  game._board.boardInitialization(); //Dessine le plateau de jeu

  //Créer les fantômes.
  ghost_list = new Ghost[4];
  ghost_list[0] = new Ghost(9,10);  //fantôme rouge
  ghost_list[1] = new Ghost(10,10); //fantôme rose
  ghost_list[2] = new Ghost(12,10); //fantôme orange
  ghost_list[3] = new Ghost(13,10); //fantôme bleu
}

//Redéfinit la fenêtre à chaque frame.
void draw() {
  background(0); //A chaque frame je redessine le fond.
  game.update();
  game.drawIt();
  int offset = 0;
  for(Ghost g : ghost_list) {
      g.drawIt(img, offset);
      offset++;
  }
}

//Gère les entrées clavier.
void keyPressed() {

  if (key == ESC) {
    key = 0;
  }
  game.handleKey(key);
  //menu.handleKey(key);
}
 //Gère les entyrées souris.
void mousePressed() {
  game.handleMouse();
}
