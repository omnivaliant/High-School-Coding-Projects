#Author: Mohit Patel
#Date: September 29, 2014
#Purpose: To create a program that will play the game of "Red Dog".
#--------------------------------------------------------------------------#
import random
import math

#--------------------------------------------------------------------------##

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
    cardOne = twoCard.cardOne
    cardTwo = twoCard.cardTwo
    
    if cardOne == 11:
        cardOne = "Jack"
    elif cardOne == 12:
        cardOne = "Queen"
    elif cardOne == 13:
        cardOne = "King"
    elif cardOne == 14:
        cardOne = "Ace"
        
    if cardTwo == 11:
        cardTwo = "Jack"
    elif cardTwo == 12:
        cardTwo = "Queen"
    elif cardTwo == 13:
        cardTwo = "King"
    elif cardTwo == 14:
        cardTwo = "Ace"
    
    print("Your first card is " + str(cardOne) + ".")
    print("Your second card is " + str(cardTwo) + ".")

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
#Date: Oct 10, 2014
#Purpose: To return the value of the thirdCard.
#Parameters: The smallest and largest number outside the range of integers allowed.
#Return Value: A positive integer within the given range.

def printCard(cardThree):
    
    if cardThree == 11:
        cardThree = "Jack"
    elif cardThree == 12:
        cardThree = "Queen"
    elif cardThree == 13:
        cardThree = "King"
    elif cardThree == 14:
        cardThree = "Ace"

    print("Your third card is " + str(cardThree) + ".")

#--------------------------------------------------------------------------#
    
#main
purse = 100
again = "Y"
secondBet = 0
print("Welcome to the game Red Dog! Will you come out rich? Let us find out!")
while (again == "Y" or again == "y") and purse > 0:
    print("Please make a bet to get the game started.")
    bet = getPositiveInteger(1, purse)
    hand = getHand()
    print()
    print()
    printHand(hand)
    print()
    print()
    if handType(hand) == "pair":
        print("Your hand is a pair!")
        thirdCard = getCard()
        print()
        print()
        print("Your third card is " + str(thirdCard) + ".")
        print()
        print()
        if thirdCard == hand.cardOne:
            purse = purse + bet*11
            print("Unbelievable!! Your third card is the same as your first pair of cards!!")
            print("You have earned eleven times your bet!")
        else:
            print("It was a tie. You did not lose anything!")
    elif handType(hand) == "consecutive":
        print("Your cards are consecutive; therefore, you did not lose anything!")
    else:
        print("Your cards are not consecutive. You must make an additional bet.")
        if bet < (purse - bet):
            secondBet = getPositiveInteger(0, bet)
        else:
            secondBet = getPositiveInteger(0, purse - bet)
        bet = bet + secondBet
        thirdCard = getCard()
        print()
        print() 
        printCard(thirdCard)
        print()
        print()
        if between(hand, thirdCard):
            print("Your third card is between your first two cards! You win!")
            purse = purse + bet * payout(hand)
        else:
            print("Uh oh! Your third card is not between your first two cards! You lose your bet! Sorry!")
            purse = purse - bet
    print("Your current purse is now $" + str(purse) + ".")
    
    if purse == 0:
        again = "n"
        print("Look's like you are all out of money! How unfortunate!")
    else:
        again = input("Would you like to play again? (Y/N): ")
        while not(again == "Y" or again == "y" or again == "N" or again == "n"):
            again = input("Please re-enter if you would like to play again. (Y/N): ")
        
print()
print()
print("Thank you for playing Red Dog!")

