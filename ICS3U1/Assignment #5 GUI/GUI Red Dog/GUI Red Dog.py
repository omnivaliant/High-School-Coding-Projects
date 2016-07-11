#Author: Mohit Patel
#Date: November 3, 2014
#Purpose: To create a program that will play the game of "Red Dog", with an intuitive GUI.
#--------------------------------------------------------------------------#
import random
import math
from tkinter import*

root = Tk()
root.title ("Red Dog")
root.config(background = "green", width = 4100, height = 500)

menubar = Menu(root)
bet1 = StringVar()
bet1.set(value = 1)
bet2 = StringVar()
bet2.set(value = 1)
prompt = StringVar()
prompt.set(value = "Welcome to Red Dog! Please make a bet between 1 to 100!")
betPrompt = StringVar()
betPrompt.set(value = " Bet #1:")
btnPrompt = StringVar()
btnPrompt.set(value = "Place your first bet!")
Purse = IntVar()
Purse.set(value = 100)
pursePrompt = StringVar()
pursePrompt.set(value = "Your current purse has: $100")
Win = StringVar()
Win.set(value = " ")

#To allow the hand value to transfer between the firstBet and secondBet.
global previousHand
global canvasCardOne 
global canvasCardTwo 
global canvasCardThree
global image1
global image2
global image3

#--------------------------------------------------------------------------#

#Purpose: To create a hand that contains two cards.
class twoCard:
    def __init__(self, cardOne, cardTwo) :
        self.cardOne = cardOne
        self.cardTwo = cardTwo

#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To generate a card between the values of "Ace" to "King".
#Parameters: None
#Return Value: The value for the card, in the inclusive range 2-14. 
def getCard (): 
    card = random.randint(2,14)
    return card

#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To create an object with two "cards" inside.
#Parameters: None
#Return Value: The "hand" object.
def getHand () :
    return twoCard(getCard(),getCard())

#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To obtain a hand, and print out it's components.
#Parameters: The card.
#Return Value: The value of each card.
def printHand (twoCard) :

    global canvasCardOne
    global canvasCardTwo
    global image1
    global image2
    
    cardOne = twoCard.cardOne
    cardTwo = twoCard.cardTwo
    suit = ""
    s = random.randint(1,4)
    
    if s == 1:
        suit = "h"
    elif s == 2:
        suit = "c"
    elif s == 3:
        suit = "d"
    else:
        suit = "s"

    if cardOne == 10:
        cardOne = "t" 
    elif cardOne == 11:
        cardOne = "j" 
    elif cardOne == 12:
        cardOne = "q" 
    elif cardOne == 13:
        cardOne = "k"
    elif cardOne == 14:
        cardOne = "a"
        
    
    image1 = PhotoImage(file=str(cardOne)+suit+".gif")
    canvasCardOne.create_image(0,0,image=image1,anchor=NW)
    
    s = random.randint(1,4)
    
    if s == 1:
        suit = "h"
    elif s == 2:
        suit = "c"
    elif s == 3:
        suit = "d"
    else:
        suit = "s"

    if cardTwo == 10:
        cardTwo = "t" 
    elif cardTwo == 11:
        cardTwo = "j" 
    elif cardTwo == 12:
        cardTwo = "q" 
    elif cardTwo == 13:
        cardTwo = "k"
    elif cardTwo == 14:
        cardTwo = "a"

    image2 = PhotoImage(file=str(cardTwo)+suit+".gif")
    canvasCardTwo.create_image(0,0,image=image2,anchor=NW)
#--------------------------------------------------------------------------#    
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To determine the type of hand of the given hand.
#Parameters: The hand object.
#Return Value: Whether the hand is pair, consecutive, or non-consecutive.
def handType (twoCard) :
    if twoCard.cardOne == twoCard.cardTwo:
        handType = "pair"
    elif abs(twoCard.cardOne - twoCard.cardTwo) == 1:
        handType = "consecutive"
    else:
        handType = "non-consecutive"
    return handType

