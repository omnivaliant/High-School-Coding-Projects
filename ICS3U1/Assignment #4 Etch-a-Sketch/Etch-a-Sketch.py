#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To create an etch-a-sketch.
#------------------------------------------------------------#

from tkinter import *
import math
import random

class Point:
    def __init__(self,x = 0,y = 0):
        self.x = x
        self.y = y

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To draw an upwards facing line.
#Parameters: Length, thickness, and colour of the line.
#Return Value: Draws up.
def drawUp(length=0,thickness=10,color="red"):
    canvas.create_line(Point.x,Point.y,Point.x,Point.y-length,fill=color,width=thickness)
    Point.y = Point.y-length 
#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To draw a leftwards line.
#Parameters: Length, thickness, and colour of the line.
#Return Value: Draws left.
def drawLeft(length=0,thickness=10,color="red"):
    canvas.create_line(Point.x,Point.y,Point.x-length,Point.y,fill=color,width=thickness)
    Point.x = Point.x-length 
#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To draw a rightwards line.
#Parameters: Length, thickness, and colour of the line.
#Return Value: Draws right.
def drawRight(length=0,thickness=10,color="red"):
    canvas.create_line(Point.x,Point.y,Point.x+length,Point.y,fill=color,width=thickness)
    Point.x = Point.x+length 
#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To draw a downwards facing line.
#Parameters: Length, thickness, and colour of the line.
#Return Value: Draws down.
def drawDown(length=0,thickness=10,color="red"):
    canvas.create_line(Point.x,Point.y,Point.x,Point.y+length,fill=color,width=thickness)
    Point.y = Point.y+length 

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To draw a circle.
#Parameters: Width, thickness, and colour of the circle.
#Return Value: Draws a circle.
def drawCircle(width=10,thickness = 10,outline = "red", fill=""):
    canvas.create_oval(Point.x,Point.y,Point.x+width,Point.y+width,width=thickness,outline=outline,fill=fill)
    Point.y = Point.y+width

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 11, 2014
#Purpose: To set the coordinates of the cursor to the given values.
#Parameters: The x and y values of the cursor.
#Return Value: Sets the coordinates of the global variable.
def setCursorPoint(x, y):
    Point.x = x
    Point.y = y

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 16, 2014
#Purpose: To create a diagonal in the given angle and length.
#Parameters: The angle, distance, thickness, and colour of the line.
#Return Value: Draws a diagonal line.
def drawDiagonal(angle,length=50,thickness=10,color="red"):

    quadrant = getQuadrant(angle)
    quadrantAngle = getQuadrantAngle(angle)

    if quadrant == "1" or quadrant == "3":
        xPart = length * math.cos(math.radians(quadrantAngle))
        yPart = length * math.sin(math.radians(quadrantAngle))
    else:
        xPart = length * math.sin(math.radians(quadrantAngle))
        yPart = length * math.cos(math.radians(quadrantAngle))

    xyRatio = abs(xPart / yPart)

    xTotal = 0
    yTotal = 0

    if quadrant == "1":
        while yTotal < yPart:
            drawRight(xyRatio,thickness,color)
            drawUp(1,thickness,color)
            xTotal = xTotal + xyRatio
            yTotal = yTotal + 1
    elif quadrant == "2":
        while yTotal < yPart:
            drawLeft(xyRatio,thickness,color)
            drawUp(1,thickness,color)
            xTotal = xTotal + xyRatio
            yTotal = yTotal + 1
    elif quadrant == "3":
        while yTotal < yPart:
            drawLeft(xyRatio,thickness,color)
            drawDown(1,thickness,color)
            xTotal = xTotal + xyRatio
            yTotal = yTotal + 1
    else:
        while yTotal < yPart:
            drawRight(xyRatio,thickness,color)
            drawDown(1,thickness,color)
            xTotal = xTotal + xyRatio
            yTotal = yTotal + 1

    

    

    

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 17, 2014
#Purpose: To obtain the quadrant of a given angle.
#Parameters: The magnitude of the angle, up to 360 degrees.
#Return Value: The quadrant.
def getQuadrant(angle):
    if angle >= 0 and angle <= 90:
        quadrant = "1"
    elif angle > 90 and angle <= 180:
        quadrant = "2"
    elif angle > 180 and angle <= 270:
        quadrant = "3"
    else:
        quadrant = "4"
    return quadrant
        

