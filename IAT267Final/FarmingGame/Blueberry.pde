class Blueberry extends Crop{
 
  Blueberry(PVector pos, Tile tile){
    super(pos, tile);
    for (int i=1; i<6; i++){
      cropImages[i-1] = loadImage("blueberry_" + i + ".png");
    }
    cropName = "Blueberry";
    growTime = 7200;
    cropExp = 125;
  }
}