#--------------------------------------------------------------------------#    
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To determine the spread of the hand.
#Parameters: The hand.
#Return Value: The spread.
def spread (twoCard) :
    cardOne = twoCard.cardOne
    cardTwo = twoCard.cardTwo
    if cardOne - cardTwo == 0:
        spread = 0
    else:
        spread = abs(cardOne - cardTwo) - 1
    return spread

#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To determine the payout of the given hand.
#Parameters: The hand.
#Return Value: The payout of the hand.
def payout (twoCard) :
    cardSpread = spread(twoCard)
    if cardSpread == 1:
        payout = 5
    elif cardSpread == 2:
        payout = 4
    elif cardSpread == 3:
        payout = 2
    else:
        payout = 1
    return payout

#--------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To find out if a third card is between the two values of the hand.
#Parameters: The hand, and the third card.
#Return Value: True or false, depending on if the third card is between the two cards of the hand.
def between (twoCard,thirdCard) :
    if twoCard.cardOne > twoCard.cardTwo:
        firstCard = twoCard.cardTwo
        secondCard = twoCard.cardOne
    else:
        firstCard = twoCard.cardOne
        secondCard = twoCard.cardTwo


    if thirdCard > firstCard and thirdCard < secondCard:
        between = True
    else:
        between = False
    return between
    

#--------------------------------------------------------------------------#

#Author: Mohit Patel
#Date: Oct 10, 2014
#Purpose: To return the value of the thirdCard.
#Parameters: The smallest and largest number outside the range of integers allowed.
#Return Value: A positive integer within the given range.

def printCard(cardThree):

    global canvasCardThree
    global image3

    s = random.randint(1,4)
    suit = ""
    
    if s == 1:
        suit = "h"
    elif s == 2:
        suit = "c"
    elif s == 3:
        suit = "d"
    else:
        suit = "s"

    if cardThree == 10:
        cardThree = "t" 
    elif cardThree == 11:
        cardThree = "j" 
    elif cardThree == 12:
        cardThree = "q" 
    elif cardThree == 13:
        cardThree = "k"
    elif cardThree == 14:
        cardThree = "a"

    image3 = PhotoImage(file=str(cardThree)+suit+".gif")
    canvasCardThree.create_image(0,0,image=image3,anchor=NW)

#--------------------------------------------------------------------------#

#Author: Mohit Patel
#Date: Nov 03, 2014
#Purpose: To begin the program and show the first two cards.
#Parameters: The first bet, and the current purse value.
#Return Value: The various GUI elements of the program.
def firstBet (strBet,purse):

    #To allow the hand value to be transferred between firstBet and secondBet
    global previousHand
    global canvasCardThree

    if strBet.isdigit() == False:
        prompt.set("Your bet is not a valid integer. Please enter a number between 1 and "+str(purse)+".")
        Win.set(" ")
    elif int(strBet) < 1 or int(strBet) > purse:     
        prompt.set("Your bet is out of range. Please enter a number between 1 and "+str(purse)+".")
        Win.set(" ")
    else:
        canvasCardThree.delete("all")
        bet = int(strBet)
        hand = getHand()
        printHand(hand)
        if handType(hand) == "pair":                
                thirdCard = getCard()
                printCard(thirdCard)
                if thirdCard == hand.cardOne:
                    Win.set("You have earned $" + str(bet*11)+"! :)")
                    purse = purse + bet*11
                    prompt.set("Unbelievable!! Your third card is the same as your first pair of cards!! \
                               You have earned 11 times your bet!")
                else:
                    prompt.set("It was a tie. You did not lose anything!")
                    Win.set(" ")
        elif handType(hand) == "consecutive":
            prompt.set("Your cards are consecutive; therefore, you did not lose anything!")
            Win.set(" ")
        else:
            if bet < (purse-bet):
                prompt.set("Your cards are not consecutive. You must make an additional bet between 0 and "+str(bet)+" (inclusive).")
            else:
                prompt.set("Your cards are not consecutive. You must make an additional bet between 0 and "+str(int(purse)-int(bet))+" (inclusive).")
            Win.set(" ")
            btnPrompt.set("Place your second bet!")
            btnFirstBet.grid_remove()
            btnSecondBet.grid(row=4,column=0,columnspan = 1,padx = 10, pady = 5,sticky=W)
            entryBet1.grid_remove()
            entryBet2.grid (row= 3 , column = 0, padx = 0, pady = 5,sticky=E)
            betPrompt.set(value = " Bet #2:")
            previousHand = hand
        Purse.set(purse)
        pursePrompt.set("Your current purse has: $" + str(purse))

            
            

