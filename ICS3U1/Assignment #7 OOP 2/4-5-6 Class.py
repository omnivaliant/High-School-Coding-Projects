#Author: Mohit Patel
#Date: Nov. 27, 2014.
#Purpose: To create a program that will roll and display 3 dice.
#------------------------------------------------------------------------#
import random
from tkinter import*
root = Tk()
root.title("4-5-6 Dice Game")
root.config(width=500,height=438,bg="sky blue")  
menubar = Menu(root)
root.config(menu=menubar) 
Prompt = StringVar()
Prompt.set(value = "Welcome to 4-5-6! Please enter a simulation mode, or a manual game!")
Size = IntVar()
Size.set(value = 50)
#Global variables used to keep track of the score used in manual playthroughs.
global wins
global loses
global points
global nothings
wins = 0
loses = 0
points = 0
nothings = 0
# Dice class
# Fields:
#   value: A random integer between 1-6, representing the current face of the die.
#   size: An integer between 30-100. representing the relative size of the die on the GUI.
#   radius: A number used in the printing of the die, representing the radius of the dots in order for the die to look proportionate at all sizes.
#   gap: A number used in the printing of the die, representing the spaces around the dots in order for the die to look proportionate at all sizes.
# Methods:
#   __str__: Allows the die to be printed by it's value.
#   getValue: Allows the manual entry of the die's value.
#   setValue: Sets the value of the die, according to an inputted value, and ensures validity.
#   setSize: Proportionally adjusts the size of the die, according to a size parameter, to it's size, radius, and gap.
#   roll: Sets the current die's value to a random integer between 1 and 6.
#   draw: Allows the current die to be drawn onto the board.
class Dice:
    def __init__(self,size=100):
        # Constructor
        # Parameters: Size of the die.
        self.value = random.randint(1,6)
        self.size = size
        self.radius = size / 5
        self.gap = self.radius / 2
    def __str__(self):
        # __str__
        # Purpose: Returns the string version of the current die value.
        # Parameters: None.
        return str(self.value)
    def getValue(self):
        # getValue
        # Purpose: Allows for manual input for the current die.
        # Parameters: None.
        self.value = getPositiveInteger(1,6)
    def setValue(self,inputValue=1):
        # setValue
        # Purpose: Sets the value of the die according to the getValue input, and ensures validity.
        # Parameters: The input value.
        if not(inputValue.isdigit()):
            inputValue = 1
        elif int(inputValue) < 1 or int(inputValue > 6):
            inputValue = 1
        self.value = inputValue
    def setSize(self,inputSize=50):
        # setSize
        # Purpose: Sets the size of the die according to the input, and adjusts radius and gaps according to the size.
        # Parameters: The size of the die.
        self.size = inputSize
        self.radius = inputSize / 5
        self.gap = self.radius / 2
    def roll(self):
        # roll
        # Purpose: Sets the value of the die randomly between 1 and 6.
        # Parameters: None.
        self.value = random.randint(1,6)
    def draw(self,canvas,x,y):
        # draw
        # Purpose: Sets the value of the die according to the getValue input.
        # Parameters: None.
        canvas.create_rectangle(x,y,x+self.size,y+self.size,fill="white",outline="black")
        if self.value % 2 == 1:
            canvas.create_oval(x+(2*self.gap)+(self.radius),y+(2*self.gap)+(self.radius),x+(2*self.gap)+(2*self.radius),y+(2*self.gap)+(2*self.radius),fill="black")
        if self.value > 1:
            canvas.create_oval(x+self.gap,y+self.gap,x+self.gap+self.radius,y+self.gap+self.radius,fill="black")
            canvas.create_oval(x+(3*self.gap)+(2*self.radius),y+(3*self.gap)+(2*self.radius),x+(3*self.gap)+(3*self.radius),y+(3*self.gap)+(3*self.radius),fill="black")
        if self.value > 3:
            canvas.create_oval(x+self.gap,y+(3*self.gap)+(2*self.radius),x+self.gap+self.radius,y+(3*self.gap)+(3*self.radius),fill="black")
            canvas.create_oval(x+(3*self.gap)+(2*self.radius),y+self.gap,x+(3*self.gap)+(3*self.radius),y+self.gap+self.radius,fill="black")
        if self.value == 6:
            canvas.create_oval(x+self.gap,y+(2*self.gap)+self.radius,x+self.gap+self.radius,y+(2*self.gap)+(2*self.radius),fill="black")
            canvas.create_oval(x+(3*self.gap)+(2*self.radius),y+(2*self.gap)+self.radius,x+(3*self.gap)+(3*self.radius),y+(2*self.gap)+(2*self.radius),fill="black")
