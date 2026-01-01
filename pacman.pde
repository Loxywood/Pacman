//Programme principal.

Game game;
Board board;
Menu menu;
PVector test = new PVector(0,0); //à virer.

//Met en place .
void setup() {

  background(0); //Fond en noir.
  fullScreen(); //Plein écran.
  game = new Game(); //Initialisation de la partie.
  menu = new Menu();
  game._board.boardInitialization(); //Dessine le plateau de jeu
}

//Redéfinit la fenêtre à chaque frame.
void draw() {
  background(0); //A chaque frame je redessine le fond.
  game.update();
  game.drawIt();
}

//Gère les entrées clavier.
void keyPressed() {

  if (key == ESC) {
    key = 0;
    game.TriggerMenu();
    return;
  }
  game.handleKey(key);
  //menu.handleKey(key);
}
 //Gère les entyrées souris.
void mousePressed() {
}
