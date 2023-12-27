#include <Servo.h>

Servo myServo;

const int IR_PIN_1 = 6;
const int IR_PIN_2 = 5;
const int IR_PIN_3 = 4;
const int IR_PIN_4 = 3;
const int IR_PIN_5 = 2;

unsigned long lastTriggerTime = 0;
unsigned long debounceDelay = 200;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(IR_PIN_1, INPUT);
  pinMode(IR_PIN_2, INPUT);
  pinMode(IR_PIN_3, INPUT);
  pinMode(IR_PIN_4, INPUT);
  pinMode(IR_PIN_5, INPUT);

  myServo.attach(9);

  // pinMode(trigPin, OUTPUT);
  // pinMode(echoPin, INPUT);
}

void loop() {
  // // put your main code here, to run repeatedly:
  // if (digitalRead(IR_PIN_1) == LOW) {
  //   unsigned long currentMillis = millis();
  //   if (currentMillis - lastTriggerTime > debounceDelay) {
  //     lastTriggerTime = currentMillis;
  //     Serial.println("$2");
  //   }
  // }

  // if (digitalRead(IR_PIN_2) == LOW) {
  //   unsigned long currentMillis = millis();
  //   if (currentMillis - lastTriggerTime > debounceDelay) {
  //     lastTriggerTime = currentMillis;
  //     Serial.println("$1");
  //   }
  // }
  // if (digitalRead(IR_PIN_3) == LOW) {
  //   unsigned long currentMillis = millis();
  //   if (currentMillis - lastTriggerTime > debounceDelay) {
  //     lastTriggerTime = currentMillis;
  //     Serial.println("$0.25");
  //   }
  // }
  // if (digitalRead(IR_PIN_4) == LOW) {
  //   unsigned long currentMillis = millis();
  //   if (currentMillis - lastTriggerTime > debounceDelay) {
  //     lastTriggerTime = currentMillis;
  //     Serial.println("$0.05");
  //   }
  // }
  // if (digitalRead(IR_PIN_5) == LOW) {
  //   unsigned long currentMillis = millis();
  //   if (currentMillis - lastTriggerTime > debounceDelay) {
  //     lastTriggerTime = currentMillis;
  //     Serial.println("$0.1");
  //   }
  // }

  // if (Serial.available()) {
  //   myServo.write(Serial.read());
  // }

  myServo.write(180);
  delay(500);
  myServo.write(0);
  delay(500);

  // delay(50);
}
