#Author: Mohit Patel
#Date: September 11, 2014
#Purpose: To create a program that prints out various sequences.
#-------------------------------------------------------------------------------#

#Sequence 1

print("Start from 5, move 3 units up:")
number = 5

while number <= 50:
        print(number)
        number += 3

print(" ")

#Sequence 2

print("Start from 90, move 4 units down:")

number = 90

while number >= 50:
        print(number)
        number -= 4

print(" ")

#Sequence 3

print("Start from 3, keep doubling:")
number = 3

while number <= 24576:
        print(number)
        number *= 2

number = 1
count = 1

print(" ")

#Sequence 4

print("Start from 1, keep tripling:")

while count <= 15:
        print(number)
        number *= 3
        count += 1


