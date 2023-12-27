class Button {
  PVector pos, dim;
  PImage buttonImage;

  Button(PVector pos) {
    this.pos = pos;
    dim = new PVector(50, 50);
  }

  void update() {
    drawMe();
    mouseHover();
    buttonClicked();
  }

  void update(Textfield f1, Textfield f2) {
    drawMe();
    mouseHover();
    buttonClicked(f1,f2);
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x+dim.x/2, pos.y+dim.y/2);
    image(buttonImage, -dim.x/2, -dim.y/2);
    popMatrix();
  }

  void mouseHover() {
    if (abs(mouseX-pos.x-dim.x/2)<dim.x/2 && abs(mouseY-pos.y-dim.y/2)<dim.y/2) {
      pushStyle();
      noFill();
      stroke(255, 0, 0);
      rect(pos.x, pos.y, dim.x, dim.y);
      popStyle();
    }
  }

  void buttonClicked() {
  }
  
  void buttonClicked(Textfield f1, Textfield f2) {
  }
}
