#Author: Mohit Patel
#Date: September 16, 2014
#Purpose: To analyze positive integers and present their characteristics.
#------------------------------------------------------------------------------#

again = "Y"
while again == "y" or again == "Y":
    
    number = int(input("Please enter a positive integer: "))

    while number <= 0:
        number = int(input("Please re-enter a positive, non-zero, number: "))
        

    count = 0
    breakdown = number
    leftover = 0
    reverse = 0
    Sum = 0
    digitalroot = 0
    maximum = 0


    while breakdown != 0:
        leftover = breakdown % 10
        reverse = reverse * 10 + leftover
        Sum = Sum + leftover
        breakdown = breakdown // 10
        count = count + 1

    digitalroot = Sum
    leftover = 0
    for maximum in range(1, 21):
        while digitalroot != 0:
            leftover = leftover + (digitalroot % 10)
            digitalroot = digitalroot // 10
        digitalroot = leftover
        leftover = 0
        if digitalroot >= 0 and digitalroot <= 9:
            maximum = 21
    
    print("Your number has",count,"digits.")
    print("The sum of these digits is",Sum,".")
    print("The reverse of this number is",reverse,".")
    print("The digital root of this number is",digitalroot,".")
    if reverse == number:
        print("This number also happens to be a palindrome!")

    again = input("Would you like to analyse another number? (Y/N) ")
    while not(again == "Y" or again == "N" or again == "y" or again == "n"):
        again = input("Please enter if you would like to analyse another number. (Y/N) ")
    
print()
print()
print("Have a nice day!")

      
