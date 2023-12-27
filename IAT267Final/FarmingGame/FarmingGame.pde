import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import controlP5.*;
import processing.serial.*;

Serial port;

File file;

PApplet farmingGame = this;

void setup() {
  size(1280, 720);

  //setup aruidno
  //arduinoBegin();

  //setup game
  awake();

  //check data file
  file = new File(dataPath("gameData.csv"));
  checkData();
}

void draw() {
  //arduinoRead();

  //update game scene
  update();
  clicked();
}
