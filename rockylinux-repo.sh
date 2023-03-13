
#!/usr/bin/env bash
#EricServic.es Rocky Linux Repository Install
#
#################################################
# Version 1.0.1
# - Checks if Repository exists
# - Creates Repository
# - Checks if old repository is there, deletes
# - Moves repository to .old
# - Runs yum update
#################################################


#################
# Define Colors #
#################
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

echo -e "${GREEN}EricServic.es Rocky Linux Repository${ENDCOLOR}"

echo -e "${BLUE} ______      _       _____                 _                   ${ENDCOLOR}"  
echo -e "${BLUE}|  ____|    (_)     / ____|               (_)                  ${ENDCOLOR}"
echo -e "${BLUE}| |__   _ __ _  ___| (___   ___ _ ____   ___  ___   ___  ___   ${ENDCOLOR}"
echo -e "${BLUE}|  __| | '__| |/ __|\___ \ / _ \ '__\ \ / / |/ __| / _ \/ __|  ${ENDCOLOR}"
echo -e "${BLUE}| |____| |  | | (__ ____) |  __/ |   \ V /| | (__ |  __/\__ \  ${ENDCOLOR}"
echo -e "${BLUE}|______|_|  |_|\___|_____/ \___|_|    \_/ |_|\___(_)___||___/\n${ENDCOLOR}"

echo -e "${GREEN}Configure the EricServic.es Local Repository.\n${ENDCOLOR}"
sleep 1


#####################
# Create Repository #
#####################
LOCALREPO_FILE=/etc/yum.repos.d/localrepo.repo
if test -f "$LOCALREPO_FILE"; then
    echo -e "$LOCALREPO_FILE already exists, no need to create.\n"
fi

if [ ! -f "$LOCALREPO_FILE" ]
then 
	echo -e "$LOCALREPO_FILE does not exist, creating it.\n"
cat << EOF >> /etc/yum.repos.d/localrepo.repo
[localrepo-base]
name= Local RockyLinux BaseOS
baseurl=http://mirror.ericembling.me/rocky-linux/\$releasever/BaseOS/\$basearch/os/
gpgcheck=0
enabled=1
[localrepo-appstream]
name=Local RockyLinux AppStream
baseurl=http://mirror.ericembling.me/rocky-linux/\$releasever/AppStream/\$basearch/os/
gpgcheck=0
enabled=1
EOF
fi


###################
# Old Repo Moving #
###################
echo -e "${GREEN}Move old Rocky Linux Repos so they are not used.\n${ENDCOLOR}"
sleep 1

ROCKYBASEOS_FILE=/etc/yum.repos.d/Rocky-BaseOS.repo.old
if test -f "$ROCKYBASEOS_FILE"; then
    echo -e "ROCKYBASEOS_FILE already exists, need to delete.\n"
    rm /etc/yum.repos.d/Rocky-BaseOS.repo.old
fi

if [ ! -f "$ROCKYBASEOS_FILE" ]
then 
echo -e "ROCKYBASEOS_FILE moved to .old repository.\n"
mv /etc/yum.repos.d/Rocky-BaseOS.repo /etc/yum.repos.d/Rocky-BaseOS.repo.old
fi


ROCKYAPPSTREAM_FILE=/etc/yum.repos.d/Rocky-AppStream.repo.old
if test -f "$ROCKYAPPSTREAM_FILE"; then
    echo -e "ROCKYAPPSTREAM_FILE already exists, need to delete.\n"
    rm /etc/yum.repos.d/Rocky-AppStream.repo.old
fi

if [ ! -f "$ROCKYAPPSTREAM_FILE" ]
then 
echo -e "ROCKYAPPSTREAM_FILE moved to .old repository.\n"
mv /etc/yum.repos.d/Rocky-AppStream.repo /etc/yum.repos.d/Rocky-AppStream.repo.old
fi


yum update -y

echo -e "${GREEN}Completed EricServic.es Local Rocky Linux Repository install.${ENDCOLOR}"
