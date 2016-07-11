#Author: Mohit Patel
#Date: September 11, 2014
#Purpose: To calculate the area of a triangle, knowing the 3 sides.
#------------------------------------------------------------------

import math

sideA = (int)(input("Please enter the first side of the triangle!:"))
sideB = (int)(input("Please enter the second side of the triangle!:"))
sideC = (int)(input("Finally, enter the third side of the triangle!:"))

while sideA <= 0 or sideB <= 0 or sideC <=0 or sideA + sideB <= sideC or sideA + sideC <= sideB or sideB + sideC <= sideA:

    while sideA <= 0:
        sideA = (int(input("Please reenter the first side of the triangle; it is not positive:")))
    while sideB <= 0:
        sideB = (int(input("Please reenter the second side of the triangle; it is not positive:")))
    while sideC <= 0:
        sideC = (int(input("Please reenter the third side of the triangle; it is not positive:")))

    if sideA + sideB <= sideC or sideA + sideC <= sideB or sideB + sideC <= sideA:
        sideA = (int)(input("Please reenter the first side of the triangle; your positive integer setup is invalid for a complete triangle:"))
        sideB = (int)(input("Please reenter the second side of the triangle; your positive integer setup is invalid for a complete triangle:"))
        sideC = (int)(input("Finally, reenter the third side of the triangle; your positive integer setup is invalid for a complete triangle:"))
    

semiPerimeter = 0.5 * (sideA + sideB + sideC)

Area = math.sqrt(semiPerimeter * (semiPerimeter - sideA) *(semiPerimeter - sideB) * (semiPerimeter - sideC))

print ("The Area of the Triangle that you provided three sides for is %8.2f" % Area)

