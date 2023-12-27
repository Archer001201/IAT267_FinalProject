class SettingButton extends Button {

  SettingButton(PVector pos) {
    super(pos);
    buttonImage = loadImage("setting.png");
  }

  void buttonClicked() {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2 && mouseClicked && mouseButton == LEFT) {
      gameUI.popupState = UISystem.popupSetting;
    }
  }
}
