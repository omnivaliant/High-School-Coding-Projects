#Author: Mohit Patel
#Date: September 16, 2014
#Purpose: To create a program that will determine the largest and smallest
#         of entered numbers.
#------------------------------------------------------------------------------#

again = "Y"
while again == "Y" or again == "y":

    number = int(input("Please enter a non-zero integer:"))
    while number == 0:
        number = int(input("Please re-enter a non-zero integer:"))

    print(" ")
    print(" ")
    print("This program will now end when you enter the number 0.")
    print(" ")
    
    print(" ")

    greater = number
    lesser = number
    Sum = 0
    total = 0
    average = 0


    while number != 0:

        if greater < number:
            greater = number

        if lesser > number:
            lesser = number

        Sum = Sum + number
        total = total + 1

        number = int(input("Please enter another integer:"))

    average = Sum / total

    print("The largest number is",greater)
    print("The smallest number is",lesser)
    print("The average of these numbers is",average)

    again = input("Would you like to enter another series of integers? (Y/N)")
    while not(again == "Y" or again == "N" or again == "y" or again == "n"):
        again = input("Please indicate if you want to enter another series of integers or not. (Y/N)")
print()
print()
print("Have a nice day!")
              
