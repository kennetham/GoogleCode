#!/bin/python

test_case = input()

def switch(binary):
    temp = ""
    for i in binary:
        if i == "0":
            temp += "1"
        else:
            temp += "0"
    return temp

binary = ""
for i in xrange(17):
    temp = binary[::-1]
    temp = switch(temp)
    binary = binary + "0" + temp

for idx in xrange(test_case):
    k = input()
    print "Case #" + str(idx + 1) + ": " + binary[k - 1]
