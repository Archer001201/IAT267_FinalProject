class Tile {
  PVector pos, dim;
  PImage tileImage, dryTileImage, lockImage;
  boolean empty;
  float moisture;
  float nutrient;
  boolean isLocked;

  Tile(PVector pos) {
    this.pos = pos;
    empty = true;
    tileImage = loadImage("tile.png");
    dryTileImage = loadImage("tile_dry.png");
    lockImage = loadImage("lock.png");
    dim = new PVector(tileImage.width, tileImage.height);
    moisture = 2000;
    nutrient = 0;
    isLocked = true;
  }

  void update(PVector fPos) {
    drawMe();
    if (gameUI.popupState == UISystem.noPopup && !isLocked) {
      mouseHover(fPos);
      itemClicked(fPos);
    }
    //if (moisture > 2000) moisture = 2000;
    if (moisture < 0) moisture = 0;
    if (nutrient < 0) nutrient = 0;
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    if (moisture > 0) image(tileImage, -dim.x/2, -dim.y/2);
    else image(dryTileImage, -dim.x/2, -dim.y/2);
    if (isLocked) image(lockImage, -dim.x/2, -dim.y/2);
    popMatrix();
  }

  void mouseHover(PVector fPos) {
    pushStyle();
    fill(200, 200, 200, 100);
    noStroke();
    if (abs(mouseX-pos.x-dim.x/2-fPos.x)<dim.x/2 && abs(mouseY-pos.y-dim.y/2-fPos.y)<dim.y/2)
      rect(pos.x, pos.y, dim.x, dim.y);
    popStyle();
  }

  void itemClicked(PVector fPos) {
    if (abs(mouseX-pos.x-dim.x/2-fPos.x)<dim.x/2 && abs(mouseY-pos.y-dim.y/2-fPos.y)<dim.y/2) {
      if (mouseClicked && mouseButton == LEFT) {
        if (empty) {
          switch(gameUI.grabItem) {
          case UISystem.grabPumpkin:
            if (gameUI.coinAmount < gameUI.pumpkinSeed.itemPrice) break;
            else {
              playAudio(SEED);
              empty = false;
              gameUI.coinAmount -= gameUI.pumpkinSeed.itemPrice;
              crops.add(new Pumpkin(new PVector(pos.x+fPos.x+dim.x/4, pos.y+fPos.y+dim.y/4), this));
              break;
            }
          case UISystem.grabWatermelon:
            if (gameUI.coinAmount < gameUI.watermelonSeed.itemPrice) break;
            else {
              playAudio(SEED);
              empty = false;
              gameUI.coinAmount -= gameUI.watermelonSeed.itemPrice;
              crops.add(new Watermelon(new PVector(pos.x+fPos.x+dim.x/4, pos.y+fPos.y+dim.y/4), this));
              break;
            }
          case UISystem.grabBlueberry:
            if (gameUI.coinAmount < gameUI.blueberrySeed.itemPrice) break;
            else {
              playAudio(SEED);
              empty = false;
              gameUI.coinAmount -= gameUI.blueberrySeed.itemPrice;
              crops.add(new Blueberry(new PVector(pos.x+fPos.x+dim.x/4, pos.y+fPos.y+dim.y/4), this));
              break;
            }
          case UISystem.grabTurnip:
            if (gameUI.coinAmount < gameUI.turnipSeed.itemPrice) break;
            else {
              playAudio(SEED);
              empty = false;
              gameUI.coinAmount -= gameUI.turnipSeed.itemPrice;
              crops.add(new Turnip(new PVector(pos.x+fPos.x+dim.x/4, pos.y+fPos.y+dim.y/4), this));
              break;
            }
          case UISystem.grabEggplant:
            if (gameUI.coinAmount < gameUI.eggplantSeed.itemPrice) break;
            else {
              playAudio(SEED);
              empty = false;
              gameUI.coinAmount -= gameUI.eggplantSeed.itemPrice;
              crops.add(new Eggplant(new PVector(pos.x+fPos.x+dim.x/4, pos.y+fPos.y+dim.y/4), this));
              break;
            }
          }
        }
        switch(gameUI.grabItem) {
        case UISystem.grabWateringCan:
          if (gameUI.coinAmount < gameUI.wateringCan.itemPrice) break;
          else {
            playAudio(WATERING);
            gameUI.coinAmount -= gameUI.wateringCan.itemPrice;
            moisture += 2000;
            break;
          }
        case UISystem.grabFertilizer:
          if (gameUI.coinAmount < gameUI.fertilizer.itemPrice) break;
          else {
            playAudio(FERTILIZER);
            gameUI.coinAmount -= gameUI.fertilizer.itemPrice;
            nutrient += 1000;
            break;
          }
        }
      }
    }
  }
}
