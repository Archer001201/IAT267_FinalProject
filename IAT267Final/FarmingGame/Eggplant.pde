class Eggplant extends Crop{
 
  Eggplant(PVector pos, Tile tile){
    super(pos, tile);
    for (int i=1; i<6; i++){
      cropImages[i-1] = loadImage("eggplant_" + i + ".png");
    }
    cropName = "Eggplant";
    growTime = 3600;
    cropExp = 75;
  }
}
