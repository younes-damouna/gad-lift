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

void handleBoxOpen()
{
    Serial.println("Box Open");

    servo.write(90);
    server.send(200, "text/plain", "Box Open");
}

void handleBoxClose()
{
    Serial.println("Box Closed");

    servo.write(0);
    server.send(200, "text/plain", "Box Closed");
}
void handleBoxUp()
{
    Serial.println("Box Down");
    analogWrite(ENA, 255);

    digitalWrite(IN1, LOW);

    digitalWrite(IN2, HIGH);
    delay(600);
    digitalWrite(IN2, LOW);
    server.send(200, "text/plain", "Box Down");
}
void handleBoxDown()
{
    Serial.println("Box Up");
    analogWrite(ENA, 255);
    digitalWrite(IN2, LOW);

    digitalWrite(IN1, HIGH);
    delay(300);
    digitalWrite(IN1, LOW);
    server.send(200, "text/plain", "Box Up");
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

    server.on("/box/open", HTTP_GET, handleBoxOpen);
    server.on("/box/close", HTTP_GET, handleBoxClose);
    server.on("/box/up", HTTP_GET, handleBoxUp);
    server.on("/box/down", HTTP_GET, handleBoxDown);

    server.begin();
    Serial.println("HTTP server started");
}

void loop()
{
    server.handleClient();
}
