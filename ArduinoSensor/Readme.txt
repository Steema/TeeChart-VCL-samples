Steema Software SL
https://www.steema.com

Example project. Retrieve data from Arduino.
===============================================

This project, built with Delphi Tokyo v10.2.3, TeeChart Pro and 
TurboPower Async Pro, retrieves and charts data from an Arduino 
device.

Code for the Arduino to work with this Delphi project:
=======================================================
void setup() {
  Serial.begin(9600); //Start the Serial connection
}
void loop() {
  if (Serial.available())
  {
    char startB = Serial.read(); //read input via serial port
    if (startB == 'g') //wait for call for data from Delphi app
    {
      double sensorValue = analogRead(A0);
      float piezoV = sensorValue / 1023.0 * 5.0; //contextualise data
      Serial.println(piezoV); //return data to Delphi app
    }
  }
}