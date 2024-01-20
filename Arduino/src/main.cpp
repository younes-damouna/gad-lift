#include <Arduino.h>

// put function declarations here:
int myFunction(int, int);

void setup() {
  // put your setup code here, to run once:
  int result = myFunction(2, 3);
}

void loop() {
  // put your main code here, to run repeatedly:
}

// put function definitions here:
int myFunction(int x, int y) {
  return x + y;
}
// 
// {
//     "configurations": [
//         {
//             "name": "Win32",
//             "includePath": [
//                 "${workspaceFolder}/**"
//             ],
//             "defines": [
//                 "_DEBUG",
//                 "UNICODE",
//                 "_UNICODE"
//             ]
//         }
//     ],
//     "version": 4
// }