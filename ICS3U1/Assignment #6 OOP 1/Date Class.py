#Author: Mohit Patel
#Date: November 17, 2014
#Purpose: To create a date class which allows entry and output of a date,
#and prints the appropriate calender.
#-------------------------------------------------------------#
from tkinter import*
import datetime
root = Tk()
root.title("Calendar")
root.config(width = 450, height = 660, bg = "sky blue")
Prompt = StringVar()
Prompt.set(value="Please enter a day, month, and year!")
now = datetime.datetime.now()
Day = StringVar()
Day.set(now.day)
Month = StringVar()
Month.set(now.month)
Year = StringVar()
Year.set(now.year)
Info = StringVar()
Info.set("")
# Date class
# Fields:
#   day: An integer between 1-31, representing the day of the current date.
#   month: An integer between 1-12, representing the month of the current date.
#   year: An integer greater than 1599, representing the year of the current date.
# Methods:
#   returnMonthName: Returns the string version of the given month.
#   returnLeapYear: Returns True/False depending on if the current year is a leap year.
#   ReturnMaxDay: Returns the total possible amount of days in the current month.
#   calcZeller: Calculates the day of the week  of the appropriate day in the given day, month, and year.
#   returnDayName: Returns the string version of the current day.
#   calcValid: Determines if the date is considered valid.
#   getDate: Obtains the day, month, and year manually through the console.
#   __str__: Allows the object to be printed as a string in the form "Monday, 24 October 2011".
#   displayCalender: Displays the appropriate calender on the GUI.
#   dayOfYear: Determines what the position is of the current day, compared to the total days of the year.
class Date:
    # Constructor
    # Parameters: Day, month, and year.
    def __init__(self,day=1,month=1,year=2000):
        self.day = day
        self.month = month
        self.year = year
    # returnMonthName
    # Purpose: Returns the string version of the current month.
    # Parameters: None.
    def returnMonthName(self):
        monthName = ""
        if self.month == 1:
            monthName = "January"
        elif self.month == 2:
            monthName = "February"
        elif self.month == 3:
            monthName = "March"
        elif self.month == 4:
            monthName = "April"
        elif self.month == 5:
            monthName = "May"
        elif self.month == 6:
            monthName = "June"
        elif self.month == 7:
            monthName = "July"
        elif self.month == 8:
            monthName = "August"
        elif self.month == 9:
            monthName = "September"
        elif self.month == 10:
            monthName = "October"
        elif self.month == 11:
            monthName = "November"
        else:
            monthName = "December"
        return monthName
    # returnLeapYear
    # Purpose: Returns if the current year is a leap year.
    # Parameters: None.    
    def returnLeapYear(self):
        isLeapYear = False
        if self.year % 400 == 0 or (self.year%100 !=0 and self.year%4==0):
            isLeapYear = True
        return isLeapYear
    # ReturnMaxDay
    # Purpose: Returns the maximum  amount of days within the current month.
    # Parameters: None.
    def ReturnMaxDay(self):
        if self.month == 2:
            if self.returnLeapYear() == False:
                maxDay = 28
            else:
                maxDay = 29
        elif self.month == 4 or self.month == 6 or self.month == 9 or\
             self.month == 11:
                    maxDay = 30
        else:
            maxDay = 31
        return maxDay
    # calcZeller
    # Purpose: Returns the position of the current day within the week, from 0-6.
    # Parameters: None.    
    def calcZeller(self):
        m = self.month - 2
        y = self.year
        if m <= 0:
            m = m + 12
            y = y - 1
        p = y // 100
        r = y % 100
        return(self.day + (26 * m - 2)// 10 + r + r//4 + p// 4 + 5 * p) % 7
    # returnDayName
    # Purpose: Returns the string version of the current day.
    # Parameters: None.    
    def returnDayName(self):
        dayName = ""
        if self.calcZeller() == 0:
            dayName = "Sunday"
        elif self.calcZeller() == 1:
            dayName = "Monday"
        elif self.calcZeller() == 2:
            dayName = "Tuesday"
        elif self.calcZeller() == 3:
            dayName = "Wednesday"
        elif self.calcZeller() == 4:
            dayName = "Thursday"
        elif self.calcZeller() ==5:
            dayName = "Friday"
        else:
            dayName = "Saturday"
        return dayName
    # calcValid
    # Purpose: Determines if the current date is valid or not.
    # Parameters: None.
    def calcValid(self):
        valid = False
        self.day=str(self.day)
        self.month=str(self.month)
        self.year=str(self.year)
        if self.day.isdigit() and self.month.isdigit() and self.year.isdigit():
            self.day = int(self.day)
            self.month = int(self.month)
            self.year = int(self.year)
            if self.day >= 1 and self.day <= self.ReturnMaxDay() and \
            self.month >= 1 and self.month <= 12 and\
            self.year >= 1600:
                valid = True
        return valid
    # getDate
    # Purpose: Allows the programmer to manually enter the day, month, and years through the console.
    # Parameters: None.    
    def getDate(self):
        print("You are now entering the day of the date.")
        self.day = getPositiveInteger(1,31)
        print("You are not entering the month of the date.")
        self.month = getPositiveInteger(1,12)
        print("You are not entering the year of the date.")
        self.year = getPositiveInteger(1600,4000)
            
    # __str__
    # Purpose: Returns the current day in the form "Monday, 24 October 2011"
    # Parameters: None.
    def __str__(self):
        form = ""
        form += str(self.returnDayName()) + ", " + str(self.day) +\
               " " + str(self.returnMonthName()) + " " + str(self.year)
        return form
    # displayCalendar
    # Purpose: Visually shows the current date on the GUI.
    # Parameters: None.    
    def displayCalendar(self):
        global canvasCalendar
        canvasCalendar.create_text(200,50,text=str(self.returnMonthName())+ " " + str(self.year),font=("Arial","12","bold"),fill="dodgerblue2")
        canvasCalendar.create_text(20,80,text="Sun",font=("Arial","12","bold"))
        canvasCalendar.create_text(70,80,text="Mon",font=("Arial","12","bold"))
        canvasCalendar.create_text(120,80,text="Tue",font=("Arial","12","bold"))
        canvasCalendar.create_text(170,80,text="Wed",font=("Arial","12","bold"))
        canvasCalendar.create_text(220,80,text="Thu",font=("Arial","12","bold"))
        canvasCalendar.create_text(270,80,text="Fri",font=("Arial","12","bold"))
        canvasCalendar.create_text(320,80,text="Sat",font=("Arial","12","bold"))
        tempMonth = Date(1,self.month,self.year)
        x = tempMonth.calcZeller() * 50 + 20
        y = 120
        for count in range(1,self.ReturnMaxDay()+1):
            canvasCalendar.create_text(x,y,text=count,font=("Arial","12","bold"))
            if count == self.day:
                canvasCalendar.create_oval(x-20,y-20,x+20,y+20,outline="red",width=3)
            x = x + 50
            if x == 370:
                y = y + 30
                x = 20
        canvasCalendar.create_text(100,285,text="This is day " + self.dayOfYear() + " of the year.",font=("Arial","12","bold"))
    # dayOfYear
    # Purpose: Returns the position of the current day relative to the total days of the year.
    # Parameters: None.        
    def dayOfYear(self):
        monthValue = 0
        dayValue = self.day
        for count in range(1,self.month):
            previousMonth = Date(1,count,self.year)
            monthValue = monthValue + previousMonth.ReturnMaxDay()
        yearDay = dayValue + monthValue
        return str(yearDay)
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
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: November 20, 2014
#Purpose: To create a calender if the inputs are valid, or else prompt them of incorrect input.
#Parameters: The day, month, and year.
#Return Value: The appropriate calender or prompt. 
def calculate(day,month,year):
    global canvasCalendar
    day = str(day)
    month = str(month)
    year = str(year)
    canvasCalendar.delete("all")
    lblInfo.config(wraplength=0)
    myDate = Date(day,month,year)
    if myDate.calcValid() == True:
        Day.set(value=str(day))
        Month.set(value=str(month))
        Year.set(value=str(year))
        lblPrompt.place(x=0,y=0)
        Prompt.set("Now, you can enter another date, or use the buttons below to increase or decrease the century, decade, year, or month!")
        lblInfo.place(x=0,y=0)
        Info.set(str(myDate))
        myDate.displayCalendar()
        canvasCalendar.place(x=20,y=300)
        btnDownCentury.place(x=0,y=600)
        btnDownDecade .place(x=50,y=600)
        btnDownYear.place(x=100,y=600)
        btnDownMonth.place(x=150,y=600)
        btnCurrentDay.place(x=200,y=600)
        btnUpMonth.place(x=250,y=600)
        btnUpYear.place(x=300,y=600)
        btnUpDecade.place(x=350,y=600)
        btnUpCentury.place(x=400,y=600)
    else:
        lblInfo.place(x=0,y=0)
        Info.set("Please re-enter a valid date.")
        Prompt.set("Your entered date is invalid.")
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually lower their date's year by 100, if possible.
#Parameters: The day, month, and year.
#Return Value: The change of 100 less years to the calender, or prompt if inappropriate.
def downCentury(day,month,year):
    if year >= 1700:
        belowCentury = Date(day,month,year-100)
        if belowCentury.ReturnMaxDay() > day:
            day = belowCentury.ReturnMaxDay()
        year = year - 100
        calculate(day,month,year)
    else:
        canvasCalendar.delete("all")
        lblInfo.place(x=20,y=100)
        lblInfo.config(wraplength=300)
        Info.set("You cannot move down a century. Please reconsider your options.")
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually lower their date's year by 10, if possible.
#Parameters: The day, month, and year.
#Return Value: The change of 10 less years to the calender, or prompt if inappropriate.
def downDecade(day,month,year):
    if year >= 1610:
        belowDecade = Date(day,month,year-10)
        if belowDecade.ReturnMaxDay() > day:
            day = belowDecade.ReturnMaxDay()
        year = year - 10
        calculate(day,month,year)
    else:
        canvasCalendar.delete("all")
        lblInfo.place(x=20,y=100)
        lblInfo.config(wraplength=300)
        Info.set("You cannot move down a decade. Please reconsider your options.")
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually lower their date's year by 1, if possible.
#Parameters: The day, month, and year.
#Return Value: The change of 1 less year to the calender, or prompt if inappropriate.
def downYear(day,month,year):
    if year >= 1601:
        year = year - 1
        calculate(day,month,year)
    else:
        canvasCalendar.delete("all")
        lblInfo.place(x=20,y=100)
        lblInfo.config(wraplength=300)
        Info.set("You cannot move down a year. Please reconsider your options.")
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually lower their date's month by 1.
#Parameters: The day, month, and year.
#Return Value: The change of 1 less month to the calender.
def downMonth(day,month,year):
    if month == 1:
        month = 12
        downYear(day,month,year)
    else:
        month = month - 1
        belowMonth = Date(1,month,year)
        if belowMonth.ReturnMaxDay() < day:
            day = belowMonth.ReturnMaxDay()
        calculate(day,month,year)
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually increase their date's month by 1.
#Parameters: The day, month, and year.
#Return Value: The change of 1 higher month to the calender.
def upMonth(day,month,year):
    if month == 12:
        month = 1
        upYear(day,month,year)
    else:
        month = month + 1
        aboveMonth = Date(day,month,year)
        if aboveMonth.ReturnMaxDay() < day:
            day = aboveMonth.ReturnMaxDay()
        calculate(day,month,year)
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually increase their date's year by 1.
#Parameters: The day, month, and year.
#Return Value: The change of 1 higher year to the calender.
def upYear(day,month,year):
    aboveYear = Date(day,month,year+1)
    if aboveYear.ReturnMaxDay() < day:
        day = aboveYear.ReturnMaxDay()
    year = year + 1
    calculate(day,month,year)
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually increase their date's year by 10.
#Parameters: The day, month, and year.
#Return Value: The change of 10 higher years to the calender.
def upDecade(day,month,year):
    aboveDecade = Date(day,month,year+10)
    if aboveDecade.ReturnMaxDay() < day:
        day = aboveDecade.ReturnMaxDay()
    year = year + 10
    calculate(day,month,year)
#-----------------------------------------------------------------------------------------------------------------------------------------#
#Author: Mohit Patel
#Date: December 1, 2014
#Purpose: To allow the user to manually increase their date's year by 100.
#Parameters: The day, month, and year.
#Return Value: The change of 100 higher years to the calender.
def upCentury(day,month,year):
    aboveCentury = Date(day,month,year+100)
    if aboveCentury.ReturnMaxDay() < day:
        day = aboveCentury.ReturnMaxDay()
    year = year + 100
    calculate(day,month,year)
#GUIMain##############################################################################################################################################
lblPrompt = Label(root,textvariable=Prompt,width=100,height=5,font=("Arial","12","bold"),justify=LEFT,bg = "sky blue",anchor="nw",wraplength=400)
lblPrompt.place(x=0,y=0)
lblDay = Label(root,text = "Day", width=5,height = 2,font=("Arial","30","bold"),justify=LEFT,bg = "sky blue")
lblDay.place(x=0,y=60)
lblMonth = Label(root,text = "Month", width=5,height = 2,font=("Arial","30","bold"),justify=LEFT,bg = "sky blue")
lblMonth.place(x=150,y=60)
lblYear = Label(root,text = "Year", width=5,height = 2,font=("Arial","30","bold"),justify=LEFT,bg = "sky blue")
lblYear.place(x=300,y=60)
entryDay = Entry(root,width=4,textvariable=Day,font=("Arial","30","bold"),justify=LEFT)
entryDay.place(x=20,y=140)
entryMonth = Entry(root,width=4,textvariable=Month,font=("Arial","30","bold"),justify=LEFT)
entryMonth.place(x=170,y=140)
entryYear = Entry(root,width=4,textvariable=Year,font=("Arial","30","bold"),justify=LEFT)
entryYear.place(x=320,y=140)
btnCalculate = Button(root,width=10,text="Calculate!",height=2,font=("Arial","20","bold"),command=lambda:calculate(Day.get(),Month.get(),Year.get()))
btnCalculate.place(x = 120, y = 200)
canvasCalendar = Canvas(root, width = 400, height = 300,bg = "gold2",highlightthickness=0)
lblInfo = Label(canvasCalendar,textvariable = Info, width=40,height = 2,font=("Arial","12","bold"),justify=LEFT,bg = "gold2",wraplength=0)
btnDownCentury = Button(root,width=5,text="Cent.",height=2,font=("Arial","10","bold"),bg="firebrick1",command=lambda:downCentury(int(Day.get()),int(Month.get()),int(Year.get())))
btnDownDecade = Button(root,width=5,text="Decade",height=2,font=("Arial","10","bold"),bg="firebrick1",command=lambda:downDecade(int(Day.get()),int(Month.get()),int(Year.get())))
btnDownYear = Button(root,width=5,text="Year",height=2,font=("Arial","10","bold"),bg="firebrick1",command=lambda:downYear(int(Day.get()),int(Month.get()),int(Year.get())))
btnDownMonth = Button(root,width=5,text="Month",height=2,font=("Arial","10","bold"),bg="firebrick1",command=lambda:downMonth(int(Day.get()),int(Month.get()),int(Year.get())))
btnCurrentDay = Button(root,width=5,text="Today!",height=2,font=("Arial","10","bold"),command=lambda:calculate(now.day,now.month,now.year))
btnUpMonth = Button(root,width=5,text="Month",height=2,font=("Arial","10","bold"),bg="light green",command=lambda:upMonth(int(Day.get()),int(Month.get()),int(Year.get())))
btnUpYear = Button(root,width=5,text="Year",height=2,font=("Arial","10","bold"),bg="light green",command=lambda:upYear(int(Day.get()),int(Month.get()),int(Year.get())))
btnUpDecade = Button(root,width=5,text="Decade",height=2,font=("Arial","10","bold"),bg="light green",command=lambda:upDecade(int(Day.get()),int(Month.get()),int(Year.get())))
btnUpCentury = Button(root,width=5,text="Cent.",height=2,font=("Arial","10","bold"),bg="light green",command=lambda:upCentury(int(Day.get()),int(Month.get()),int(Year.get())))
mainloop()