# Hand class
# Fields:
#   firstDie: A Dice object representing the first die of the object.
#   secondDie: A Dice object representing the second die of the object.
#   thirdDie: A Dice object representing the third die of the object.
#   size: The size of each die in the hand; the entire hand is 3x the size for length, and 1x the size for width.
# Methods:
#   __str__: Allows the hand to be printed out by its die's values, in the form 1-2-3.
#   getValue: Obtains the values for each of the individual die.
#   setValue: Sets the values for each of the individual die.
#   setSize: Proportionally adjusts the size of each of it's die, according to a size parameter, to it's size, radius, and gap.
#   sort: Arranges the die so it's values are in increasing order, from 1 to 6.
#   roll: Sets the current die's value to a random integer between 1 and 6.
#   draw: Allows all three dies to be drawn on the board, consecutively.
#   isWinner: Determines if the current hand wins; arranged in 4-5-6, 3-of-a-kind, or a pair and a 6.
#   isLoser: Determines if the current hand loses; arranged in 1-2-3, or a pair and a 1.
#   calcPoint: Returns the point value of the current hand; a pair and a number between 2-5 will give points between 2-5, according to the third die; 0 points if otherwise.
#   display: Prints a table according to if the hand has won, lost, earned points, or nothings.
class Hand:
    def __init__(self,size=50):
    # Constructor
    # Parameters: Size of each die.
        self.firstDie = Dice()
        self.secondDie = Dice()
        self.thirdDie = Dice()
        self.size = size
    # __str__
    # Purpose: Returns the string version of the current hand, in the form 4-5-6.
    # Parameters: None.
    def __str__(self):
        return str(self.firstDie) + "-" + str(self.secondDie) + "-" + str(self.thirdDie)
    # getValues
    # Purpose: Obtains the values of each die of the hand, through the console.
    # Parameters: None.
    def getValues(self):
        print("You will now enter the value for your first die.")
        self.firstDie.getValue()
        print("You will now enter the value for your second die.")
        self.secondDie.getValue()
        print("You will now enter the value for your third die.")
        self.thirdDie.getValue()
    # setValues
    # Purpose: Sets the values of each individual die according to inputted values.
    # Parameters: Manual values for firstDie, secondDie, and thirdDie.
    def setValues(self,firstDie,secondDie,thirdDie):
        self.firstDie.setValue(firstDie)
        self.secondDie.setValue(secondDie)
        self.thirdDie.setValue(thirdDie)
    # setSize
    # Purpose: Sets the size of each individual die, according to an inputted value.
    # Parameters: The size, in the range 30-100.
    def setSize(self,size=50):
        if size < 30 or size > 100:
            size = 50
        self.firstDie.setSize(size)
        self.secondDie.setSize(size)
        self.thirdDie.setSize(size)
    # sort
    # Purpose: Arranges the value of each die in increasing order, from 1-6.
    # Parameters: None.
    def sort(self):
        first = self.firstDie.value
        second = self.secondDie.value
        third = self.thirdDie.value
        if min(first,second,third) == first:
            if min(second,third) == third:
                self.secondDie.value = third
                self.thirdDie.value = second
        elif min(first,second,third) == second:
            self.firstDie.value = second
            if min(first,third) == first:
                self.secondDie.value = first
                self.thirdDie.value = third
            else:
                self.secondDie.value = third
                self.thirdDie.value = first
        else:
            self.firstDie.value = third
            if min(first,second) == first:
                self.secondDie.value = first
                self.thirdDie.value = second
            else:
                self.secondDie.value = second
                self.thirdDie.value=first
    # roll
    # Purpose: Randomizes the value of each die, in an integer of 1-6.
    # Parameters: None.
    def roll(self):
        self.firstDie.roll()
        self.secondDie.roll()
        self.thirdDie.roll()
    # draw
    # Purpose: Draws each of the three die consecutively on a given canvas and x-y coordinates.
    # Parameters: Canvas, x-coordinate, and y-coordinate.
    def draw(self,canvas,x,y):
        self.firstDie.draw(canvas,x,y)
        self.secondDie.draw(canvas,x+self.firstDie.size,y)
        self.thirdDie.draw(canvas,x+2*(self.firstDie.size),y)
    # isWinner
    # Purpose: Determines if the current hand can win, which can only occur through a 4-5-6, 3-of-a-kind, or a pair and a 6.
    # Parameters: None.
    def isWinner(self):
        winner = False
        if self.firstDie.value == 4 and self.secondDie.value == 5 and self.thirdDie.value == 6:
            winner = True
        elif self.firstDie.value == self.secondDie.value and self.secondDie.value == self.thirdDie.value:
            winner = True
        elif self.firstDie.value == self.secondDie.value and self.thirdDie.value == 6:
            winner = True
        return winner
    # isLoser
    # Purpose: Determines if the current hand can lose, which can only occur through a 1-2-3, or a pair and a 1.
    # Parameters: None.
    def isLoser(self):
        loser = False
        if self.firstDie.value == 1 and self.secondDie.value == 2 and self.thirdDie.value == 3:
            loser = True
        elif self.firstDie.value == 1 and self.secondDie.value == self.thirdDie.value:
            loser = True
        return loser
    # calcPoint
    # Purpose: Determines if the current hand can earn points; if the hand is a pair and a number between 2-5, the points are 2-5; or else, 0 points.
    # Parameters: None.
    def calcPoint(self):
        point = 0
        if self.firstDie.value == self.secondDie.value and self.thirdDie.value > 1 and self.thirdDie.value < 6:
            point = self.thirdDie.value
        return point
    # display
    # Purpose: Prints a table according to various values.
    # Parameters: Canvas, amount of wins, amount of loses, amount of points, amount of nothings, top left x coordinate, and top left y coordinate.
    def display(self,canvas,wins,loses,points,nothings,x=400,y=0):
        canvas.create_text(x,y,text="Wins: "+ str(wins),font=("Arial","12","bold"))
        canvas.create_text(x,y+50,text="Loses: " + str(loses),font=("Arial","12","bold"))
        canvas.create_text(x,y+100,text="Points: " + str(points),font=("Arial","12","bold"))
        canvas.create_text(x,y+150,text="Nothings: " + str(nothings),font=("Arial","12","bold"))
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
#Date: December 10, 2014
#Purpose: Allows the playing of the game manually; one hand at a time.
#Parameters: The canvas to be drawn on, the size of the dies in the hand, the x and y coordinates inside the canvas of the die,
#            and the x and y coordinates in the canvas for the table.
#Return Value: The results of one roll of a new hand.
def manual(canvas,size,xDraw,yDraw,xTable,yTable):
    global wins
    global loses
    global points
    global nothings
    canvas.delete("all")
    myHand = Hand()
    myHand.sort()
    myHand.setSize(int(scaleSize.get()))
    myHand.draw(canvas,xDraw,yDraw)
    if myHand.isWinner():
        wins = wins + 1
        Prompt.set(value = "You win! :)")
    elif myHand.isLoser():
        loses = loses + 1
        Prompt.set(value = "You lose! :(")
    elif myHand.calcPoint() > 0:
        points = points + myHand.calcPoint()
        Prompt.set(value = "You earn: " + str(myHand.calcPoint()) + " points.")
    else:
        nothings = nothings + 1
        Prompt.set(value = "You earn nothing!")
    myHand.display(canvas,wins,loses,points,nothings,xTable,yTable)