#------------------------------------------------------------#
#Author: Mohit Patel
#Date: October 17, 2014
#Purpose: To get the angle within the quadrant, 
#Parameters: The magnitude of the angle, up to 360 degrees.
#Return Value: The angle clockwise of the axes.
def getQuadrantAngle(angle):
    if angle >= 0 and angle <= 90:
        quadrantAngle = angle
    elif angle > 90 and angle <= 180:
        quadrantAngle = angle - 90
    elif angle > 180 and angle <= 270:
        quadrantAngle = angle - 180
    else:
        quadrantAngle = angle - 270
    return quadrantAngle

#main


root = Tk()
root.title("Etch-A-Sketch!")
canvas = Canvas(root, width = 1500, height = 700)
canvas.config(background = "sky blue")
canvas.pack()

#Sky
setCursorPoint(1475,0)
drawCircle(45,50,"yellow","yellow")
for count in range(1,10):
    setCursorPoint(1500,10)
    drawDiagonal(170+count*20,100,10,"yellow")
for count in range(1,6):
    multiplier = random.randint(1,150)
    setCursorPoint(multiplier*10,count*30)
    drawCircle(50,10,"white","white")
    setCursorPoint(multiplier*10+30,count*30)
    drawCircle(50,10,"white","white")


#Birds
for count in range (1,6):
    setCursorPoint(count * 150 + 500,20)
    drawDiagonal(360 - (count * 10), 30, 5, "white")
    drawDiagonal(count * 10,30,5,"white")
#ICS3U1 Header
#I
setCursorPoint(10,10)
drawDown(32,5,"red")

#C
setCursorPoint(50,10)
drawLeft(30,5,"red")
drawDown(30,5,"red")
drawRight(30,5,"red")

#S
setCursorPoint(60,40)
drawRight(30,5,"red")
drawUp(15,5,"red")
drawLeft(30,5,"red")
drawUp(15,5,"red")
drawRight(30,5,"red")

#3
setCursorPoint(100, 40)
drawRight(30,5,"red")
drawUp(15,5,"red")
drawLeft(30,5,"red")
setCursorPoint(130,25)
drawUp(15,5,"red")
drawLeft(30,5,"red")

#U
setCursorPoint(140,10)
drawDown(30,5,"red")
drawRight(30,5,"red")
drawUp(30,5,"red")

#1
setCursorPoint(180,10)
drawDown(32,5,"red")

# Sun
setCursorPoint (1200, 40)
drawCircle(120,10,"yellow","yellow")

#Mohit Name
#M
setCursorPoint(100,500)
drawUp(300,10,"dodger blue")
drawDiagonal(315,150,10,"dodger blue")
drawDiagonal(45,150,10,"dodger blue")
drawDown(300,10,"dodger blue")

#O
setCursorPoint(340,200)
drawCircle(300,5,"dodger blue")


#H

for count in range(1,201):
    setCursorPoint(count + 700,350)
    drawUp(150-(0.7*count),1,"white")
for count in range(1,201):
    setCursorPoint(count+700,350)
    drawDown(150-(0.7*count),1,"light blue")
for count in range (1,201):
    setCursorPoint(900-count,200)
    drawDown(150-(0.7*count),1,"light blue")
for count in range(1,201):
    setCursorPoint(900-count,500)
    drawUp(150-(0.7*count),1,"white")

