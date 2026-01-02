//Cette classe nous permet de gérer tout ce qui est relatif au menu : sa création, son affichage, ertc.
class Menu {

//De quoi est composé une instance de Menu ?
Bouton _restart;
Bouton _save;
Bouton _load;
Bouton _quit;
PFont myFont;

Bouton[] _liste_boutons;

  //Constructeur d'un Menu.
  Menu() {
    int buttonWidth = 200;
    int buttonHeight = 50;
    int spacing = 30; // Espace vertical entre les boutons

    float startY = height/2 - (buttonHeight * 2 + spacing * 1.5);

    _restart = new Bouton(new PVector(width/2 - buttonWidth/2, startY), buttonWidth, buttonHeight, "Restart");
    _save    = new Bouton(new PVector(width/2 - buttonWidth/2, startY + buttonHeight + spacing), buttonWidth, buttonHeight, "Save");
    _load    = new Bouton(new PVector(width/2 - buttonWidth/2, startY + 2 * (buttonHeight + spacing)), buttonWidth, buttonHeight, "Load");
    _quit    = new Bouton(new PVector(width/2 - buttonWidth/2, startY + 3 * (buttonHeight + spacing)), buttonWidth, buttonHeight, "Quit");
    _liste_boutons = new Bouton[] {_restart, _save, _load, _quit};
  }
  
  //Pour DESSINER le menu, uniquement.
  void drawIt() {
    // Fond semi-transparent
    fill(0, 0, 0, 200);
    rect(0, 0, width, height);
    //Uncomment the following two lines to see the available fonts 
    myFont = createFont("Upheaval TT -BRK-",32);
    textFont(myFont);
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
