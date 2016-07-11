#Author: Mohit Patel                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 #Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To create a program that will produce various number theories
#         based on two given inputs.
#--------------------------------------------------------------------------#

#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To return a valid positive integer in the given range.
#Parameters: The smallest and largest number outside the range of integers allowed.
#Return Value: A positive integer within the given range.

def getPositiveInteger (low = 0, high = 100):
    
    blnInRange = False
    strNumber = input("Please enter a positive number in the range "+str(low)+" to "+str(high)+ ": ")
    while blnInRange == False or strNumber.isdigit() == False:
        if strNumber.isdigit() == False:
            print("Your number is not a valid integer.")
            strNumber = input("Please re-enter an appropriate integer in the range "+str(low)+" to "+str(high)+ ": ")
        elif int(strNumber) < low or int(strNumber) > high:
            print("Your number is outside of the range " + str(low) + " to " + str(high)+".")
            blnInRange = False
            strNumber = input("Please re-enter an appropriate integer in the range "+str(low)+" to "+str(high)+ ": ")
        else:
            blnInRange = True
    number = int(strNumber)
    return number

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To calculate the factorial of the given integer.
#Parameters: The integer which will have it's factorial calculated.
#Return Value: The factorial of the integer.

def calcFactorial (integer):
    
    count = 1
    factorial = 1
    for count in range(1, integer + 1):
        factorial = factorial * count
        
    return factorial

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To calculate the amount of permutations in a given pair of integers.
#Parameters: Two integers.
#Return Value: The amount of permutations of the two integers.

def calcPermutations (n, r):

#Flips the values of inputs if they are in an incorrect order.
    equalizer = n

    if n < r:
        n = r
        r = equalizer

    permutation = (calcFactorial(n)) / calcFactorial(n-r)

    return permutation

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To calculate the amount of combinations in a given pair of integers.
#Parameters: Two integers.
#Return Value: The amount of combinations of the two integers.

def calcCombinations (n, r):

#Flips the values of inputs if they are in an incorrect order.
    equalizer = n

    if n < r:
        n = r
        r = equalizer
        
    combinations = calcFactorial(n)/((calcFactorial(r))*(calcFactorial(n-r)))

    return combinations

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To calculate the greatest common denominator of two given integers.
#Parameters: Two integers.
#Return Value: The greatest common denominator of those two integers.                

def calcGCD (m, n):

    if n == 0:
        if m == 0:
            return 0
        else:
            return m
    else:
        t = m % n
        while not (t == 0):
            m = n
            n = t
            t = m % n
        return n

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To calculate the lowest common multiple of two given integers.
#Parameters: Two integers.
#Return Value: The lowest common multiple of those two integers.

def calcLCM (m,n):
    lcm = 0
    if calcGCD(m,n) == 0:
        return lcm
    else:
        lcm = (m * n) / calcGCD(m, n)
        return int(lcm)

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: September 29, 2014
#Purpose: To state if two given numbers are relatively prime.
#Parameters: Two integers.
#Return Value: The boolean "True" or "False".

def isRelativelyPrime (m,n):

    if calcGCD(m,n) == 1:
        prime = True
    else:
        prime = False
    return prime

#--------------------------------------------------------------------------#

#Main.
again = "Y"
low = 0
high = 100

#Re-executes program.
while again == "y" or again == "Y":

    # Returns two valid integers.
    print("Enter your first positive integer.")
    integer1 = getPositiveInteger(low,high)
    print("Now, enter a second positive integer.")
    integer2 = getPositiveInteger(low,high)

    print()
    print()
    print("The amount of permutations of this pair of integers is", str(calcPermutations(integer1, integer2))+".")
    print("The amount of combinations of this pair of integers is", str(calcCombinations(integer1,integer2))+".")
    #Ensures no GCD of 0.
    if calcGCD(integer1, integer2) == 0:
        print("The GCD of these numbers is undefined.")
    else:
        print("The GCD of these numbers is", str(calcGCD(integer1,integer2))+".")
    print("The LCM of these numbers is", str(calcLCM(integer1,integer2))+".")
    if isRelativelyPrime(integer1, integer2) == True:
        print("These numbers are also relatively prime!")
    print()
    print()

    again = input("Would you like to calculate another pair of numbers? (Y/N):")
    while not(again == "Y" or again == "y" or again == "N" or again == "n"):
        again = input("Please re-enter if you would like to calculate another pair of numbers. (Y/N):")
    
print("Have a nice day!")
