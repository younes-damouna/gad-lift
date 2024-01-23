#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>
// #include <ESP8266WiFi.h>

void liftUp(WiFiClient client){
    HTTPClient http;
    StaticJsonDocument<200> req;

    String json;
    serializeJson(req, json);
    http.begin(client,"http://192.168.0.107:3000/users");
    http.addHeader("Content-Type", "application/json");
    http.addHeader("", "");
    http.GET();
      String response = http.getString();
         deserializeJson(req, response);
         Serial.println(response);
}