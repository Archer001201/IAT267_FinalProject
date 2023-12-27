int mousePressedCounter = 0;
boolean mouseClicked = false;

void mouseReleased() {
  mousePressedCounter = 0;
}

void clicked() {
  if (mousePressed) mousePressedCounter ++;
  if (mousePressedCounter == 1){
    mouseClicked = true;
    playAudio(CLICK_AUDIO);
  }
  else mouseClicked = false;
}
