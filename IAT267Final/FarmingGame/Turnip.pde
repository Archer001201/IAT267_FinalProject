class Turnip extends Crop{
 
  Turnip(PVector pos, Tile tile){
    super(pos, tile);
    for (int i=1; i<6; i++){
      cropImages[i-1] = loadImage("turnip_" + i + ".png");
    }
    cropName = "Turnip";
    growTime = 1800;
    cropExp = 50;
  }
}
