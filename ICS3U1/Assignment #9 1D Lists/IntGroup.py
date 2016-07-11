#Author: Mohit Patel
#Date: January 6, 2015
#Purpose: To create a program which makes use of the list.
#------------------------------------------------------------#
import random
from tkinter import*
root = Tk()
root.title("IntGroup")
root.config(width=1000,height=500,bg="sky blue")
Size1 = StringVar()
Size1.set(0)
Size2 = StringVar()
Size2.set(0)
Seq1 = IntVar()
Seq1.set(0)
Seq2 = IntVar()
Seq2.set(0)
Answer = StringVar()
Answer.set("")
IntGroup1 = StringVar()
IntGroup1.set("Please choose a sequence and size for both of the int groups.")
IntGroup2 = StringVar()
IntGroup2.set("")
firstTime = True
# IntGroup class
# Fields:
#   size: An integer representing the size of the IntGroup.
#   list: A list representing the integer values of the IntGroup.
# Methods:
#   __str__: Returns the intGroup in the format of list and then size.
#   initAsNum: Initializes the list with values determined by the size.
#   initAsSequence: Initializes the list with consecutive and ascending values.
#   initAsFib: Initializes the list with fibonacci numbers.
#   calcTotal: Calculates the total of the values in the list.
#   calcMean: Calculates the average value of the list.
#   findLargest: Returns the largest element of the list.
#   calcFreq: Calculates the frequency of a given value.
#   insertAt: Inserts a value in the given position of the list.
#   removeAt: Removes a value in the given position of the list.
#   removeAll: Removes all values from the list.
#   findFirst: Returns the position of the first value in the list.
#   reverse: Inverts the order of the list; first items become last, and last items become first.
#   isSorted: Determines if the list is in ascending order.
#   merge: Combines two sorted intGroups into a new intGroup with all elements and sorted.
#   __eq__: Returns if two intGroups are equal.
#   __le__: Determines if the first intGroup is less than or equal to the second intGroup.
#   __lt__: Determines if the first intGroup is less than the second intGroup.
#   __ge__: Determines if the first intGroup is greater than or equal to the second intGroup.
#   __gt__: Determines if the first intGroup is greater than the second intGroup.
#   __ne__: Determines if the first intGroup is not equal to the second intGroup.
#   __add__: Returns an unsorted list with the contents of the first and second intGroups.
class IntGroup:
    # Constructor
    # Parameters: A given size, corrected to 0.
    def __init__(self,size=0):
        if not(str(size).isdigit()):
            size = 0
        elif size < 0:
            size = 0
        self.size = size
        self.list = []
        for count in range(0,self.size):
            self.list.append(random.randint(0,size))
            
    # __str__
    # Purpose: Converts the intGroup object into a string.
    # Parameters: None.
    def __str__(self):
        return str(self.list) + " size: " + str(self.size)
    
    # initAsNum
    # Purpose: Initializes the list with values determined by the size.
    # Parameters: Size.
    def initAsNum(self,userSize=0):
        self.size = userSize
        self.list = []
        for intCount in range(1,userSize + 1):
            self.list.append(userSize)
            
    # initAsSequence
    # Purpose: Initializes the list with consecutive and ascending values.
    # Parameters: Size.    
    def initAsSequence(self,userSize=0):
        self.size = userSize
        self.list = []
        for intCount in range(1,userSize+1):
            self.list.append(intCount)
            
    # initAsFib
    # Purpose: Initializes the list with fibonacci numbers.
    # Parameters: Size. 
    def initAsFib(self,userSize=0):
        self.size = userSize
        self.list = []
        twoBefore = 1
        oneBefore = 1
        for intCount in range(1,userSize+1):
            if len(self.list) == 0:
                self.list.append(1)
                oneBefore = 1
            elif len(self.list) == 1:
                self.list.append(1)
                twoBefore = 1
            else:
                current = oneBefore + twoBefore
                twoBefore = oneBefore
                oneBefore = current
                self.list.append(current)
                
    # calcTotal
    # Purpose: Returns the sum of the values in the list.
    # Parameters: None. 
    def calcTotal(self):
        total = 0
        for count in range(0,self.size):
            total = total + self.list[count]
        return total
    
    # calcMean
    # Purpose: Returns the mean of the values in the list.
    # Parameters: None. 
    def calcMean(self):
        return self.calcTotal() / self.size
    
    # findLargest
    # Purpose: Returns the value of the largest item on the list.
    # Parameters: None. 
    def findLargest(self):
        largest = -1
        for count in range(0,self.size):
            if self.list[count] > largest:
                largest = self.list[count]
        return largest
    
    # calcFreq
    # Purpose: Returns the frequency of the given value.
    # Parameters: A number, which will have it's frequency determined. 
    def calcFreq(self,inputNumber):
        freq = 0
        for count in range(0,self.size):
            if self.list[count] == inputNumber:
                freq = freq + 1
        return freq
    
    # insertAt
    # Purpose: Inserts a given value at the given position.
    # Parameters: A position and a value.
    def insertAt(self,position,value):
        if position < 0:
            position = 0
        elif position >= self.size:
            position = self.size - 1
        self.list.insert(position,value)
        self.size = self.size + 1
        
    # removeAt
    # Purpose: Removes a value in the given position.
    # Parameters: The position of the removed item.
    def removeAt(self,position):
        if position < 0:
            position = 0
        elif position >= self.size:
            position = self.size - 1
        del self.list[position]
        self.size = self.size - 1
        
    # removeAll
    # Purpose: Removes all the values in the list of the given value.
    # Parameters: The value to be removed from the list.
    def removeAll(self,value):
        if value in self.list:
            count = 0
            while count < self.size:
                if value == self.list[count]:
                    self.removeAt(count)
                else:
                    count = count + 1
                    
    # findFirst
    # Purpose: Returns the position of the first value found in the list.
    # Parameters: The value to be found.
    def findFirst(self,value):
        count = 0
        found = -1
        while found == -1 and count < self.size:
            if self.list[count] == value:
                found = count
            else:
                count = count + 1
        return found
    
    # reverse
    # Purpose: Inverts the order of the list, making the first objects become last, and vice versa.
    # Parameters: None.
    def reverse(self):
        for count in range(0,self.size):
            self.insertAt(count,self.list[self.size-1])
            self.removeAt(self.size-1)
            
    # isSorted
    # Purpose: Returns if the list is sorted.
    # Parameters: None.
    def isSorted(self):
        sort = True
        if self.size > 1:
            for count in range(0,self.size-1):
                if self.list[count] > self.list[count+1]:
                    sort = False
        return sort
    
    # merge
    # Purpose: Returns an intGroup that is the sorted sum of two intGroups.
    # Parameters: The second intGroup.
    
    def merge(self,secondIntGroup):
        mergedGroup = IntGroup(0)
        if self.isSorted() and secondIntGroup.isSorted():
            firstCount = 0
            secondCount = 0
            mergedCount = 0
            while (firstCount < self.size) or (secondCount < secondIntGroup.size):
                if firstCount < self.size and secondCount < secondIntGroup.size:
                    if self.list[firstCount]<secondIntGroup.list[secondCount]:
                        mergedGroup.insertAt(mergedCount,self.list[firstCount])
                        firstCount = firstCount + 1
                    else:
                        mergedGroup.insertAt(mergedCount,secondIntGroup.list[secondCount])
                        secondCount = secondCount + 1
                elif secondCount < secondIntGroup.size:
                    mergedGroup.insertAt(mergedCount,secondIntGroup.list[secondCount])
                    secondCount = secondCount + 1
                else:
                    mergedGroup.insertAt(mergedCount,self.list[firstCount])
                    firstCount = firstCount + 1
                mergedCount = mergedCount + 1
            mergedGroup.insertAt(0,mergedGroup.list[-1])
            mergedGroup.removeAt(len(mergedGroup.list)-1)
        return mergedGroup
    
    # __eq__
    # Purpose: Determines if the first list is equal to the second list.
    # Parameters: The second IntGroup.
    def __eq__(self,secondIntGroup):
        return self.list == secondIntGroup.list
    
    # __le__
    # Purpose: Determines if the first list is less than or equal to the second list.
    # Parameters: The second IntGroup.
    def __le__(self,secondIntGroup):
        return self.list <= secondIntGroup.list
    
    # __lt__
    # Purpose: Determines if the first list is less than the second list.
    # Parameters: The second IntGroup.
    def __lt__(self,secondIntGroup):
        return self.list < secondIntGroup.list
    
    # __ge__
    # Purpose: Determines if the first list is greater than or equal to the second list.
    # Parameters: The second IntGroup.
    def __ge__(self,secondIntGroup):
        return self.list >= secondIntGroup.list
    
    # __gt__
    # Purpose: Determines if the first list is greater than the second list.
    # Parameters: The second IntGroup.
    def __gt__(self,secondIntGroup):
        return self.list > secondIntGroup.list
    
    # __ne__
    # Purpose: Determines if two intgroups are not equal to each other.
    # Parameters: The second IntGroup.
    def __ne__(self,secondIntGroup):
        return self.list != secondIntGroup.list
    
    # __add__
    # Purpose: Returns a list that is the sum of two IntGroups.
    # Parameters: The second IntGroup.
    def __add__(self,secondIntGroup):
        return self.list + secondIntGroup.list