setCursorPoint(700,500)
drawUp(300,10,"dodger blue")
setCursorPoint(700,350)
drawRight(200,10,"dodger blue")
setCursorPoint(900,200)
drawDown(300,10,"dodger blue")


#I
setCursorPoint(1000,200)
drawDown(300,10,"dodger blue")

#T
setCursorPoint(1100,200)
drawRight(200,10,"dodger blue")
setCursorPoint(1200,200)
drawDown(300,10,"dodger blue")

#Happy Face

setCursorPoint(400,260)
drawCircle(50,5,"dodger blue","dodger blue")
setCursorPoint(500,260)
drawCircle(50,5,"dodger blue", "dodger blue")
setCursorPoint(465,330)
drawCircle(10,5,"dodger blue", "dodger blue")
setCursorPoint(400,400)

for count in range(315,350):
    drawDiagonal(count,1,5,"dodger blue")
for count in range(10,45):
    drawDiagonal(count,1,5,"dodger blue")
drawLeft(160,5,"dodger blue")

setCursorPoint(400,375)
for count in range(1,12):
    drawDiagonal(315,10,5,"dodger blue")
    drawDiagonal(45,10,5,"dodger blue")

#Top Hat    
setCursorPoint(450,180)
drawDiagonal(325,250,30,"black")
height = 200
for count in range(500,611):
    setCursorPoint(count,height)
    drawDiagonal(45,150,10,"black")
    height = height + 0.9

#Road
setCursorPoint(0,700)
drawRight(1700,300,"green")
setCursorPoint(0,550)
drawRight(1700,50,"black")
for count in range(0,9):
    setCursorPoint(count * 170,550)
    drawRight(50,5,"yellow")

#Cars
rand = random.randint(1,4)
setCursorPoint(220,525)

if rand == 1:
    #Grey Car
    drawCircle(20,5,"grey","black")
    setCursorPoint(370,525)
    drawCircle(20,5,"grey","black")
    setCursorPoint(200,520)
    drawRight(210,20,"dark grey")
    setCursorPoint(240,490)
    drawRight(100,40,"dark grey")
elif rand == 2:     
    #Blue Car
    drawCircle(20,5,"blue","black")
    setCursorPoint(370,525)
    drawCircle(20,5,"blue","black")
    setCursorPoint(200,520)
    drawRight(210,20,"blue")
    setCursorPoint(240,490)
    drawRight(100,40,"blue")
elif rand == 3:    
    #Yellow
    drawCircle(20,5,"yellow","black")
    setCursorPoint(370,525)
    drawCircle(20,5,"yellow","black")
    setCursorPoint(200,520)
    drawRight(210,20,"yellow")
    setCursorPoint(240,490)
    drawRight(100,40,"yellow")
else:    
    #Pink
    drawCircle(20,5,"pink","black")
    setCursorPoint(370,525)
    drawCircle(20,5,"pink","black")
    setCursorPoint(200,520)
    drawRight(210,20,"pink")
    setCursorPoint(240,490)
    drawRight(100,40,"pink")



#Red Truck
rand = random.randint(700,1060)
setCursorPoint(rand + 30,525)
drawCircle(20,5,"grey","black")
setCursorPoint(rand + 200,525)
drawCircle(20,5,"grey","black")
setCursorPoint(rand,490)
drawRight(150,75,"red")
setCursorPoint(rand,517.5)
drawRight(250,25,"red")
setCursorPoint(rand + 150,460)
drawDiagonal(335,110,10,"red")

#Scenery
for count in range(1,41):
    randomX = random.randint(10,1600)
    randomY = random.randint(600,700)
    setCursorPoint(randomX,randomY)
    if randomX % 2 == 0:
        drawCircle(10,10,"red","red")
        setCursorPoint(randomX+5,randomY+12)
        drawDown(10,5,"light green")
    else:
        drawCircle(10,10,"yellow","yellow")
        setCursorPoint(randomX+5,randomY+12)
        drawDown(10,5,"light green")

mainloop()





