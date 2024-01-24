#include "wifi.h"

// Wifi credentials
const char *ssidd = "SSID of your network";
const char *passwordd = "your wifi password";

// Setup wifi
void setupWifii()
{
  // Connect to wifi
  WiFi.begin(ssidd, passwordd);
 
  // Wait for connection
  while (WiFi.status() != WL_CONNECTED)
  {
    // Wait 1 second
    delay(1000);
    Serial.println("*");
  }
  delay(1000);

 
};