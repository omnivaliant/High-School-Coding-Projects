#Author: Mohit Patel
#Date: December 9, 2014
#Purpose: To create a program which tests the knowledge of fractions.
#------------------------------------------------------------#
from tkinter import*
import random
root = Tk()
menubar = Menu(root)
root.title("Fraction Tester")
root.config(width = 520, height = 350, bg="sky blue",menu=menubar)
Prompt = StringVar()
Prompt.set("Please set how many questions you would like to do.")
btnPrompt = StringVar()
btnPrompt.set("Begin!")
global FractionOne
global FractionTwo
global FractionAnswer
global operator
global score
global count
global correct
global rounds
correct = False
score = 0
count = 0
rounds = 0
# Fraction class
# Fields:
#   intNumerator: An integer representing the numerator of the fraction.
#   intDenominator: An integer representing the denominator of the fraction.
# Methods:
#   calcGCD: Calculates the greatest common denominator of the fraction's integers.
#   reduce: Simplifies the fraction to lowest terms.
#   setValue: Sets the numerator and denominator to given inputs.
#   randomize: Randomizes the numerator and denominator of the fraction between the negative of the max integer, and the max integer.
#   __str__: Returns the value of the Fraction in the form "intNumerator/intDenominator", with signs attached to the numerator.
#   calcInverse: Calculates the inverse of the given fraction.
#   __eq__: Returns if the fraction is equal to the second fraction.
#   __add__: Returns a fraction that is the sum of two fractions.
#   __sub__: Returns the fractional difference between two fractions.
#   __mul__: Returns a fraction that is the result of multiplying the two given fractions together.
#   __truediv__: Returns a fraction that is quotient of two given fractions.
#   display: Displays the fraction in an intuitive manner on the GUI.
class Fraction():
    # Constructor
    # Parameters: A numerator and denominator.
    def __init__(self,intNumerator=0,intDenominator=1):
        self.intNumerator = intNumerator
        self.intDenominator = intDenominator
        self.reduce()
    #Author: Mohit Patel 
    #Date: September 29, 2014
    #Purpose: To calculate the greatest common divisor of the numerator and denominator.
    #Parameters: None.
    #Return Value: The greatest common divisor of the numerator and denominator.
    def calcGCD (self):
        n = self.intNumerator
        m = self.intDenominator 
        gcd = 0
        if n == 0:
            gcd = m
        else:
            t = m % n
            while not (t == 0):
                m = n
                n = t
                t = m % n
            gcd = n
        return gcd
    # reduce
    # Purpose: Reduces the fraction to lowest terms.
    # Parameters: None.
    def reduce(self):
        if self.intDenominator == 0:
            self.intNumerator = 0
            self.intDenominator = 1
        else:
            gcd = self.calcGCD()
            self.intNumerator = int(self.intNumerator / gcd)
            self.intDenominator = int(self.intDenominator / gcd)
            if self.intDenominator < 0:
                if self.intNumerator < 0:
                    self.intNumerator = abs(self.intNumerator)
                    self.intDenominator = abs(self.intDenominator)
                else:
                    self.intNumerator = self.intNumerator * -1
                    self.intDenominator = abs(self.intDenominator)
    # setValue
    # Purpose: Sets the value of the fraction to a given numerator and denominator.
    # Parameters: A numerator and denominator
    def setValue(self,numerator,denominator):
        if denominator.isdigit() and denominator.isdigit():
            self.intNumerator = numerator
            self.intDenomator = denominator
            self.reduce()
    # randomize
    # Purpose: Randomizes the values of the fraction between the negative of the max integer, and the max integer.
    # Parameters: The max integer.
    def randomize(self,maxInt=10):
        while self.intNumerator == 0 or self.intDenominator == 0:
            self.intNumerator = random.randint(maxInt*-1,maxInt)
            self.intDenominator = random.randint(maxInt*-1,maxInt)
        self.reduce()
    # __str__
    # Purpose: Returns the value of the Fraction in the form "outsideNumber (numerator/denominator)", with signs attached to the numerator.
    # Parameters: None
    def __str__(self):
        numerator = self.intNumerator
        denominator = self.intDenominator
        outsideNumber = 0
        while abs(numerator) >= abs(denominator):
            numerator = abs(numerator) - abs(denominator)
            outsideNumber = outsideNumber + 1
        if outsideNumber == 0:
            outsideNumber = ""
        if numerator == denominator or numerator == 0:
            fraction = ""
        elif denominator == 1:
            fraction = str(numerator)
        else:
            fraction = str(numerator)+"/"+str(denominator)
        return (str(outsideNumber) + " " + str(fraction)).strip()
    # calcInverse
    # Purpose: Calculates the inverse of a given fraction.
    # Parameters: None
    def calcInverse(self):
        a = self.intNumerator
        b = self.intDenominator
        a,b = b,a
        return Fraction(a,b)
    # __eq__
    # Purpose: Returns if the current fraction is equal to a given second fraction.
    # Parameters: The second fraction.
    def __eq__(self,secondFraction):
        self.reduce()
        secondFraction.reduce()
        answer = False
        if self.intNumerator == secondFraction.intNumerator and \
           self.intDenominator == secondFraction.intDenominator:
            answer = True
        return answer
    # __add__
    # Purpose: Returns a fraction that is the sum of two fractions.
    # Parameters: The second fraction.
    def __add__(self,secondFraction):
        Added = Fraction()
        Added.intNumerator=(self.intNumerator * secondFraction.intDenominator) + \
                        (self.intDenominator * secondFraction.intNumerator)
        Added.intDenominator=self.intDenominator * secondFraction.intDenominator
        Added.reduce()
        return Added
    # __sub__
    # Purpose: Returns a fraction that is the difference of two fractions.
    # Parameters: The second fraction.
    def __sub__(self,secondFraction):
        Subtracted = Fraction()
        Subtracted.intNumerator=(self.intNumerator * secondFraction.intDenominator) - \
                        (self.intDenominator * secondFraction.intNumerator)
        Subtracted.intDenominator=self.intDenominator * secondFraction.intDenominator
        Subtracted.reduce()
        return Subtracted
    # __mul__
    # Purpose: Returns a fraction that is the product of two fractions.
    # Parameters: The second fraction.
    def __mul__(self,secondFraction):
        Multiplied = Fraction()
        Multiplied.intNumerator = self.intNumerator * secondFraction.intNumerator
        Multiplied.intDenominator = self.intDenominator * secondFraction.intDenominator
        Multiplied.reduce()
        return Multiplied
    # __truediv__
    # Purpose: Returns a fraction that is the quotient of two fractions.
    # Parameters: The second fraction.
    def __truediv__(self,secondFraction):
        Divided = Fraction()
        Divided.intNumerator = self.intNumerator * secondFraction.intDenominator
        Divided.intDenominator = self.intDenominator * secondFraction.intNumerator
        Divided.reduce()
        return Divided
    # display
    # Purpose: Intuitively displays the fraction on a given canvas.
    # Parameters: The canvas, x coordinate, and y coordinate.
    def display(self,canvas,x=0,y=0):
        numerator = self.intNumerator
        denominator = self.intDenominator
        if numerator == denominator:
            canvas.create_text(x,y,text="1",font=("Arial","20","bold"))
        elif denominator == 1:
            canvas.create_text(x,y,text=numerator,font=("Arial","20","bold"))
        elif abs(numerator) > denominator:
            canvas.create_line(x+20,y,x+60,y,width=5)
            canvas.create_text(x+40,y-30,text=str(abs(numerator)%denominator),font=("Sans Serif Math","20","bold"))
            canvas.create_text(x+40,y+30,text=denominator,font=("Sans Serif Math","20","bold"))
            if numerator < 0:
                canvas.create_text(x,y,text="-"+str(abs(numerator)//denominator),font=("Sans Serif Math","20","bold"))
            else:
                canvas.create_text(x,y,text=str(abs(numerator)//denominator),font=("Sans Serif Math","20","bold"))
        else:
                canvas.create_line(x+20,y,x+60,y,width=5)
                canvas.create_text(x+40,y-30,text=numerator,font=("Sans Serif Math","20","bold"))
                canvas.create_text(x+40,y+30,text=denominator,font=("Sans Serif Math","20","bold"))
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
#Author: Mohit Patel
#Date: December 14 2014
#Purpose: To create the given correct or incorrect equation on the game board.
#Parameters: The canvas to be played on.
#Return Value: The equation on the screen.
def setup(canvas):
    global correct
    global FractionOne
    global FractionTwo
    global FractionAnswer
    global operator
    correct = True
    canvas.delete("all")
    FractionOne = Fraction()
    FractionTwo = Fraction()
    FractionOne.randomize()
    FractionTwo.randomize()
    randomOperator = random.randint(1,4)
    if randomOperator == 1:
        operator = "+"
        FractionAnswer = FractionOne + FractionTwo
    elif randomOperator == 2:
        operator = "-"
        FractionAnswer = FractionOne - FractionTwo
    elif randomOperator == 3:
        operator = "x"
        FractionAnswer = FractionOne * FractionTwo
    else:
        operator = "÷"
        FractionAnswer = FractionOne / FractionTwo
    equal = random.randint(0,1)
    if equal == 0:
        FractionAnswer = FractionAnswer.calcInverse()
        correct = False
    FractionOne.display(canvas,x=25,y=60)
    canvas.create_text(150,60,text=operator,font=("Sans Serif Math","20","bold"))
    FractionTwo.display(canvas,x=200,y=60)
    canvas.create_text(325,60,text="=",font=("Sans Serif Math","20","bold"))
    FractionAnswer.display(canvas,x=375,y=60)
#Author: Mohit Patel
#Date: December 14 2014
#Purpose: To keep track of the score, and determine the outcome of the click event.
#Parameters: The correct or incorrect guess, and the canvas.
#Return Value: The score, and any relevant prompts.
def playGame(guess,canvas):
    global correct
    global score
    global FractionAnswer
    global count
    global rounds
    rounds = rounds + 1
    if rounds == count:
        Prompt.set("Game over! Your score is " + str(score) + "/" + str(count) + ", which is " + str(int(score * 100/count) )+ "%.")
        btnCorrect.config(state="disabled")
        btnIncorrect.config(state="disabled")
        btnPrompt.set("Exit!")
        btnNext.place(x=200,y=270)
        btnNext.config(command=lambda:root.destroy())
    else:
        if guess == correct:
            score = score + 1
            Prompt.set("Yay! You are correct! Your current score is now " + str(score) + " / "+str(rounds)+".")
        else:
            Prompt.set("Uh oh! You are incorrect! Your current score is now " + str(score) +" / " + str(rounds)+".")
        btnPrompt.set("Next!")
        btnNext.place(x=200,y=130)
        btnNext.config(command=lambda:continueGame(canvas))
        btnCorrect.config(state = DISABLED)
        btnIncorrect.config(state = DISABLED)
#Author: Mohit Patel
#Date: December 14 2014
#Purpose: Initializes the game.
#Parameters: The amount of questions given, and the canvas to be played on.
#Return Value: The beginning of the game.
def startGame(totalQuestions,canvas):
    global count
    count = totalQuestions
    btnCorrect.place(x=0,y=120)
    btnIncorrect.place(x=325,y=120)
    scaleQuestions.destroy()
    btnBegin.destroy()
    Prompt.set("You may now decide if the current configuration is correct.")
    setup(canvas)
#Author: Mohit Patel
#Date: December 14 2014
#Purpose: Tells the user about the game.
#Parameters: None.
#Return Value: Information about the game.
def continueGame(canvas):
    btnNext.place_forget()
    btnCorrect.config(state = "normal")
    btnIncorrect.config(state = "normal")
    Prompt.set("You may now decide if the current configuration is correct.")
    btnPrompt.set("Exit!")
    btnNext.place(x=200,y=270)
    btnNext.config(command=lambda:root.destroy())
    setup(canvas)
#Author: Mohit Patel
#Date: December 14 2014
#Purpose: Tells the user about the game.
#Parameters: None.
#Return Value: Information about the game.
def aboutGame():
    print("Welcome to the Fraction Tester! In this game, you will determine if the equation on the screen " +\
          "is correct or not! See if you can score 100%, from 20 to 100 equations! Good luck!")



# Creates the menu with a file section, and a help section.
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="Exit",command=lambda:root.destroy())
menubar.add_cascade(label="File", menu=filemenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About game",command=lambda:aboutGame())
menubar.add_cascade(label="Help", menu=helpmenu)
# Rest of GUI objects
canvasGame = Canvas(root, width = 500, height = 100,bg = "sky blue",highlightthickness=0,relief="groove",bd=10)
canvasGame.place(x=0,y=0)
btnCorrect = Button(root,width=10,text="Correct!",height=2,font=("Arial","20","bold"),command=lambda:playGame(guess = True,canvas = canvasGame),relief="groove",bd=10,bg="light green")
btnIncorrect = Button(root,width=10,text="Incorrect!",height=2,font=("Arial","20","bold"),command=lambda:playGame(guess = False,canvas = canvasGame),relief="groove",bd=10,bg="crimson")
lblScore = Label(root,height=1,width=50,textvariable=Prompt,font=("Arial","12","bold"),anchor=W,bg="skyblue")
lblScore.place(x=10,y=235)
scaleQuestions = Scale(canvasGame,from_=10, to=100,resolution=5,orient=HORIZONTAL,length=200,width=20,label="Number of questions:",font=("Arial","12","bold"))
scaleQuestions.place(x=50,y=35)
btnBegin = Button(canvasGame,width=5,textvariable=btnPrompt,height=1,font=("Arial","20","bold"),command=lambda:startGame(scaleQuestions.get(),canvas=canvasGame),relief="groove",bd=10)
btnBegin.place(x=350,y=30)
btnNext = Button(root,width=5,textvariable=btnPrompt,height=1,font=("Arial","20","bold"),command=lambda:continueGame(canvasGame),relief="groove",bd=10)
