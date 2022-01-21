#!/bin/bash

OUTPUT = "arduino_secrets.h"

arduino_secrets:
    @echo "Generating $(OUTPUT)"
    @[ -e $(OUTPUT) ] && rm $(OUTPUT)
    @echo "#define SECRET_WIFI_SSID \"$(SECRET_WIFI_SSID)\"" >> $(OUTPUT)
    @echo "#define SECRET_WIFI_PASSWORD \"$(SECRET_WIFI_PASSWORD)\"" >> $(OUTPUT)
	@echo "#define SECRET_FUSER \"$(SECRET_FUSER)\"" >> $(OUTPUT)
    @echo "#define SECRET_PASS \"$(SECRET_FPASS)\"" >> $(OUTPUT)
    @echo "#define SECRET_IP \"$(SECRET_IP)\"" >> $(OUTPUT)
    