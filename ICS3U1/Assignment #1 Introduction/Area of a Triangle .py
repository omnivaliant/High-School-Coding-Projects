#Author: Mohit Patel
#Date: September 11, 2014
#Purpose: To calculate the area of a triangle, knowing the 3 semiPerimeter.
#------------------------------------------------------------------

import math

sideA = (int)(input("Please enter the first side of the triangle!"))
sideB = (int)(input("Please enter the second side of the triangle!"))
sideC = (int)(input("Finally, enter the third side of the triangle!"))

semiPerimeter = 0.5 * (sideA + sideB + sideC)

Area = math.sqrt(semiPerimeter * (semiPerimeter - sideA) *(semiPerimeter - sideB) * (semiPerimeter - sideC))

print ("The Area of the Triangle that you provided three sides for is", Area)

