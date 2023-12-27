class Watermelon extends Crop{
 
  Watermelon(PVector pos, Tile tile){
    super(pos, tile);
    for (int i=1; i<6; i++){
      cropImages[i-1] = loadImage("watermelon_" + i + ".png");
    }
    cropName = "Watermelon";
    growTime = 9000;
    cropExp = 150;
  }
}
