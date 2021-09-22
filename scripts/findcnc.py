import sys


file = sys.argv[1]
# Using readlines()
file1 = open(file, 'r')
Lines = file1.readlines()
 
count = 0
# Strips the newline character
for line in Lines:
    count += 1
    for c in line:
        if ord(c) > 127:
            print('line ', count, ' ', c);
