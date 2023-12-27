UISystem gameUI;
PImage backgroundImage;
ArrayList<Farmland> farmlands = new ArrayList<Farmland>();
ArrayList<Crop> crops = new ArrayList<Crop>();

void awake() {
  readFontFile();
  audioSetup();
  bgm.loop();
  gameUI = new UISystem();
  backgroundImage = loadImage("bg.png");
  farmlands.add(new Farmland(new PVector(200, 160)));
  farmlands.add(new Farmland(new PVector(700, 160)));
}

void update() {
  background(255);
  image(backgroundImage, -5, 0);

  for (int i=0; i<farmlands.size(); i++) {
    farmlands.get(i).drawMe();
  }

  for (int i=0; i<crops.size(); i++) {
    Crop c = crops.get(i);
    c.update();
  }

  for (int i=0; i<crops.size(); i++) {
    Crop c = crops.get(i);
    if (gameUI.popupState == UISystem.noPopup) c.mouseHover();
  }

  gameUI.update();
  upgradeReward();
}

void upgradeReward() {
  if (gameUI.playerLvl >= 1) {
    for (int i=0; i<8; i++) {
      farmlands.get(0).tiles.get(i).isLocked = false;
    }
    gameUI.shovel.isLocked = false;
    gameUI.wateringCan.isLocked = false;
    gameUI.turnipSeed.isLocked = false;
  }
  if (gameUI.playerLvl >= 2) {
    for (int i=8; i<12; i++) {
      farmlands.get(0).tiles.get(i).isLocked = false;
    }
  }
  if (gameUI.playerLvl >= 4) {
    for (int i=12; i<16; i++) {
      farmlands.get(0).tiles.get(i).isLocked = false;
    }
  }
  if (gameUI.playerLvl >= 6) {
    for (int i=0; i<4; i++) {
      farmlands.get(1).tiles.get(i).isLocked = false;
    }
  }
  if (gameUI.playerLvl >= 8) {
    for (int i=4; i<8; i++) {
      farmlands.get(1).tiles.get(i).isLocked = false;
    }
  }
  if (gameUI.playerLvl >= 10) {
    for (int i=8; i<12; i++) {
      farmlands.get(1).tiles.get(i).isLocked = false;
    }
  }
  if (gameUI.playerLvl >= 12) {
    for (int i=12; i<16; i++) {
      farmlands.get(1).tiles.get(i).isLocked = false;
    }
  }
  
  if (gameUI.playerLvl >= 3) gameUI.eggplantSeed.isLocked = false;
  if (gameUI.playerLvl >= 5) gameUI.pumpkinSeed.isLocked = false;
  if (gameUI.playerLvl >= 7) gameUI.fertilizer.isLocked = false;
  if (gameUI.playerLvl >= 9) gameUI.blueberrySeed.isLocked = false;
  if (gameUI.playerLvl >= 11) gameUI.watermelonSeed.isLocked = false;
}
