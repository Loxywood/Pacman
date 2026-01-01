//Cette classe nous permet de gérer tout ce qui est relatif au menu : sa création, son affichage, ertc.
class Menu {

  //De quoi est composé une instance de Menu ?
  Bouton _restart;
  Bouton _save;
  Bouton _load;
  Bouton _quit;

  //Constructeur d'un Menu.
  Menu() {
    _restart = new Bouton (new PVector(width/2 - 50, height/2 - 100), 100, 40, "Restart");
    _save = new Bouton (new PVector(width/2 - 50, height/2 - 50), 100, 40, "Save");
    _load = new Bouton (new PVector(width/2 - 50, height/2), 100, 40, "Load");
    _quit = new Bouton (new PVector(width/2 - 50, height/2 + 50), 100, 40, "Quit");
  }
  
  //Pour DESSINER le menu, uniquement.
  void drawIt() {
    // Fond semi-transparent
    fill(0, 0, 0, 200);
    rect(0, 0, width, height);
    fill(255); // Set text color to white
    textSize(32); // Set text size
    textAlign(CENTER, CENTER); // Center the text
    text("Menu Pause", width/2, height/2);

    _restart.drawIt();
    _save.drawIt();
    _load.drawIt(); 
    _quit.drawIt();
  }
}
