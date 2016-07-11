#Author: Mohit Patel
#Date: September 15, 2014
#Purpose: To create a program which can figure out the middle of 3 numbers.
#------------------------------------------------------------------------------#

number1 = int(input("Please enter the first of the three numbers:"))
while number1 < 1 or number1 % 2 == 1:
    number1 = int(input("Your number is incorrect. Please enter a positive, even number."))

number2 = int(input("Please enter the second of the three numbers:"))
while number2 < 1 or number2 % 2 == 1 or number2 == number1:
    number2 = int(input("Your number is incorrect. Please enter a unique, positive, and even number."))

number3 = int(input("Please enter the final of the three numbers:"))
while number3 < 1 or number3 % 2 == 1 or number3 == number2 or number3 == number1:
    number3 = int(input("Your number is incorrect. Please enter a unique, positive, and even number."))



if number1 > number2 and number3 > number1:
    print(number1)
elif number2 > number1 and number3 > number2:
    print(number2)
else:
    print(number3)
    

                