#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 10, 2014
#Purpose: Allows the simulation of the game of 10,000 hands.
#Parameters: The canvas to be drawn on, and the x and y coordinates for the table inside the canvas.
#Return Value: The results of the 10,000 simulated hand results.
def simulation(canvas,xTable,yTable):
    #Resets the global variable values of the manual table results.
    canvas.delete("all")
    global wins
    global loses
    global points
    global nothings
    wins = 0
    loses = 0
    points = 0
    nothings = 0
    simWins = 0
    simLoses = 0
    simPoints = 0
    simNothings = 0
    myHand = Hand()
    myHand.setSize(int(scaleSize.get()))
    for count in range(1,10001):
        myHand.roll()
        myHand.sort()
        if myHand.isWinner():
            simWins = simWins + 1
        elif myHand.isLoser():
            simLoses = simLoses + 1
        elif myHand.calcPoint() > 0:
            simPoints = simPoints + myHand.calcPoint()
        else:
            simNothings = simNothings + 1
    myHand.display(canvas,simWins,simLoses,simPoints,simNothings,xTable,yTable)
    Prompt.set(value = "Your simulation results are as follows: ")
#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 11, 2014
#Purpose: Gives helpful information about the game, through the console.
#Parameters: The canvas.
#Return Value: Helpful information, through the console.
def aboutGame(canvas):
    helpGuide = "Welcome to the 4-5-6 dice game! Your goal is to try as win as many games as possible, by rolling a "+\
                 "hand containing 3 individial die, in order to win by either getting a 4-5-6, 3-of-a-kind, or a pair "+\
                 "and a 6. If you don't win, then there is a possibility that you can lose, which will only happen if "+\
                 "you get a 1-2-3 or a pair and a 1. If you have a pair but not a 1 or 6, you earn  a certain amount of "+\
                 "points, dictated by your third die. Finally, if none of these options are available, you earn nothing! "+\
                 "Either play this game hand by hand, or simulate 10,000 trials to quickly see interesting data "+\
                 "trends. We hope you enjoy!"
    print(helpGuide)
