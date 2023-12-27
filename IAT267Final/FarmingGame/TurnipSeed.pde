class TurnipSeed extends Item {

  TurnipSeed(PVector pos) {
    super(pos);
    itemImage = loadImage("turnip_seed.png");
    itemPrice = 20;
  }

  void update() {
    super.update();
  }

  void itemClicked() {
    if (abs(mouseX-pos.x-dim.x/2) < dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2) {
      if (mouseClicked && mouseButton == LEFT && gameUI.grabItem == UISystem.grabEmpty) gameUI.grabItem = UISystem.grabTurnip;
      if (mouseClicked && mouseButton == RIGHT) gameUI.grabItem = UISystem.grabEmpty;
    }
  }
}
