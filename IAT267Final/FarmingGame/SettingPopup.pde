class SettingPopup extends Popup {
  ControlP5 currentPasswordInput, newPasswordInput;
  Textfield currentPasswordField, newPasswordField;
  Button saveButton;


  SettingPopup(PVector pos) {
    super(pos);
    saveButton = new SaveButton(new PVector(740, 465));
    currentPasswordInput = new ControlP5(farmingGame);
    newPasswordInput = new ControlP5(farmingGame);

    currentPasswordField = currentPasswordInput.addTextfield("")
      .setPosition(pos.x+225, pos.y+150)
      .setSize(150, 25)
      .setFont(tomorrowNight_8)
      .setFocus(true)
      .setColor(color(0))
      .setColorBackground(color(231, 223, 189))
      .setColorForeground(color(0))
      ;

    newPasswordField = newPasswordInput.addTextfield("")
      .setPosition(pos.x+225, pos.y+225)
      .setSize(150, 25)
      .setFont(tomorrowNight_8)
      .setFocus(true)
      .setColor(color(0))
      .setColorBackground(color(231, 223, 189))
      .setColorForeground(color(0))
      ;

    currentPasswordField.hide();
    newPasswordField.hide();
  }

  void drawMe() {
    super.drawMe();
    pushMatrix();
    translate(pos.x, pos.y);
    pushStyle();
    fill(0);
    textAlign(CENTER);
    textFont(tomorrowNight_12, 12);
    text("Setting", dim.x/2, 75);
    textFont(tomorrowNight_6, 6);
    fill(255,0,0);
    text("* Default password is: 12345", dim.x/2, 100);
    textAlign(CORNER);
    fill(0);
    textFont(tomorrowNight_8, 8);
    text("Current Password", 90, 165);
    text("New Password", 120, 240);
    
    fill(255,0,0);
    if (((SaveButton)(saveButton)).wrongPasswordTimer > 0) {
      text("Password is wrong", 225, 190);
      ((SaveButton)(saveButton)).wrongPasswordTimer--;
    }
    if (((SaveButton)(saveButton)).invalidPasswordTimer > 0) {
      text("Password can not be empty", 225, 265);
      ((SaveButton)(saveButton)).invalidPasswordTimer--;
    }
    popStyle();
    popMatrix();

    currentPasswordField.show();
    newPasswordField.show();
    saveButton.update(currentPasswordField, newPasswordField);
  }

  void hideInputField() {
    currentPasswordField.hide();
    newPasswordField.hide();
  }
}
