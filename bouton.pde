//Cette classe nous permettra de définir les boutons du menu.
class Bouton {

    //Déclaration des paramètres des boutons. 
    PVector _position;
    int _width;
    int _height;
    String _label;
    color _couleur;

    //Constructeur des boutons.
    Bouton(PVector position, int width, int height, String label) {
      _position = position;
      _width = width;
      _height = height;
      _label = label;
      _couleur = color(200);
    }

    //Dessin du bouton !
    void drawIt() {
      fill(_couleur);
      rect(_position.x, _position.y, _width, _height);
      fill(0);
      textAlign(CENTER, CENTER);
      text(_label, _position.x + _width/2, _position.y + _height/2);
    }

    boolean overButton() {
      return ((_position.x < mouseX ) && (mouseX < (_position.x + _width))) &&
             ((_position.y < mouseY) && (mouseY < (_position.y + _height)));
    }
}