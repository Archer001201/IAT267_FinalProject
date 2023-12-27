class LockButton extends Button {
  int wrongPasswordTimer, invalidWithdrawTimer, balanceNotEnoughTimer, coinNotEnoughTimer;

  LockButton(PVector pos) {
    super(pos);
    buttonImage = loadImage("button.png");
    dim = new PVector(100, 50);
    wrongPasswordTimer = 0;
    invalidWithdrawTimer = 0;
    balanceNotEnoughTimer = 0;
  }

  void drawMe() {
    super.drawMe();
    pushMatrix();
    pushStyle();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    textAlign(CENTER);
    textFont(tomorrowNight_12, 12);
    text("Lock", 0, 0);
    popStyle();
    popMatrix();
  }

  void buttonClicked() {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2 && mouseClicked && mouseButton == LEFT) {
      arduinoWrite("lock");
    }
  }
}
