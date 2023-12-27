class WithdrawPopup extends Popup {
  int freeWithdraw;
  ControlP5 passwordInput;
  ControlP5 withdrawAmountInput;
  Textfield passwordField, withdrawAmountField;
  String password, withdrawAmount;
  Button confirmButton, lockButton;

  WithdrawPopup(PVector pos) {
    super(pos);
    confirmButton = new ConfirmButton(new PVector(740, 465));
    lockButton = new LockButton(new PVector(420,465));
    freeWithdraw = 1;

    passwordInput = new ControlP5(farmingGame);
    withdrawAmountInput = new ControlP5(farmingGame);
    passwordField = passwordInput.addTextfield("")
      .setPosition(pos.x+50, pos.y+250)
      .setSize(150, 25)
      .setFont(tomorrowNight_8)
      .setFocus(true)
      .setColor(color(0))
      .setColorBackground(color(231, 223, 189))
      .setColorForeground(color(0))
      ;

    withdrawAmountField = withdrawAmountInput.addTextfield("")
      .setPosition(pos.x+250, pos.y+250)
      .setSize(150, 25)
      .setFont(tomorrowNight_8)
      .setFocus(true)
      .setColor(color(0))
      .setColorBackground(color(231, 223, 189))
      .setColorForeground(color(0))
      ;

    passwordField.hide();
    withdrawAmountField.hide();
  }

  void drawMe() {
    super.drawMe();
    pushMatrix();
    translate(pos.x, pos.y);
    pushStyle();
    fill(0);
    textAlign(CENTER);
    textFont(tomorrowNight_12, 12);
    text("Widthdraw", dim.x/2, 75);
    textAlign(CORNER);
    text("Balance: $" + nf(gameUI.balance, 0, 2), 50, 125);
    text("Free Withdraw: " + freeWithdraw, 50, 175);
    text("Password", 50, 235);
    text("Withdraw Amount", 250, 235);
    textFont(tomorrowNight_6, 6);
    fill(255, 0, 0);
    text("* If no free withdraw, will pay 100 coins as withdraw fee", 50, 195);
    textFont(tomorrowNight_8, 8);
    fill(255, 0, 0);
    if (((ConfirmButton)(confirmButton)).wrongPasswordTimer > 0) {
      text("Password is wrong", 50, 290);
      ((ConfirmButton)(confirmButton)).wrongPasswordTimer--;
    }
    if (((ConfirmButton)(confirmButton)).coinNotEnoughTimer > 0) {
      text("Coin is not enough", 50, 290);
      ((ConfirmButton)(confirmButton)).coinNotEnoughTimer--;
    }
    if (((ConfirmButton)(confirmButton)).invalidWithdrawTimer > 0) {
      text("Input is not a number", 250, 290);
      ((ConfirmButton)(confirmButton)).invalidWithdrawTimer--;
    }
    if (((ConfirmButton)(confirmButton)).balanceNotEnoughTimer > 0) {
      text("Balance is not enough", 250, 290);
      ((ConfirmButton)(confirmButton)).balanceNotEnoughTimer--;
    }
    popStyle();
    popMatrix();

    passwordField.show();
    withdrawAmountField.show();
    confirmButton.update(passwordField, withdrawAmountField);
    lockButton.update();
  }

  void hideInputField() {
    passwordField.hide();
    withdrawAmountField.hide();
  }
}
