#!/bin/bash

OUTPUT = "arduino_secrets.h"

arduino_secrets:
	@echo "Generating $(OUTPUT)"
	@[ -e $(OUTPUT) ] && rm $(OUTPUT)
	@echo "#define SECRET_WIFI_SSID \"$(SECRET_WIFI_SSID)\" // Wifi network name (SSID)" >> $(OUTPUT)
	@echo "#define SECRET_WIFI_PASSWORD \"$(SECRET_WIFI_PASSWORD)\" //Das Passwort Ihres WLANs" >> $(OUTPUT)
	@echo "//Der Benutzername für Ihre Fritzbox. Wenn Sie keine separaten Benutzer angelegt haben, lautet dieser \"admin\"."
	@echo "#define SECRET_FUSER \"$(SECRET_FUSER)\"" >> $(OUTPUT)
	@echo " //Das Passwort für Ihre Fritzbox"
	@echo "#define SECRET_PASS \"$(SECRET_FPASS)\"" >> $(OUTPUT)
	@echo "//Die IP-Adresse Ihrer Fritzbox. Ab Werk lautet diese 192.168.178.1."
	@echo "#define SECRET_IP \"$(SECRET_IP)\"" >> $(OUTPUT)
