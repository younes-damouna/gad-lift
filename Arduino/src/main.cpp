#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include "wifi/wifi.h"
#include <Servo.h>

// d2 pin
int ENA = 4;
// d3 pin
int IN1 = 0;
// d4 pin
int IN2 = 2;
Servo servo;
ESP8266WebServer server(80);

void handleLedOn()
{
    // Your logic to handle LED ON
    digitalWrite(LED_BUILTIN, HIGH);
    server.send(200, "text/plain", "LED turned ON");
}

void handleLedOff()
{
    // Your logic to handle LED OFF
    digitalWrite(LED_BUILTIN, LOW);
    server.send(200, "text/plain", "LED turned OFF");
}
void handleBoxDown()
{
    Serial.println("Box Down");
}
void handleBoxUp()
{

    Serial.println("Box Up");
    analogWrite(ENA, 150);
    digitalWrite(IN1, HIGH);
    delay(300);

    digitalWrite(IN2, LOW);

    digitalWrite(IN1, LOW);
}

void setup()
{
    servo.attach(14);
    pinMode(ENA, OUTPUT);
    pinMode(IN1, OUTPUT);
    pinMode(IN2, OUTPUT);
    servo.write(0);
    Serial.begin(115200);

    setupWifi();

    server.on("/led/on", HTTP_GET, handleLedOn);
    server.on("/led/off", HTTP_GET, handleLedOff);

    server.begin();
    Serial.println("HTTP server started");
}

void loop()
{
    server.handleClient();
}