#Author: Mohit Patel 
#Date: January 10, 2015
#Purpose: To display two intGroups, given default initiating values.
#Parameters: None.
#Return Value: The visible intGroups.
def showIntGroup():
    global firstTime
    global producedIntGroup1
    global producedIntGroup2
    if firstTime == True:
        firstTime = False
        lblIntGroup2.place(x=400,y=150)
        btnEq.place(x=400,y=250)
        btnLe.place(x=450,y=250)
        btnLt.place(x=500,y=250)
        btnGe.place(x=550,y=250)
        btnGt.place(x=600,y=250)
        btnNe.place(x=650,y=250)
        btnAdd.place(x=700,y=250)
        btnMerge.place(x=750,y=250)
        lblThirdOutput.place(x=400,y=350)
    size1 = Size1.get()
    if not(size1.isdigit()):
        IntGroup1.set("Please enter a valid integer.")
    elif int(size1) < 0:
        IntGroup1.set("Please enter a positve size 1 value.")
    elif int(size1) > 44:
        IntGroup1.set("Please enter your size 1 in the range of 0 to 44.")
    else:
        size1 = int(size1)
        group1 = IntGroup()
        if Seq1.get() == 0:
            group1.initAsSequence(size1)
        elif Seq1.get() == 1:
            group1.initAsNum(size1)
        else:
            group1.initAsFib(size1)
        IntGroup1.set(group1)
        producedIntGroup1 = group1
    size2 = Size2.get()
    if not(size2.isdigit()):
        IntGroup2.set("Please enter a valid integer for size 2.")
    elif int(size2) < 0:
        IntGroup2.set("Please enter a positve value for size 2.")
    elif int(size2) > 44:
        IntGroup2.set("Please enter your size 2 in the range of 0 to 44.")
    else:
        size2 = int(size2)
        group2 = IntGroup()
        if Seq2.get() == 0:
            group2.initAsSequence(size2)
        elif Seq2.get() == 1:
            group2.initAsNum(size2)
        else:
            group2.initAsFib(size2)
        IntGroup2.set(group2)
        producedIntGroup2 = group2
