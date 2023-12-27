class ConfirmButton extends Button {
  int wrongPasswordTimer, invalidWithdrawTimer, balanceNotEnoughTimer, coinNotEnoughTimer;

  ConfirmButton(PVector pos) {
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
    text("Confirm", 0, 0);
    popStyle();
    popMatrix();
  }

  void buttonClicked(Textfield pf, Textfield waf) {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2 && mouseClicked && mouseButton == LEFT) {
      float amount = 0;
      try {
        amount = Float.parseFloat(waf.getText());
      }
      catch (NumberFormatException e) {
        invalidWithdrawTimer = 120;
      }
      if (gameUI.balance < amount) balanceNotEnoughTimer  = 120;
      else gameUI.balance -= amount;

      //if password is correct, send message to arduino that open the piggy bank
      if (!pf.getText().equals(gameUI.passwordCurrent)) wrongPasswordTimer = 120;
      else {
        if (((WithdrawPopup)gameUI.withdrawPopup).freeWithdraw > 0) {
          ((WithdrawPopup)gameUI.withdrawPopup).freeWithdraw --;
          arduinoWrite("unlock");
          playAudio(WITHDRAW);
        } else if (gameUI.coinAmount >= 100) {
          gameUI.coinAmount -= 100;
          arduinoWrite("unlock");
          playAudio(WITHDRAW);
        } else coinNotEnoughTimer = 120;
      }

      //clear input
      pf.setText("");
      waf.setText("");
    }
  }
}
