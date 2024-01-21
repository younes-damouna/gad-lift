#include <Arduino.h>
#include "./wifi/wifi.h"

#define RED_LED 5
int ENA = 4;

int IN1 = 0;

int IN2 = 2;
void setup() {
  //  Begin Serial
     pinMode(RED_LED,OUTPUT);
     // set all the motor control pins to outputs

pinMode(ENA, OUTPUT);
pinMode(IN1, OUTPUT);
pinMode(IN2, OUTPUT);

  Serial.begin(9600);
  // //Connect to wifi
  setupWifi();

  //Check if wifi is connected
  // if (WiFi.status() == WL_CONNECTED) {
  //    delay(1000);
  //   Serial.println("Error in WiFi connection");
  //     Serial.println(1);
  //       digitalWrite(RED_LED,HIGH);

    
  // } else {
  //        delay(1000);
  // Serial.println(2);
  //   Serial.println("Error in WiFi connection");
  // }
}
void testOne() {

// turn on motor
delay(2000); // now change motor directions

analogWrite(ENA, 150); // set speed to 200 out of possible range 0~255
digitalWrite(IN1, HIGH);
digitalWrite(IN2, LOW);

delay(2000); // now change motor directions

digitalWrite(IN1, LOW);
digitalWrite(IN2, HIGH);

delay(2000); // now turn off motors

digitalWrite(IN1, LOW);
digitalWrite(IN2, LOW);
delay(2000); // now turn off motors

}
void loop() {  
  delay(1000);
  digitalWrite(RED_LED,HIGH);

delay(1000);
 digitalWrite(RED_LED,LOW);
// delay(1000);
// testOne();   
// 	delay(1000); 

  // put your main code here, to run repeatedly:
}

