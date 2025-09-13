# Nathanael
# 2/27/25
# caesar lab

from cs50 import get_string
import sys
#import libraries/functions

def main():
    if sys.argv[1].isnumeric() == False:
        print("usage: python carsar.py key")
        exit(1)
    #exit 1 if argv is not a number
    key = int(sys.argv[1])
    plaintext = get_string("plaintext: ")
    ciphertext = ""
    #gets the info
    i = 0
    for i in plaintext:
        if i.isupper():
            tempChar = chr((ord(i)-65 + key) % 26 + 65)
            ciphertext += tempChar
        elif i.islower():
            tempChar = chr((ord(i)-97 + key) % 26 + 97)
            ciphertext += tempChar
        else:
            ciphertext += i
    #basically the same logic as the C code but using python stuff
    #adds each individual char to ciphertext
    print("ciphertext: "+ciphertext+"")
    exit(0)

if __name__ == "__main__":
    main()
