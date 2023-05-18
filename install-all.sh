#!/usr/bin/env bash
#EricServic.es Install All Acript
#
#################################################
# Version 1.0.1
#################################################


#################
# Define Colors #
#################
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}EricServic.es Install-All Script${ENDCOLOR}"

echo -e "${BLUE} ______      _       _____                 _                   ${ENDCOLOR}"  
echo -e "${BLUE}|  ____|    (_)     / ____|               (_)                  ${ENDCOLOR}"
echo -e "${BLUE}| |__   _ __ _  ___| (___   ___ _ ____   ___  ___   ___  ___   ${ENDCOLOR}"
echo -e "${BLUE}|  __| | '__| |/ __|\___ \ / _ \ '__\ \ / / |/ __| / _ \/ __|  ${ENDCOLOR}"
echo -e "${BLUE}| |____| |  | | (__ ____) |  __/ |   \ V /| | (__ |  __/\__ \  ${ENDCOLOR}"
echo -e "${BLUE}|______|_|  |_|\___|_____/ \___|_|    \_/ |_|\___(_)___||___/\n${ENDCOLOR}"

echo -e "${GREEN}Running all scripts.\n${ENDCOLOR}"
sleep 1

sh https://github.com/EricServices-Repo/Install-Scripts/blob/c6e82eb93cdacefbb31799e987cc3d5fbe64f1e5/rockylinux-repo.sh
