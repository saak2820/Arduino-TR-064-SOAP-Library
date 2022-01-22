#!/bin/bash
all: caller home-indicator
EXAMPLS_DIR := ./examples
CALLER := $(EXAMPLS_DIR)/caller/arduino_secrets.h
HOME := $(EXAMPLS_DIR)/home-indicator/arduino_secrets.h

caller:
	@echo "Generating $(CALLER)"
	@echo "#define SECRET_WIFI_SSID \"$(SECRET_WIFI_SSID)\" // Wifi network name (SSID)" >> $(CALLER)
	@echo "\n#define SECRET_WIFI_PASSWORD \"$(SECRET_WIFI_PASSWORD)\" //Das Passwort Ihres WLANs" >> $(CALLER)
	@echo "\n//Der Benutzername für Ihre Fritzbox. Wenn Sie keine separaten Benutzer angelegt haben, lautet dieser \"admin\"." >> $(CALLER)
	@echo "#define SECRET_FUSER \"$(SECRET_FUSER)\"" >> $(CALLER)
	@echo "\n//Das Passwort für Ihre Fritzbox" >> $(CALLER)
	@echo "#define SECRET_PASS \"$(SECRET_FPASS)\"" >> $(CALLER)
	@echo "\n//Die IP-Adresse Ihrer Fritzbox. Ab Werk lautet diese 192.168.178.1." >> $(CALLER)
	@echo "#define SECRET_IP \"$(SECRET_IP)\"" >> $(CALLER)	
	
home-indicator:
	@echo "Generating $(HOME)"
	@echo "#define SECRET_WIFI_SSID \"$(SECRET_WIFI_SSID)\" // Wifi network name (SSID)" >> $(HOME)
	@echo "\n#define SECRET_WIFI_PASSWORD \"$(SECRET_WIFI_PASSWORD)\" //Das Passwort Ihres WLANs" >> $(HOME)
	@echo "\n//Der Benutzername für Ihre Fritzbox. Wenn Sie keine separaten Benutzer angelegt haben, lautet dieser \"admin\"." >> $(CALLER)
	@echo "#define SECRET_FUSER \"$(SECRET_FUSER)\"" >> $(HOME)
	@echo "\n//Das Passwort für Ihre Fritzbox" >> $(HOME)
	@echo "#define SECRET_PASS \"$(SECRET_FPASS)\"" >> $(HOME)
	@echo "\n//Die IP-Adresse Ihrer Fritzbox. Ab Werk lautet diese 192.168.178.1." >> $(HOME)
	@echo "#define SECRET_IP \"$(SECRET_IP)\"" >> $(HOME)	