def createAnswer(answer):
    global producedIntGroup1
    global producedIntGroup2
    result = ""
    firstGroup = producedIntGroup1
    secondGroup = producedIntGroup2
    if answer == "=":
        result = (firstGroup == secondGroup)
    elif answer == "<=":
        result = (firstGroup <= secondGroup)
    elif answer == "<":
        result = (firstGroup < secondGroup)
    elif answer == ">=":
        result = (firstGroup >= secondGroup)
    elif answer == ">":
        result = (firstGroup > secondGroup)
    elif answer == "!=":
        result = (firstGroup != secondGroup)

    if result == 0:
        result = "   " + answer + " is False"
    else:
        result = "   " + answer + " is True"
    if answer == "+":
        result = firstGroup + secondGroup
        if len(result) > 44:
            result = "Too large to merge!"
        else:
            result = str(result)
    elif answer == "merge": 
        result = firstGroup.merge(secondGroup)
        if result.size > 44:
            result = "Too large to merge!"
        else:
            result = str(result)
    Answer.set(result)


producedIntGroup1 = IntGroup(0)
producedIntGroup2 = IntGroup(0)

frameOptions1 = Frame(root,width=300,height=200,bg="green",bd=10,relief="groove")
frameOptions1.place(x=0,y=0)
btnSequence1 = Radiobutton(frameOptions1,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Consecutive Sequence",anchor=W,variable=Seq1,value=0,font=("Arial","8","bold"))
btnSequence1.place(x=10,y=10)
btnNum1 = Radiobutton(frameOptions1,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Repetitive Sequence",anchor=W,variable=Seq1,value=1,font=("Arial","8","bold"))
btnNum1.place(x=10,y=60)
btnFib1 = Radiobutton(frameOptions1,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Fibbonacci Sequence",anchor=W,variable=Seq1,value=2,font=("Arial","8","bold"))
btnFib1.place(x=10,y=110)
lblSize1 = Label(frameOptions1,bd=5,relief="groove",text="Size of first IntGroup:",font=("Arial","8","bold"))
lblSize1.place(x=10,y=152)
entrySize1 = Entry(frameOptions1,width=15,bd=5,relief="groove",textvariable=Size1,font=("Arial","8","bold"))
entrySize1.place(x=150,y=152)
frameOptions2 = Frame(root,width=300,height=200,bg="green",bd=10,relief="groove")
frameOptions2.place(x=0,y=200)
btnSequence2 = Radiobutton(frameOptions2,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Consecutive Sequence",anchor=W,variable=Seq2,value=0,font=("Arial","8","bold"))
btnSequence2.place(x=10,y=10)
btnNum2 = Radiobutton(frameOptions2,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Repetitive Sequence",anchor=W,variable=Seq2,value=1,font=("Arial","8","bold"))
btnNum2.place(x=10,y=60)
btnFib2 = Radiobutton(frameOptions2,width=30,height=1,bg="SpringGreen2",bd=10,relief="groove",text="Fibbonacci Sequence",anchor=W,variable=Seq2,value=2,font=("Arial","8","bold"))
btnFib2.place(x=10,y=110)
lblSize2 = Label(frameOptions2,bd=5,relief="groove",text="Size of second IntGroup:",font=("Arial","8","bold"))
lblSize2.place(x=10,y=152)
entrySize2 = Entry(frameOptions2,width=15,bd=5,relief="groove",textvariable=Size2,font=("Arial","8","bold"))
entrySize2.place(x=150,y=152)

btnGo = Button(root,width=28,height=4,command=lambda:showIntGroup(),text="Create IntGroups!",font=("Arial","12","bold"),bg="firebrick1",bd=10,relief="groove")
btnGo.place(x=0,y=400)

lblIntGroup1 = Label(root,textvariable=IntGroup1,width=49,height=5,anchor=W,font=("Arial","12","bold"),wraplength=500,bg="DarkGoldenrod1",bd=10,relief="groove")
lblIntGroup1.place(x=400,y=50)
lblIntGroup2 = Label(root,textvariable=IntGroup2,width=49,height=5,anchor=W,font=("Arial","12","bold"),wraplength=500,bg="DarkGoldenrod2",bd=10,relief="groove")
btnEq = Button(root,command=lambda:createAnswer("="),width=5,height=5,text="=",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnLe = Button(root,command=lambda:createAnswer("<="),width=5,height=5,text="<=",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnLt = Button(root,command=lambda:createAnswer("<"),width=5,height=5,text="<",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnGe = Button(root,command=lambda:createAnswer(">="),width=5,height=5,text=">=",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnGt = Button(root,command=lambda:createAnswer(">"),width=5,height=5,text=">",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnNe = Button(root,command=lambda:createAnswer("!="),width=5,height=5,text="Not \n =",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnAdd = Button(root,command=lambda:createAnswer("+"),width=5,height=5,text="+",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=5,relief="groove")
btnMerge = Button(root,command=lambda:createAnswer("merge"),width=14,height=5,text="merge",font=("Arial","12","bold"),bg="DarkGoldenrod3",bd=8,relief="groove")
lblThirdOutput = Label(root,textvariable=Answer,width=49,height=5,anchor=W,font=("Arial","12","bold"),wraplength=500,bg="orange3",bd=10,relief="groove")

