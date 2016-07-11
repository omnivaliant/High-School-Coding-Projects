#Author: Mohit Patel                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 #Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To create a program that will produce various number theories
#         based on two given inputs.
#--------------------------------------------------------------------------#
from tkinter import*
root = Tk(className=" Number Theory")
root.config(background = "lime green", width = 600, height = 5000)

menubar = Menu(root)
integer1 = StringVar()
integer1.set (value = "15")
integer2 = StringVar()
integer2.set(value = "4")

permutations = StringVar()     
permutations.set(value = " ")
combinations = StringVar()
combinations.set(value = " ")
gcd = StringVar()
gcd.set(value = " ")
lcm = StringVar()
lcm.set(value = " ")
isPrime = StringVar()
isPrime.set(value = " ")

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

def calcPermutations (n,r):

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
#Date: Oct 29, 2014
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

#Author: Mohit Patel 
#Date: Oct 29, 2014
#Purpose: To calculate the various properties of integers.
#Parameters: Two integers.
#Return Value: The various number theories behind those numbers.

def calculate(strInteger1 = "15", strInteger2 = "4"):
    clear()
    if not(strInteger1.isdigit()) or int(strInteger1) > 100:
        permutations.set("Your first integer is invalid.")
        if not(strInteger2.isdigit()) or int(strInteger2) > 100:
            combinations.set("Your second integer is invalid.")
    elif not(strInteger2.isdigit()) or int(strInteger2) > 100:
        permutations.set("Your second integer is invalid.")
    else:
        integer1 = int(strInteger1)
        integer2 = int(strInteger2)
        permutations.set("Your permutations are " + str(calcPermutations(integer1,integer2))+".")
        combinations.set("Your combinations are " + str(calcCombinations(integer1,integer2))+".")
        gcd.set("The greatest common denominator of this pair is " + str(calcGCD(integer1,integer2))+".")
        lcm.set("The lowest common multiple of this pair is " + str(calcLCM(integer1,integer2))+".")
        if isRelativelyPrime(integer1,integer2):
            isPrime.set("Hey, your integers happens to be relatively prime!")

#--------------------------------------------------------------------------#

#Author: Mohit Patel 
#Date: Oct 30, 2014
#Purpose: To clear all labels.
#Parameters: None.
#Return Value: Labels are cleared.
def clear():
    permutations.set(" ")
    combinations.set(" ")
    gcd.set(" ")
    lcm.set(" ")
    isPrime.set(" ")

#GUI
# create a pulldown menu, and add it to the menu bar
filemenu = Menu(menubar, tearoff=0)
menubar.add_cascade(label="File", menu=filemenu)
filemenu.add_command(label="Exit",command=lambda:root.destroy())


# create more pulldown menus

actionmenu = Menu(menubar, tearoff=0)
actionmenu.add_command(label="Calculate!",command=lambda:calculate(integer1.get(),integer2.get()))
menubar.add_cascade(label="Actions",menu=actionmenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About")
menubar.add_cascade(label="Help")


# display the menu
root.config(menu=menubar)    

#Main.
border = Frame(root,relief=GROOVE,borderwidth=5,width=400, bg="lime green")
border.grid(row=0,column=0,sticky=W,padx=0,pady=0)
lblFirst = Label (border, text="First Number:",bg = "lime green",justify=LEFT)
lblFirst.grid(row=0,column=0, sticky=W, padx = 0, pady = 5)
lblSecond = Label(border, text="Second Number:",bg = "lime green",justify=LEFT)
lblSecond.grid(row=1,column=0, sticky=W,padx = 0, pady = 5)
entryFirst = Entry (border, width = 8, textvariable = integer1)
entryFirst.grid (row= 0 , column = 1, padx = 10, pady = 5, sticky=E)
entrySecond = Entry (border, width = 8, textvariable = integer2)
entrySecond.grid (row= 1 , column = 1, padx = 10, pady = 5,sticky=E)
btnCalc = Button (root, text = "Calculate!", width = 18,height = 2,font=("Arial","20","bold"),command = lambda:calculate(integer1.get(),integer2.get()))
btnCalc.grid (row= 2,column = 0, padx = 0, pady = 5)
lblPerm = Label (root,textvariable = permutations, width=44,height = 2,font=("Arial","9","bold"),bg = "lime green",justify=LEFT)
lblPerm.grid(row=3,column=0,sticky=W,padx = 0, pady = 5)
lblComb = Label (root, textvariable = combinations,width = 44, height = 2,font=("Arial","9","bold"),bg = "lime green",justify=LEFT)
lblComb.grid(row=4,column=0, sticky=W,padx = 0, pady = 5)
lblGCD = Label (root, textvariable = gcd,width = 44, height = 2,font=("Arial","9","bold"),bg = "lime green",justify=LEFT)
lblGCD.grid(row=5,column=0, sticky=W,padx = 0, pady = 5)
lblLCM = Label (root, textvariable = lcm,width = 44, height = 2,font=("Arial","9","bold"),bg = "lime green",justify=LEFT)
lblLCM.grid(row=6,column=0, sticky=W,padx = 0, pady = 5)
lblIsPrime = Label (root, textvariable = isPrime,width = 44, height = 2,font=("Arial","9","bold"),bg = "lime green",justify=LEFT)
lblIsPrime.grid(row=7,column=0, sticky=W,padx = 0, pady = 5)


        
mainloop()

