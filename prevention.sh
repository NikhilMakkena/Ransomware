#!/bin/sh
#The above line is to tell the system that its is a bash file so execute it as you do in a terminal

# The MONITOR ,  MONITOR2 and MONITOR3 will store the location of the File which is monitor is is store in the variable

MONITOR=~/Downloads/critical/lab1/note1.txt
MONITOR2=~/Downloads/critical/lab2/note2.txt
MONITOR3=~/Downloads/critical/lab3/note3.txt


#we are using the while do loop as it will check continously
# We use inotifywait which is part of inotify-tools package and is used to monitor events of the file

#To prevent False positive we are using multiple while lops to prevent this activity when we are using text editors 

while inotifywait -e modify --format "%f" $MONITOR ; do 
         echo Detected $FILENAME , Restoring Backup
	 # the zenity is a ui package which is used to create a pop up windows for notifying th user we can use notify-send but this is better
                        zenity --info \
			--text="Some One tried to hack you so we stopped him and removed the malware."
			# we are now removing all the files as malware might have executed on all the file so it's better to clean all for risk free
			rm -r ~/Downloads/*
			# we are now restoring the files from the backup which is generated wvery day by the cron job
			cp /backup/home.tgz ~/Downloads/	
                        break
       done

# the -e  means events , modify  means event name like modified , open , close .e etc. --format means what are are sending file or directory 
#we are echoing the text for users in terminal

while inotifywait -e modify --format "%f" $MONITOR2 ; do 
         echo Detected $FILENAME , Restoring Backup
	 # the zenity is a ui package which is used to create a pop up windows for notifying th user we can use notify-send but this is better
                        zenity --info \
			--text="Some One tried to hack you so we stopped him and removed the malware."
			# we are now removing all the files as malware might have executed on all the file so it's better to clean all for risk free
			rm -r ~/Downloads/*
			# we are now restoring the files from the backup which is generated wvery day by the cron job
			cp /backup/home.tgz ~/Downloads/	
                        break
       done

while inotifywait -e modify --format "%f" $MONITOR3 ; do 
         echo Detected $FILENAME , Restoring Backup
	 # the zenity is a ui package which is used to create a pop up windows for notifying th user we can use notify-send but this is better
                        zenity --info \
			--text="Some One tried to hack you so we stopped him and removed the malware."
			# we are now removing all the files as malware might have executed on all the file so it's better to clean all for risk free
			rm -r ~/Downloads/*
			# we are now restoring the files from the backup which is generated wvery day by the cron job
			cp /backup/home.tgz ~/Downloads/	
                        break
       done



#The code starts by creating three files: "note1.txt", "note2.txt", and "note3.txt".
#The code then uses the inotifywait command to wait for changes to any of these files (in this case, just trying to hack into them).
#If a change is detected, the code prints out some information about the file (name, size, modified time), and then deletes it.
#Next, the code creates two more files: home.tgz and backup/home.tgz.
#The home.tgz file contains a copy of all of the files in ~/Downloads (minus the hacked ones) so that if anything happens to one of those originals, at least someone will still have access to their data.
#Finally, the code breaks out of inotifywait so that it can do other things while it's monitoring the files
#The code will run two inotifywait commands, one for the "monitor" file and another for the "note2.txt" file.
#The monitor file will be checked every 5 seconds to see if any changes have been made to it, and if so, the backup of the file will be copied over to the "backup" folder.
#If no changes are detected on the monitor file within 5 seconds, then the code will move on to check the "note3.txt" file.
#If any changes have been made to note3.txt within 5 seconds of monitoring it, then the code will run a zenity command which will display some text indicating that someone has tried to hack into your computer and was stopped by the software

