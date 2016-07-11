#Author: Mohit Patel
#Date: September 12. 2014
#Purpose: To calculate and output numbers.
#----------------------------------------------------------------------------#

# Series 1

print("Factorial of 20!")
print()

product = 1
number = 1

while number <= 20:
    product *= number
    number += 1
print(product)
print()

# Series 2

print("Pi approximator!")
print()

product = 1
number = 1

while number < 999999:
    number += 1
    product = product - (1.0 / (number * 2 - 1))
    number += 1
    product = product + (1.0 / (number * 2 - 1))
product = 4 * (product  - (1.0 / (1999999)))
print(product)
print()

# Series 3

print("Almost 0.5!")
print()

product = 1/3
number = 1

while number < 1000000:
    number += 1
    product = product + 1.0 / (4 * ((number)**2) - 1)
print(product)
print()
