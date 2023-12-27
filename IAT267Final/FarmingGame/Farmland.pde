class Farmland {
  PVector pos;
  ArrayList<Tile> tiles = new ArrayList<Tile>();

  Farmland(PVector pos) {
    this.pos = pos;
    tiles.add(new Tile(new PVector(0, 0)));
    tiles.add(new Tile(new PVector(100, 0)));
    tiles.add(new Tile(new PVector(200, 0)));
    tiles.add(new Tile(new PVector(300, 0)));
    tiles.add(new Tile(new PVector(0, 100)));
    tiles.add(new Tile(new PVector(100, 100)));
    tiles.add(new Tile(new PVector(200, 100)));
    tiles.add(new Tile(new PVector(300, 100)));
    tiles.add(new Tile(new PVector(0, 200)));
    tiles.add(new Tile(new PVector(100, 200)));
    tiles.add(new Tile(new PVector(200, 200)));
    tiles.add(new Tile(new PVector(300, 200)));
    tiles.add(new Tile(new PVector(0, 300)));
    tiles.add(new Tile(new PVector(100, 300)));
    tiles.add(new Tile(new PVector(200, 300)));
    tiles.add(new Tile(new PVector(300, 300)));
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    for (int i=0; i<tiles.size(); i++) {
      Tile t = tiles.get(i);
      t.update(pos);
    }
    popMatrix();
  }
}
