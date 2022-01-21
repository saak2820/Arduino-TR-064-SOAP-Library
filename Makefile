#!/bin/bash

ROOT := $(shell pwd)
AGENT := $(ROOT)/agent
OUTPUT = "arduino_secrets.h"

arduino_secrets:
	@echo "Generating $(CURDIR) $(OUTPUT)"
	@echo "#define SECRET_WIFI_SSID \"$(SECRET_WIFI_SSID)\" // Wifi network name (SSID)" >> $(OUTPUT)
	@echo "\n#define SECRET_WIFI_PASSWORD \"$(SECRET_WIFI_PASSWORD)\" //Das Passwort Ihres WLANs" >> $(OUTPUT)
	@echo "\n//Der Benutzername für Ihre Fritzbox. Wenn Sie keine separaten Benutzer angelegt haben, lautet dieser \"admin\"." >> $(OUTPUT)
	@echo "#define SECRET_FUSER \"$(SECRET_FUSER)\"" >> $(OUTPUT)
	@echo "\n//Das Passwort für Ihre Fritzbox" >> $(OUTPUT)
	@echo "#define SECRET_PASS \"$(SECRET_FPASS)\"" >> $(OUTPUT)
	@echo "\n//Die IP-Adresse Ihrer Fritzbox. Ab Werk lautet diese 192.168.178.1." >> $(OUTPUT)
	@echo "#define SECRET_IP \"$(SECRET_IP)\"" >> $(OUTPUT)