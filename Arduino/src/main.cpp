#include <Arduino.h>
#include "./wifi/wifi.h"
// d1 pin
#define RED_LED 5
// d2 pin
int ENA = 4;
// d3 pin
int IN1 = 0;
// d4 pin
int IN2 = 2;
WiFiServer server(80);
String header;
String LED1State = "off";
const int LED1 = IN1;
void setup()
{
  //  Begin Serial
  pinMode(RED_LED, OUTPUT);
  // set all the motor control pins to outputs

  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  analogWrite(ENA, 250); // set speed to 200 out of possible range 0~255

  Serial.begin(9600);
  // //Connect to wifi
  setupWifi();
  // Check if wifi is connected
  if (WiFi.status() == WL_CONNECTED)
  {

    server.begin();
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
  WiFiClient client = server.available();
  header=client.readStringUntil('\r');
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
      Serial.println("LED1 on");
      LED1State = "on";
      digitalWrite(LED1, HIGH);
      delay(630);
       LED1State = "off";
             digitalWrite(IN2, LOW);

      digitalWrite(LED1, LOW);
    }
    else if (header.indexOf("GET /LED1/off") >= 0)
    {
      Serial.println("LED1 off");
      LED1State = "off";
            digitalWrite(LED1, LOW);

      digitalWrite(IN2, HIGH);
       delay(600);
             digitalWrite(IN2, LOW);

    }
    client.println("<!DOCTYPE html><html>");
    client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
    client.println("<link rel=\"icon\" href=\"data:,\">");
    client.println("<style>html { font-family: Cairo; display: inline; margin: 0px auto; text-align: center; background-color: #ccffb3;}");
    client.println(".button { background-color: #006699; border: none; color: white; padding: 16px 40px;");
    client.println("text-decoration: none; font-size: 35px; margin: 2px; cursor: pointer;}");
    client.println(".button2 {background-color: #555555;}</style></head>");
    client.println("<svg width=\"300\" height=\"80\"><text fill=\"#00bfbf\" font-family=\"serif\" font-size=\"24\" id=\"svg_1\" stroke=\"#000000\" text-anchor=\"middle\" transform=\"matrix(1.35388 0 0 1.42308 -6.66283 -8.67308)\" x=\"86.5\" xml:space=\"preserve\" y=\"41.5\">Circuit Digest</text></svg>");
    client.println("<body><h1>Welcome to ESP12e Web Server</h1>"); // Webpage heading name
    client.println("<p>LED1_State: " + LED1State + "</p>");
    if (LED1State == "off")
    {
      client.println("<p><a href=\"/LED1/on\"><button class=\"button\">ON</button></a></p>");
            client.println("<p><a href=\"/LED1/off\"><button class=\"button\">Off</button></a></p>");

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