class UISystem {
  PImage longBar, shortBar, playerStateBar;

  Item pumpkinSeed, watermelonSeed, blueberrySeed, turnipSeed, eggplantSeed, wateringCan, fertilizer, shovel;
  Button withdrawButton, settingButton;
  Popup withdrawPopup, settingPopup;

  int grabItem;
  static final int grabEmpty = 0;
  static final int grabPumpkin = 1;
  static final int grabBlueberry = 2;
  static final int grabWatermelon = 3;
  static final int grabTurnip = 4;
  static final int grabEggplant = 5;
  static final int grabWateringCan = 6;
  static final int grabFertilizer = 7;
  static final int grabShovel = 8;

  int popupState;
  static final int noPopup = 0;
  static final int popupWithdraw = 1;
  static final int popupSetting = 2;

  int playerLvl;
  float playerExp, upgradeExp;

  String passwordCurrent = "12345";

  boolean saveDataPressed;

  //if arduino detect coin drops, change the value
  float balance = 0;
  int coinAmount;

  PImage pumpkinSeedImage;
  PImage watermelonSeedImage;
  PImage blueberrySeedImage;
  PImage turnipSeedImage;
  PImage eggplantSeedImage;
  PImage wateringCanImage;
  PImage fertilizerImage;
  PImage shovelImage;
  PImage coinImageSmall, coinImageLarge;

  UISystem() {
    longBar = loadImage("ui_long.png");
    shortBar = loadImage("ui_short.png");
    playerStateBar = loadImage("ui_player.png");

    pumpkinSeedImage = loadImage("pumpkin_seed.png");
    watermelonSeedImage = loadImage("watermelon_seed.png");
    blueberrySeedImage = loadImage("blueberry_seed.png");
    turnipSeedImage = loadImage("turnip_seed.png");
    eggplantSeedImage = loadImage("eggplant_seed.png");
    wateringCanImage = loadImage("watering_can.png");
    fertilizerImage = loadImage("fertilizer.png");
    shovelImage = loadImage("shovel.png");
    coinImageSmall = loadImage("coin_small.png");
    coinImageLarge = loadImage("coin_large.png");

    withdrawButton = new WithdrawButton(new PVector(750, 20));
    settingButton = new SettingButton(new PVector(900, 20));
    withdrawPopup = new WithdrawPopup(new PVector(390, 160));
    settingPopup = new SettingPopup(new PVector(390, 160));

    pumpkinSeed = new PumpkinSeed(new PVector(1177, 610));
    watermelonSeed = new WatermelonSeed(new PVector(865, 610));
    blueberrySeed = new BlueberrySeed(new PVector(1021, 610));
    turnipSeed = new TurnipSeed(new PVector(553, 610));
    eggplantSeed = new EggplantSeed(new PVector(709, 610));
    
    shovel = new Shovel(new PVector(50, 610));
    wateringCan = new WateringCan(new PVector(225, 610));
    fertilizer = new Fertilizer(new PVector(400, 610));


    playerLvl = 1;
    playerExp = 0;
    upgradeExp = 200;
    coinAmount = 100;
    saveDataPressed = false;
    popupState = noPopup;
  }

  void update() {
    drawMe();
    upgrade();

    switch(grabItem) {
    case grabEmpty:
      resetItemPos();
      break;
    case grabPumpkin:
      resetItemPos();
      pumpkinSeed.pos = new PVector(mouseX-pumpkinSeed.dim.x/2, mouseY-pumpkinSeed.dim.y/2);
      break;
    case grabWatermelon:
      resetItemPos();
      watermelonSeed.pos = new PVector(mouseX-watermelonSeed.dim.x/2, mouseY-watermelonSeed.dim.y/2);
      break;
    case grabBlueberry:
      resetItemPos();
      blueberrySeed.pos = new PVector(mouseX-blueberrySeed.dim.x/2, mouseY-blueberrySeed.dim.y/2);
      break;
    case grabTurnip:
      resetItemPos();
      turnipSeed.pos = new PVector(mouseX-turnipSeed.dim.x/2, mouseY-turnipSeed.dim.y/2);
      break;
    case grabEggplant:
      resetItemPos();
      eggplantSeed.pos = new PVector(mouseX-eggplantSeed.dim.x/2, mouseY-eggplantSeed.dim.y/2);
      break;
    case grabWateringCan:
      resetItemPos();
      wateringCan.pos = new PVector(mouseX-wateringCan.dim.x/2, mouseY-wateringCan.dim.y/2);
      break;
    case grabFertilizer:
      resetItemPos();
      fertilizer.pos = new PVector(mouseX-fertilizer.dim.x/2, mouseY-fertilizer.dim.y/2);
      break;
    case grabShovel:
      resetItemPos();
      shovel.pos = new PVector(mouseX-shovel.dim.x/2, mouseY-shovel.dim.y/2);
      break;
    }
  }