#--------------------------------------------------------------------------#


#Author: Mohit Patel
#Date: Nov 03, 2014
#Purpose: To run the next series of events with the next bet.
#Parameters: The first bet, second bet, and current purse.
#Return Value: The gain or loss in the purse.

def secondBet(strBet1,strBet2,purse):

    #To return the value of the hand used in firstBet
    global previousHand
    hand = previousHand
    inRange = False
    if strBet2.isdigit() == False:
        closerBet = purse - int(strBet1)
        if purse-int(strBet1)>int(strBet1):
            closerBet = int(strBet1)
        prompt.set("Your bet is not a valid integer. Please re-enter a bet between 0 and " + str(closerBet)+ ".")
    elif int(strBet1) < (purse-int(strBet1)):
        if int(strBet2) >= 0 and int(strBet2) <= purse:
            inRange = True
        else:
            prompt.set("Your bet is out of range. Please enter a number between 0 and "+strBet2+" (inclusive).")
    else:
        if int(strBet2) >= 0 and int(strBet2)<= (purse - int(strBet1)):
            inRange = True
        else:
            prompt.set("Your bet is out of range. Please enter a number between 0 and " + str(purse - int(strBet1)) + ".")
    if inRange == True:
        bet1 = int(strBet1)
        bet2 = int(strBet2)
        finalBet = bet1 + bet2
        thirdCard = getCard()
        printCard(thirdCard)
        if between(hand,thirdCard):
            prompt.set("Your third card is between your first two cards! You win!")
            Win.set("You have earned $" + str(finalBet*payout(hand))+"!")
            purse = purse + finalBet * payout(hand)
            
        else:
            prompt.set("Uh oh! Your third card is not between your first two cards! You lose your bet! Sorry!")
            Win.set("You have lost $" +str(finalBet)+"! :(")
            purse = purse - finalBet
        print(purse)
        Purse.set(purse)
        pursePrompt.set("Your current purse has: $" + str(purse))
        btnSecondBet.grid_remove()
        entryBet2.grid_remove()
        if purse == 0:
            prompt.set("Oh no! You are out of money! Better luck next time!")
            btnExit.grid(row=4,column=0,columnspan = 1,padx = 10, pady = 5,sticky=W)
            betPrompt.set(value = "No bet!")
            
        else:
            btnFirstBet.grid(row=4,column=0,columnspan = 1,padx = 10, pady = 5,sticky=W)
            btnSecondBet.grid_remove()
            entryBet1.grid (row=3,column = 0, padx = 0, pady = 0,sticky=E)
            btnPrompt.set("Place your first bet!")
            betPrompt.set(value = " Bet #1:")

#--------------------------------------------------------------------------#

#Author: Mohit Patel
#Date: Nov 17, 2014
#Purpose: To inform the user that they have clicked options on the menubar.
#Parameters: The "click" event
#Return Value: Information regarding their interesting selection.

def inDevelopment():  
    print("Thank you for playing Red Dog! As interested as you are in our advanced options " +\
          "such as copying and pasting, " +\
          "options such as these are currently not available at the moment; please anticipate " + \
          "a new and improved beta version, coming soon to a computer science class near you!")
