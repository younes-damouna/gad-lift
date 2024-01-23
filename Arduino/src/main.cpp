#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include "wifi/wifi.h"



ESP8266WebServer server(80);

void handleLedOn() {
  // Your logic to handle LED ON
  digitalWrite(LED_BUILTIN, HIGH);
  server.send(200, "text/plain", "LED turned ON");
}

void handleLedOff() {
  // Your logic to handle LED OFF
  digitalWrite(LED_BUILTIN, LOW);
  server.send(200, "text/plain", "LED turned OFF");
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);

    setupWifi();

  server.on("/led/on", HTTP_GET, handleLedOn);
  server.on("/led/off", HTTP_GET, handleLedOff);

  server.begin();
  Serial.println("HTTP server started");
}

void loop() {
  server.handleClient();
}
