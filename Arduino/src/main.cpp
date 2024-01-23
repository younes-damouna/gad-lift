#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include "wifi/wifi.h"
#include <Servo.h>

// d1 pin
#define RED_LED 5
// d2 pin
int ENA = 4;
// d3 pin
int IN1 = 0;
// d4 pin
int IN2 = 2;
Servo servo;
ESP8266WebServer server(80);
void blinkLed()
{
    digitalWrite(RED_LED, HIGH);
    delay(100);
    digitalWrite(RED_LED, LOW);
}

void handleBoxOpen()
{
    Serial.println("Box Open");
    // blinkLed();
    servo.write(90);
    server.send(200, "text/plain", "Box Open");
}

void handleBoxClose()
{
    Serial.println("Box Closed");
    // blinkLed();
    servo.write(0);
    server.send(200, "text/plain", "Box Closed");
}
void handleBoxUp()
{
    Serial.println("Box Down");
    analogWrite(ENA, 255);

    digitalWrite(IN1, LOW);
    // blinkLed();
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
    // blinkLed();
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
    pinMode(RED_LED, OUTPUT);
    servo.write(0);
    Serial.begin(115200);

    setupWifi();
    // Display IP address
    if (WiFi.status() == WL_CONNECTED)
    {
        digitalWrite(RED_LED, HIGH);

        Serial.println("Connected to " + (WiFi.localIP()).toString());
    }

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
