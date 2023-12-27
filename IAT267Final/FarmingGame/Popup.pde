class Popup {
  PVector pos, dim;
  PImage popupImage;
  Button uncheckButton;

  Popup(PVector pos) {
    this.pos = pos;
    dim = new PVector(500, 400);
    popupImage = loadImage("popup.png");
    uncheckButton = new UncheckButton(new PVector(800,200));
  }

  void update() {
    drawMe();
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x,pos.y);
    image(popupImage,0,0);
    popMatrix();
    uncheckButton.update();
  }
  
  void hideInputField(){}
}