#############################GUI MAIN############################################################################################
# creates the menu with a file section, and a help section.
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="New Hand", command=lambda:manual(canvasManual,scaleSize.get(),xDraw=0,yDraw=0,xTable=400,yTable=40))
filemenu.add_command(label="Generate Tally", command=lambda:simulation(canvasManual,xTable=100,yTable=40))
filemenu.add_separator()
filemenu.add_command(label="Exit",command=lambda:root.destroy())
menubar.add_cascade(label="File", menu=filemenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About", command=lambda:aboutGame(canvasManual))
menubar.add_cascade(label="Help", menu=helpmenu)
#Rest of GUI objects
canvasGame = Canvas(root, width = 800, height = 600,bg = "sky blue",highlightthickness=0)
canvasGame.place(x=0,y=0)
canvasGame.focus_set()
canvasManual = Canvas(canvasGame,width=500,height=300,bg="sky blue",highlightthickness=0)
canvasManual.place(x=0,y=85)
lblPrompt = Label(canvasGame,textvariable=Prompt,width=30,height=4,font=("Arial","12","bold"),justify=LEFT,bg="sky blue",wraplength=300,anchor="nw")
lblPrompt.place(x=0,y=0)
scaleSize = Scale(canvasGame,from_=30,to=100,resolution = 1,orient=HORIZONTAL,bd=5,label="Dice size: ",font=("Arial","12","bold"),relief="groove",length=190)
scaleSize.place(x=300,y=0)
scaleSize.set(50)
btnSimulation = Button(canvasGame,width=20,text="Simulation Mode",height=2,font=("Arial","12","bold"),command=lambda:simulation(canvasManual,xTable=100,yTable=40))
btnSimulation.place(x=0,y=385)
btnManual = Button(canvasGame,width=20,text="Manual Roll",height=2,font=("Arial","12","bold"),command=lambda:manual(canvasManual,scaleSize.get(),xDraw=0,\
                                                                                                                    yDraw=0,xTable=400,yTable=40))
btnManual.place(x=290,y=385)
mainloop()

