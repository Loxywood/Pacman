Game game;
Board board;
PVector test = new PVector(0,0); //à virer.

//Met en place .
void setup() {

  background(0); //Fond en noir.
  fullScreen(); //Plein écran.
  game = new Game(); //Initialisation de la partie.
  game._board.drawIt(); //Dessine le plateau de jeu
}

//Redéfinit la fenêtre à chaque frame.
void draw() {
  background(0);
  game.update();
  game.drawIt();
  
}

//Gère les entrées clavier.
void keyPressed() {
  game.handleKey(key);
}
 //Gère les entyrées souris.
void mousePressed() {
}
