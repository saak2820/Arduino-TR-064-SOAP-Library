#include "arduino_secrets.h"
/**
 * caller.ino
 *  based on
 * 		Oliver-André Urban
 *   		based on
 *    	home-indicator.ino
 *      by René Vollmer
 * 
 *  Example code for placing internal DECT phone calls
 *  Without calling for init.
 *  No Services will beloaded.
 * 
 *  Please adjust your data below.
 *  
 *  created on: 17.06.2021
 *  latest update: 17.06.2021
 */

#include <Arduino.h>
#if defined(ESP8266)
	//Imports for ESP8266
	#include <ESP8266WiFi.h>
	#include <ESP8266WiFiMulti.h>
	#include <ESP8266HTTPClient.h>
	ESP8266WiFiMulti WiFiMulti;
#elif defined(ESP32)
	//Imports for ESP32
	#include <WiFi.h>
	#include <WiFiMulti.h>
	#include <HTTPClient.h>
	WiFiMulti WiFiMulti;
#endif

#include <tr064.h>


// Flash BUTTON - you can connect a separate button to this pin or an opto-coupler 
// for example: use a resistor and an opto-coupler to connect to a doorbell
#define BUTTON 0


//-------------------------------------------------------------------------------------
// Put your router settings here
//-------------------------------------------------------------------------------------

///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char wifi_ssid[] = SECRET_WIFI_SSID;
char wifi_password[] = SECRET_WIFI_PASSWORD;

char fuser[] = SECRET_FUSER;
char fpass[] = SECRET_FPASS;

char IP[] = SECRET_IP;
int PORT = 49000;

// -------------------------------------------------------------------------------------

// TR-064 connection
TR064 connection(PORT, IP, fuser, fpass);


void setup() {
	Serial.begin(115200);
	// Wait a few secs for warm-up (dunno why, was in the default code for http connections).
	delay(5000);

	// Connect to wifi
	ensureWIFIConnection();
  
  //activate for Debug Output
  //connection.debug_level = connection.DEBUG_VERBOSE;
	
	// dont need init if you know the url
	//connection.init();
	// Port as input
	pinMode(BUTTON, INPUT);
}

void loop() {
	int button_state = digitalRead(BUTTON);
	if (digitalRead(BUTTON) == LOW) {
		if (Serial) {
			Serial.println();
			Serial.printf("Button pressed");
		}
		callWahlhilfe();
		// callDect();
		// char* status=getStatus();
		delay(20000);
	} else {	
	}
}


void callWahlhilfe() {
	ensureWIFIConnection();

  if(connection.state()<0){
    connection.init();
  }
	String params[][2] = {{"NewX_AVM-DE_PhoneNumber", "**799"}};
	String req[][2] = {{}};
    connection.action("X_VoIP:1", "X_AVM-DE_DialNumber", params, 1, req, 0, "/upnp/control/x_voip");
}

void callDect() {
	ensureWIFIConnection();

	String params[][2] = {{"NewAIN", "12345 0123456"}, {"NewSwitchState", "TOGGLE"}};
	connection.action("X_AVM-DE_Homeauto:1", "SetSwitch", params, 2, "/upnp/control/x_homeauto"); 
}

String getStatus() {
	String paramsb[][2] = {{"NewAIN", "12345 0123456"}};
	String reqb[][2] = {{"NewDeviceId", ""}, {"NewSwitchState", ""}};
    connection.action("X_AVM-DE_Homeauto:1", "GetSpecificDeviceInfos", paramsb, 1, reqb, 2, "/upnp/control/x_homeauto");	
	return reqb[1][1];
}


/**
 * Makes sure there is a WIFI connection and waits until it is (re-)established.
 */
void ensureWIFIConnection() {
	if ((WiFiMulti.run() != WL_CONNECTED)) {
		WiFiMulti.addAP(wifi_ssid, wifi_password);
		while ((WiFiMulti.run() != WL_CONNECTED)) {
			delay(100);
		}
	}
}
