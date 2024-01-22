#include <Arduino.h>
#include "./wifi/wifi.h"
#include <Servo.h>
// #include <ESP8266WebServer.h>

#include <ArduinoJson.h>

// d1 pin
#define RED_LED 5
// d2 pin
int ENA = 4;
// d3 pin
int IN1 = 0;
// d4 pin
int IN2 = 2;
Servo servo;
WiFiServer server(80);
String header;
String LED1State = "off";
const int LED1 = IN1;

void setup()
{
  servo.attach(14);
  servo.write(0);
  delay(2000);
  //  Begin Serial
  pinMode(RED_LED, OUTPUT);
  // set all the motor control pins to outputs

  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  analogWrite(ENA, 250); // set speed to 200 out of possible range 0~255
                         // digitalWrite(Do,HIGH);
  Serial.begin(115200);
  //Connect to wifi
  setupWifi();
  // Check if wifi is connected
  if (WiFi.status() == WL_CONNECTED)
  {

    server.begin();
    // server.on("/status", HTTP_GET, sendData);
  }
  else
  {
    delay(1000);
    Serial.println(2);
    Serial.println("Error in WiFi connection");
  }
}
void testOne()
{

  // turn on motor
  delay(2000); // now change motor directions

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
void loop()
{
  //   servo.write(90);
  // delay(1000);
  // servo.write(0);
  // delay(1000);
  WiFiClient client = server.available();
  header = client.readStringUntil('\r');
  if (client)
  {

    Serial.println("new client connected");
    String currentLine = "";
    client.println("HTTP/1.1 200 OK");
    client.println("Content-type:text/html");
    client.println("Connection: close");
    client.println();
    if (header.indexOf("GET /LED1/on") >= 0)
    {
      analogWrite(ENA, 150);
      Serial.println("LED1 on");
      LED1State = "on";
      digitalWrite(LED1, HIGH);
      delay(300);
      LED1State = "off";
      digitalWrite(IN2, LOW);

      digitalWrite(LED1, LOW);
    }
    else if (header.indexOf("GET /LED1/off") >= 0)
    { // set speed to 200 out of possible range 0~255
      analogWrite(ENA, 255);
      Serial.println("LED1 off");
      LED1State = "off";
      digitalWrite(LED1, LOW);

      digitalWrite(IN2, HIGH);
      delay(600);
      digitalWrite(IN2, LOW);
    }
    else if (header.indexOf("GET /box/on") >= 0)
    {
      Serial.println("LED1 on");
      LED1State = "on";
      servo.write(90);
    }
    else if (header.indexOf("GET /box/off") >= 0)
    {
      Serial.println("LED1 on");
      LED1State = "on";
      servo.write(0);
    }
    client.println("<!DOCTYPE html><html>");
    client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
    client.println("<link rel=\"icon\" href=\"data:,\">");
    client.println("<style>html { font-family: Cairo; display: inline; margin: 0px auto; text-align: center; background-color: #ccffb3;}");
    client.println(".button { background-color: #006699; border: none; color: white; padding: 16px 40px;");
    client.println("text-decoration: none; font-size: 35px; margin: 2px; cursor: pointer;}");
    client.println(".button2 {background-color: #555555;}</style></head>");
    client.println("<body>"); // Webpage heading name
    // client.println("<p>LED1_State: " + LED1State + "</p>");
    if (LED1State == "off")
    {
      client.println("<p><a href=\"/LED1/on\"><button class=\"button\">UP</button></a></p>");
      client.println("<p><a href=\"/LED1/off\"><button class=\"button\">Down</button></a></p>");
      client.println("<p><a href=\"/box/off\"><button class=\"button\">Close</button></a></p>");
      client.println("<p><a href=\"/box/on\"><button class=\"button\">Open</button></a></p>");

      client.println("</body></html>");
      client.println();
    }
    // delay(1000);
    // digitalWrite(RED_LED,HIGH);

    // delay(1000);
    //  digitalWrite(RED_LED,LOW);
    // delay(1000);
    // testOne();
    // 	delay(1000);

    // put your main code here, to run repeatedly:
  }
}
void sendData()
{
  StaticJsonDocument<300> JSONData;
  // Use the object just like a javascript object or a python dictionary
  JSONData["key"] = "Value";
  // You can add more fields
  char data[300];
  // Converts the JSON object to String and stores it in data variable
  serializeJson(JSONData, data);
  // Set status code as 200, content type as application/json and send the data
  server.send(200, "application/json", data);
}