class Pumpkin extends Crop{
 
  Pumpkin(PVector pos, Tile tile){
    super(pos, tile);
    for (int i=1; i<6; i++){
      cropImages[i-1] = loadImage("pumpkin_" + i + ".png");
    }
    cropName = "Pumpkin";
    growTime = 5400;
    cropExp = 100;
  }
}
