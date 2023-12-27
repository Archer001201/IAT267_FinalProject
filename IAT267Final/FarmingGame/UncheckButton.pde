class UncheckButton extends Button {

  UncheckButton(PVector pos) {
    super(pos);
    buttonImage = loadImage("ui_uncheck.png");
  }

  void buttonClicked() {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2 && mouseClicked && mouseButton == LEFT) {
      gameUI.popupState = UISystem.noPopup;
    }
  }
}
