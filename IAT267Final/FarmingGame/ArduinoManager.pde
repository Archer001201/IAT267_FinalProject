void arduinoBegin() {
  //communicate with arduino
  printArray(Serial.list());
  port = new Serial(this, Serial.list()[1], 9600);
}

void arduinoRead() {
  while (port.available() > 0) {
    byte[] inByte = port.readBytesUntil('\n');
    if (inByte != null) {
      String inData = new String(inByte);
      inData = trim(inData);
      String[] list = splitTokens(inData, "$");
      if (list.length >= 1) {
        float dollor = float(list[0]);
        gameUI.balance += dollor;
        gameUI.coinAmount += dollor*100;
        println(dollor);
      }
    }
  }
}

void arduinoWrite(String message){
  if (message.equals("unlock")) port.write(150);
  if (message.equals("lock")) port.write(60);
}
