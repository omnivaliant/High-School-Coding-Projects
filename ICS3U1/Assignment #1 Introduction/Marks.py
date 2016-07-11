#Author: Mohit Patel
#Date: September 12, 2014
#Purpose: To create a program which will comment about the mark given.
#-----------------------------------------------------------------------------#

mark = int(input("Please enter a mark between 0 and 100:"))
while mark < 0 or mark > 100:
    mark = int(input("Please reenter a mark between 0 and 100:"))

if mark <= 39:
    print("Fail :(")
elif mark >= 40 and mark <= 49:
    print("Credit Recovery")
elif mark >= 50 and mark <= 59:
    print("Level 1")
elif mark >= 60 and mark <= 69:
    print("Level 2")
elif mark >=70 and mark <= 80:
    print("Level 3")
else:
    print("Level 4! :D")
