class WateringCan extends Item {

  WateringCan(PVector pos) {
    super(pos);
    itemImage = loadImage("watering_can.png");
    itemPrice = 5;
  }

  void update() {
    super.update();
  }

  void itemClicked() {
    if (abs(mouseX-pos.x-dim.x/2) < dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2) {
      if (mouseClicked && mouseButton == LEFT && gameUI.grabItem == UISystem.grabEmpty) gameUI.grabItem = UISystem.grabWateringCan;
      if (mouseClicked && mouseButton == RIGHT) gameUI.grabItem = UISystem.grabEmpty;
    }
  }
}
