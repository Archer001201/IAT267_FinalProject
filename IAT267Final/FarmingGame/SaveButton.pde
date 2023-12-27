class SaveButton extends Button {
  int wrongPasswordTimer, invalidPasswordTimer;
  
  SaveButton(PVector pos) {
    super(pos);
    buttonImage = loadImage("button.png");
    dim = new PVector(100, 50);
    wrongPasswordTimer = 0;
  }

  void drawMe() {
    super.drawMe();
    pushMatrix();
    pushStyle();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    textAlign(CENTER);
    textFont(tomorrowNight_12, 12);
    text("Save", 0, 0);
    popStyle();
    popMatrix();
  }

  void buttonClicked(Textfield cpf, Textfield npf) {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2 && mouseClicked && mouseButton == LEFT) {
      if (!cpf.getText().equals(gameUI.passwordCurrent)) wrongPasswordTimer = 120;
      else{
        if(!npf.getText().equals("")){
          gameUI.passwordCurrent = npf.getText();
          saveData();
        }
        else invalidPasswordTimer = 120;
      }
      
      //clear input
      cpf.setText("");
      npf.setText("");
    }
  }
}
