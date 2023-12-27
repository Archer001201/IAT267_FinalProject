class Item {
  PVector pos, dim;
  PImage itemImage, lockImage;
  int itemPrice;
  boolean isLocked;

  Item(PVector pos) {
    this.pos = pos;
    dim = new PVector(50, 50);
    isLocked = true;
    lockImage = loadImage("item_lock.png");
  }

  void update() {
    drawMe();
    if (gameUI.popupState == UISystem.noPopup && !isLocked) {
      mouseHover();
      itemClicked();
    }
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    image(itemImage, -dim.x/2, -dim.y/2);
    pushStyle();
    imageMode(CENTER);
    if (isLocked) image(lockImage, 0, 25);
    popStyle();
    popMatrix();
  }

  void mouseHover() {
    if (abs(mouseX-pos.x-dim.x/2) < dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2) {
      pushStyle();
      noFill();
      stroke(255, 0, 0);
      rect(pos.x, pos.y, dim.x, dim.y);
      popStyle();
    }
  }

  void itemClicked() {
  }
}
