#!/bin/sh
#The above line is to tell the system that its is a bash file so execute it as you do in a terminal
# The MONITOR will store the location of the File which is monitor is is store in the variable
MONITOR=~/Downloads/critical/lab1/note1.txt
# The BACKUP is a variable which will store the BackUp location for restoring it later
BACKUP=~/music/

#we are using the while do loop as it will check continously 20-7
# We use inotifywait which is part of inotify-tools package and is used to monitor events of the file
while inotifywait -e modify --format "%f" $MONITOR ; do 
# the -e  means events , modify  means event name like modified , open , close .e etc. --format means what are are sending file or directory 
#we are echoing the text for users in terminal
         echo Detected $FILENAME , making a backup
	 		# we are copying the file from SOURCE To DEST
			cp -r "$MONITOR" "$BACKUP"
			# the zenity is a ui package which is used to create a pop up windows for notifying th user we can use notify-send but this is better
                        zenity --info \
			--text="Some One tried to hack you so we stopped him and removed the malware."
			# we are now removing all the files as malware might have executed on all the file so it's better to clean all for risk free
			rm -r ~/Downloads/*
			# we are now restoring the files from the backup which is generated wvery day by the cron job
			cp /backup/home.tgz ~/Downloads/	
			# we are braking the while loop because this will run infilitely if we dont close it as we have cleared the files
                        break
       done