  void drawMe() {
    image(longBar, 250, 0);
    pushStyle();
    noStroke();
    fill(120, 56, 30);
    if (playerExp <= upgradeExp) rect(295, 35, map(playerExp, 0, upgradeExp, 0, 190), 27.5);
    popStyle();
    image(playerStateBar, 260, 20);
    image(coinImageLarge, 600, 20);
    image(shortBar, 0, 600);
    image(longBar, 500, 600);
    
    image(wateringCanImage, 225, 610);
    image(fertilizerImage, 400, 610);
    image(shovelImage, 50, 610);
    
    image(turnipSeedImage, 553, 610);
    image(eggplantSeedImage, 709, 610);
    image(pumpkinSeedImage, 865, 610);
    image(blueberrySeedImage, 1021, 610);
    image(watermelonSeedImage, 1177, 610);
    
    pumpkinSeed.update();
    watermelonSeed.update();
    blueberrySeed.update();
    turnipSeed.update();
    eggplantSeed.update();
    wateringCan.update();
    fertilizer.update();
    shovel.update();

    withdrawButton.update();
    settingButton.update();

    pushStyle();
    fill(0);
    textFont(tomorrowNight_12, 12);
    text("LEVEL: " + playerLvl, 275, 95);
    pushStyle();
    textAlign(CENTER);
    text(coinAmount, 625, 95);
    text("Withdraw", 775, 95);
    text("Settings", 925, 95);
    popStyle();
    textFont(tomorrowNight_8, 8);
    text("EXP: " + playerExp + "/" + upgradeExp, 335, 50);
    textAlign(CENTER);
    text("Watering Can", 250, 675);
    text("Fertilizer", 425, 675);
    text("Shovel", 75, 675);
    text("Pumpkin Seed", 890, 675);
    text("Watermelon Seed", 1202, 675);
    text("Blueberry Seed", 1046, 675);
    text("Turnip Seed", 578, 675);
    text("Eggplant Seed", 734, 675);
    image(coinImageSmall, 50, 685);
    image(coinImageSmall, 225, 685);
    image(coinImageSmall, 400, 685);
    image(coinImageSmall, 553, 685);
    image(coinImageSmall, 709, 685);
    image(coinImageSmall, 865, 685);
    image(coinImageSmall, 1021, 685);
    image(coinImageSmall, 1177, 685);
    text(wateringCan.itemPrice, 265, 697.5);
    text(fertilizer.itemPrice, 440, 697.5);
    text(shovel.itemPrice, 90, 697.5);
    text(pumpkinSeed.itemPrice, 905, 697.5);
    text(watermelonSeed.itemPrice, 1217, 697.5);
    text(blueberrySeed.itemPrice, 1061, 697.5);
    text(turnipSeed.itemPrice, 593, 697.5);
    text(eggplantSeed.itemPrice, 749, 697.5);
    popStyle();

    switch(popupState) {
    case popupWithdraw:
      withdrawPopup.update();
      settingPopup.hideInputField();
      break;
    case popupSetting:
      settingPopup.update();
      withdrawPopup.hideInputField();
      break;
    default:
      withdrawPopup.hideInputField();
      settingPopup.hideInputField();
    }
  }

  void resetItemPos() {
    turnipSeed.pos = new PVector(553, 610);
    eggplantSeed.pos = new PVector(709, 610);
    pumpkinSeed.pos = new PVector(865, 610);
    blueberrySeed.pos = new PVector(1021, 610);
    watermelonSeed.pos = new PVector(1177, 610);
    
    wateringCan.pos = new PVector(225, 610);
    fertilizer.pos = new PVector(400, 610);
    shovel.pos = new PVector(50, 610);
  }

  void upgrade() {
    if (playerExp >= upgradeExp) {
      playerExp -= upgradeExp;
      upgradeExp += 5*playerLvl;
      playerLvl ++;
      playAudio(LEVELUP);
      ((WithdrawPopup)withdrawPopup).freeWithdraw ++;
    }
  }
}
