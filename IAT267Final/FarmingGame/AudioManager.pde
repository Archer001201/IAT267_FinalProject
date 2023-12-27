Minim minim;

AudioPlayer clickAudio, applySeed, expGained, fertilizerUse, levelUp, purchase, shovelUse, watering, bgm, withdrawAudio;

final String CLICK_AUDIO = "click.wav";
final String SEED = "seed.mp3";
final String EXP = "expgained.wav";
final String FERTILIZER = "fertilizer.mp3";
final String LEVELUP = "levelup.wav";
final String PURCHASE = "purchase.wav";
final String SHOVEL = "shovel.mp3";
final String WATERING = "watering.mp3";
final String BGM = "bgm_2.mp3";
final String WITHDRAW = "withdraw.wav";

void audioSetup() {
  minim = new Minim(this);
  clickAudio = minim.loadFile(CLICK_AUDIO);
  applySeed = minim.loadFile(SEED);
  expGained = minim.loadFile(EXP);
  fertilizerUse = minim.loadFile(FERTILIZER);
  levelUp = minim.loadFile(LEVELUP);
  purchase = minim.loadFile(PURCHASE);
  shovelUse = minim.loadFile(SHOVEL);
  watering = minim.loadFile(WATERING);
  bgm = minim.loadFile(BGM);
  withdrawAudio = minim.loadFile(WITHDRAW);
}

void playAudio(String file) {
  AudioPlayer audio = null;
  switch(file) {
  case CLICK_AUDIO:
    audio = clickAudio;
    break;
  case SEED:
    audio = applySeed;
    break;
  case EXP:
    audio = expGained;
    break;
  case FERTILIZER:
    audio = fertilizerUse;
    break;
  case LEVELUP:
    audio = levelUp;
    break;
  case PURCHASE:
    audio = purchase;
    break;
  case SHOVEL:
    audio = shovelUse;
    break;
  case WATERING:
    audio = watering;
    break;
  case WITHDRAW:
    audio = withdrawAudio;
    break;
  default:
    println("Error: Invalid file name " + file);
    return;
  }
  audio.play(0);
}
