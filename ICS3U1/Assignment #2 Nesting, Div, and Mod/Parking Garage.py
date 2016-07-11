#Author: Mohit Patel
#Date: September 16, 2014
#Purpose: To create a program that will calculate the cost of parking
#         at a parking garage.
#------------------------------------------------------------------------------#
again = "Y"
while again == "Y" or again == "y":

    minutes = int(input("Please enter the amount of minutes you have parked for: "))
    while minutes <= 0:
        minutes = int(input("Please re-enter the amount of minutes you have parked for: "))

    timeEntered = int(input("Now, please enter the time you have entered , in 24 hour format. (HHMM): "))
    while timeEntered <= 0 or timeEntered > 2359 or timeEntered % 100 > 59:
        timeEntered = int(input("Please enter a valid time you have entered at, in 24 hour format. (HHMM): "))

    

    parkingPass = str(input("Finally, do you have a staff parking pass? (Y/N) "))
    
    while not(parkingPass == "Y" or parkingPass == "N" or parkingPass == "y" or parkingPass == "n"):
        parkingPass = str(input("Please re-enter if you have a parking pass or not. (Y/N) "))\

    minutesEntered = (timeEntered // 100) * 60 + (timeEntered % 100) 
    price = 0
    finalTime = minutesEntered + minutes


    if finalTime >= 1080:
        if minutesEntered > 1080:
            price = 5
        elif (1080 - minutesEntered) % 20 > 0:
            price = ((((1080 - minutesEntered) // 20) + 1) * 3) + 5
        else:
            price = (((1080 - minutesEntered) // 20) * 3) + 5

    elif minutes % 20 > 0:
        price = ((minutes // 20) + 1) * 3
    else:
        price = (minutes // 20) * 3


    if price > 28:
        price = 28
    if parkingPass == "Y" or parkingPass == "y":
        if price > 8.5:
            price = 8.5

    print(" ")    
    print(" ")
    print("The total cost of your parking visit is $%.2f" %price)
    print(" ")
    print(" ")
    
    again = input("Would you like to calculate another time? (Y/N): ")
    while not(again == "Y" or again == "N" or again == "y" or again == "n"):
        again = input("Please re-enter if you want to calculate again. (Y/N): ")
    print(" ")
    print(" ")
 
print("Have a nice day!")
    