#--------------------------------------------------------------------------#
#GUI
# create a pulldown menu, and add it to the menu bar
filemenu = Menu(menubar, tearoff=0)
filemenu.add_command(label="Open", command=lambda:inDevelopment())
filemenu.add_command(label="Save", command=lambda:inDevelopment())
filemenu.add_separator()
filemenu.add_command(label="Exit",command=lambda:root.destroy())
menubar.add_cascade(label="File", menu=filemenu)

# create more pulldown menus
editmenu = Menu(menubar, tearoff=0)
editmenu.add_command(label="Cut", command=lambda:inDevelopment())
editmenu.add_command(label="Copy", command=lambda:inDevelopment())
editmenu.add_command(label="Paste", command=lambda:inDevelopment())
menubar.add_cascade(label="Edit", menu=editmenu)
helpmenu = Menu(menubar, tearoff=0)
helpmenu.add_command(label="About", command=lambda:inDevelopment())
menubar.add_cascade(label="Help", menu=helpmenu)


# display the menu
root.config(menu=menubar)


lblPurse = Label(root,textvariable = pursePrompt, justify=LEFT, width=25,height = 2,font=("TrebuchetMS","12","bold"),bg = "green",fg="yellow")
lblPurse.grid(row=0,column=0,padx = 0, pady = 0,sticky=W) 
lblPrompt = Label(root,textvariable = prompt,width=20,height = 5,font=("TrebuchetMS","12","bold"),wraplength=200,bg = "green",fg="yellow")
lblPrompt.grid(row=1,column=0, columnspan = 1,padx = 0, pady = 5,sticky=W)
border = Frame(root,relief=GROOVE,borderwidth=30, bg="red")
border.grid(row=2,column=0,sticky=E,padx=0,pady=0)
canvasCardOne = Canvas(border, width = 70, height = 93,bg = "green",highlightthickness=0)
canvasCardOne.grid(row=0,column=0, columnspan = 1,padx = 10, pady = 5,sticky=W)
canvasCardTwo = Canvas(border, width = 70, height = 93,bg = "green",highlightthickness=0)
canvasCardTwo.grid(row=0,column=1, columnspan = 1,padx = 10, pady = 5,sticky=W)
canvasCardThree = Canvas(border, width = 70,height = 93,bg = "green",highlightthickness=0)
canvasCardThree.grid(row=0,column=2, columnspan = 1,padx = 10, pady = 5,sticky=W)
lblBet = Label(root,textvariable = betPrompt, width=6,height = 2,font=("Arial","30","bold"),justify=LEFT,bg = "green")
lblBet.grid(row=3,column=0, columnspan = 1,padx = 0, pady = 50,sticky=W)
entryBet1 = Entry(root, width = 8, textvariable = bet1,font=("Arial","30","bold"),justify=LEFT)
entryBet1.grid (row=3,column = 0, padx = 0, pady = 5,sticky=E)
entryBet2 = Entry(root, width = 8, textvariable = bet2,font=("Arial","30","bold"),justify=LEFT)
btnFirstBet = Button(root,textvariable = btnPrompt, width = 50, height = 2, command = lambda:firstBet(bet1.get(),Purse.get()))
btnFirstBet.grid(row=4,column=0,columnspan = 1,padx = 10, pady = 0,sticky=W)
btnSecondBet = Button(root,textvariable = btnPrompt, width = 50, height = 2, command = lambda:secondBet(bet1.get(),bet2.get(),Purse.get()))
lblWin = Label(root,textvariable = Win, width=20,height = 2,font=("Arial","19","bold"),bg = "green")
lblWin.grid(row=5,column=0, columnspan = 1,padx = 5, pady = 0,sticky="s")
btnExit = Button(root, text = "GAME OVER", width = 50, height = 2, command = lambda:root.destroy())
border = Frame(root,relief=SUNKEN,borderwidth=300, bg="red")
border.grid(row=0,column=2,sticky=W,padx=10,pady=5)

mainloop()
