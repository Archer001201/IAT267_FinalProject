class Crop {
  PVector pos, dim;
  PImage[] cropImages = new PImage[5];
  String cropName;
  Tile placedTile;

  float growTime, growTimer, growSpeed, growSpeedDry, growSpeedFertilized;
  int growPeriod;
  boolean canHarvest;
  float cropExp;

  static final int P_ONE = 0;
  static final int P_TWO = 1;
  static final int P_THREE = 2;
  static final int P_FOUR = 3;
  static final int P_FIVE = 4;

  Crop(PVector pos, Tile tile) {
    this.pos = pos;
    placedTile = tile;
    dim = new PVector(50, 50);
    growPeriod = P_ONE;
    growTimer = 0;
    growSpeedDry = 1;
    growSpeedFertilized = 1;
    growSpeed = 1;
    canHarvest = false;
  }

  void update() {
    //mouseHover();
    drawMe();
    changePeriod();
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    switch (growPeriod) {
    case P_ONE:
      image(cropImages[P_ONE], -dim.x/2, -dim.y/2);
      break;
    case P_TWO:
      image(cropImages[P_TWO], -dim.x/2, -dim.y/2);
      break;
    case P_THREE:
      image(cropImages[P_THREE], -dim.x/2, -dim.y/2);
      break;
    case P_FOUR:
      image(cropImages[P_FOUR], -dim.x/2, -dim.y/2);
      break;
    case P_FIVE:
      image(cropImages[P_FIVE], -dim.x/2, -dim.y/2);
      break;
    }
    popMatrix();
  }

  void changePeriod() {
    if (growTimer < growTime) {
      growTimer += growSpeed * growSpeedDry * growSpeedFertilized;
      if (placedTile.moisture > 0) {
        growSpeedDry = 1;
        placedTile.moisture --;
      } else growSpeedDry = 0.5;
      
      if (placedTile.nutrient > 0){
        growSpeedFertilized = 2;
        placedTile.nutrient --;
      } else growSpeedFertilized = 1;
    }
    if (growTimer < growTime*0.25) growPeriod = P_ONE;
    else if (growTimer < growTime*0.5) growPeriod = P_TWO;
    else if (growTimer < growTime*0.75) growPeriod = P_THREE;
    else if (growTimer < growTime) growPeriod = P_FOUR;
    else {
      growPeriod = P_FIVE;
      canHarvest = true;
    }
    //println(growTimer);
  }

  void mouseHover() {
    if (abs(mouseX-pos.x-dim.x/2) < dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2) {
      pushMatrix();
      translate(pos.x-dim.x*2-dim.x/2, pos.y-dim.y/2);
      pushStyle();
      noStroke();
      fill(200, 200, 200, 100);
      rect(0, 0, dim.x*2, dim.y*2);
      pushStyle();
      fill(0);
      textFont(tomorrowNight_8);
      text("Name: " + cropName, 10, 10);
      if (canHarvest) text("Harvest: Yes", 10, 30);
      else text("Harvest: No", 10, 30);
      text("Gowing: " + (int)(growTimer/60) + "/" + (int)(growTime/60), 10, 50);
      text("Fertilizer: " + (int)(placedTile.nutrient/60), 10, 70);
      if (placedTile.moisture > 0) text("soil: Moist", 10, 90);
      else text("soil: Dry", 10, 90);
      
      popStyle();
      popStyle();
      popMatrix();
      if (mouseClicked && mouseButton == LEFT && canHarvest && gameUI.grabItem == UISystem.grabEmpty) {
        gameUI.playerExp += cropExp;
        placedTile.empty = true;
        playAudio(EXP);
        crops.remove(this);
      }
      if (mouseClicked && mouseButton == LEFT && gameUI.grabItem == UISystem.grabShovel) {
        placedTile.empty = true;
        playAudio(SHOVEL);
        crops.remove(this);
      }
    }
  }
}
