VERSION 5.00
Begin VB.Form frmDate 
   Caption         =   "Date"
   ClientHeight    =   7920
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11625
   LinkTopic       =   "Form1"
   ScaleHeight     =   7920
   ScaleWidth      =   11625
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picOutput 
      ForeColor       =   &H00000000&
      Height          =   6015
      Left            =   0
      ScaleHeight     =   397
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   541
      TabIndex        =   5
      Top             =   1800
      Width           =   8175
   End
   Begin VB.CommandButton cmdDisplay 
      Caption         =   "Display!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1320
      TabIndex        =   4
      Top             =   960
      Width           =   4815
   End
   Begin VB.TextBox txtYear 
      Height          =   285
      Left            =   4080
      TabIndex        =   3
      Text            =   "2000"
      Top             =   600
      Width           =   2055
   End
   Begin VB.ComboBox cboMonth 
      Height          =   315
      ItemData        =   "frmDate.frx":0000
      Left            =   2520
      List            =   "frmDate.frx":0028
      TabIndex        =   2
      Text            =   "1"
      Top             =   600
      Width           =   1455
   End
   Begin VB.ComboBox cboDay 
      Height          =   315
      ItemData        =   "frmDate.frx":0053
      Left            =   1440
      List            =   "frmDate.frx":00B4
      TabIndex        =   1
      Text            =   "1"
      Top             =   600
      Width           =   975
   End
   Begin VB.Label lblPrompt 
      Alignment       =   2  'Center
      Caption         =   "Please enter the date."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
End
Attribute VB_Name = "frmDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 27 2014
'Purpose: To create a calendar.
'
Option Explicit
Private Sub cmdDisplay_Click()
'Declaration
Dim intDay As Integer
Dim intmonth As Integer
Dim intyear As Integer
Dim blnLeapYear As Boolean
Dim intMaxDays As Integer
Dim blnValid As Boolean
Dim intZeller As Integer
Dim strDayName As String
Dim strMonthName As String
Dim intCurrentDay As Integer
Dim intCount As Integer
Dim intCurrentX As Integer
Dim intCurrentY As Integer
'Initialization
intDay = 0
intmonth = 0
intyear = 0
blnLeapYear = False
intMaxDays = 0
blnValid = True
intZeller = 0
strDayName = ""
strMonthName = ""
intCurrentDay = 0
intCount = 1
intCurrentX = 0
intCurrentY = 0
'Input
intDay = cboDay.Text
intmonth = cboMonth.Text
intyear = Val(txtYear.Text)

'Process
blnLeapYear = leapYear(intyear)
intMaxDays = maxDays(intmonth, blnLeapYear)
blnValid = valid(intDay, intMaxDays, intyear)
intZeller = zeller(intDay, intmonth, intyear)
strDayName = dayName(intZeller)
strMonthName = monthName(intmonth)

'Output
picOutput.Cls
picOutput.Font.Bold = True
picOutput.FontSize = 24
If blnValid = False Then
    picOutput.Print "Your input is invalid."
Else:
    picOutput.Print strDayName & ", " & intDay & " " & strMonthName & " " & intyear
    picOutput.Font.Bold = True
    picOutput.Font.Size = 4
    intCurrentX = 50
    intCurrentY = 75
    picOutput.CurrentX = intCurrentX
    picOutput.CurrentY = intCurrentY
    For intCount = 0 To 6
        picOutput.Print Left(dayName(intCount), 3)
        intCurrentX = intCurrentX + 50
        picOutput.CurrentX = intCurrentX
        picOutput.CurrentY = intCurrentY
    Next intCount
    intCurrentX = StartingPoint(intmonth, intyear)
    intCurrentY = 100
    picOutput.CurrentX = intCurrentX
    picOutput.CurrentY = intCurrentY
    For intCount = 1 To intMaxDays
        If intCount = intDay Then
            picOutput.ForeColor = &HFF&
        End If
        picOutput.Print intCount
        picOutput.ForeColor = &H0&
        If intCount Mod 7 = 0 Then
            intCurrentX = 50
            picOutput.CurrentX = intCurrentX
            intCurrentY = intCurrentY + 50
            picOutput.CurrentY = intCurrentY
        Else:
            intCurrentX = intCurrentX + 50
        End If
        picOutput.CurrentX = intCurrentX
        picOutput.CurrentY = intCurrentY
    Next intCount
End If
End Sub

Public Function StartingPoint(intmonth As Integer, intyear As Integer) As Integer
'Author Kevin Shen
Dim intDay As Integer
intDay = 1
If zeller(intDay, intmonth, intyear) = 0 Then
StartingPoint = 50
ElseIf zeller(intDay, intmonth, intyear) = 1 Then
StartingPoint = 100
ElseIf zeller(intDay, intmonth, intyear) = 2 Then
StartingPoint = 150
ElseIf zeller(intDay, intmonth, intyear) = 3 Then
StartingPoint = 200
ElseIf zeller(intDay, intmonth, intyear) = 4 Then
StartingPoint = 250
ElseIf zeller(intDay, intmonth, intyear) = 5 Then
StartingPoint = 300
Else:
StartingPoint = 350
End If
End Function
Public Function leapYear(intyear As Integer) As Boolean
If intyear Mod 4 = 0 Then
    If intyear Mod 100 = 0 Then
        If intyear Mod 400 = 0 Then
            leapYear = True
        Else
            leapYear = False
        End If
    Else:
        leapYear = True
    End If
Else:
    leapYear = False
End If
End Function
Public Function maxDays(intmonth As Integer, blnLeapYear As Boolean)
If blnLeapYear = True And intmonth = 2 Then
    maxDays = 2
ElseIf intmonth = 2 Then
    maxDays = 28
ElseIf intmonth = 4 Or intmonth = 6 Or intmonth = 9 Or intmonth = 11 Then
    maxDays = 30
Else:
    maxDays = 31
End If
End Function
Public Function valid(intDays As Integer, intMaxDays As Integer, intyear As Integer) As Boolean
If intDays > intMaxDays Then
    valid = False
ElseIf intyear < 1582 Then
    valid = False
Else:
    valid = True
End If
End Function
Public Function zeller(intDay As Integer, intmonth As Integer, intyear As Integer)
'Declaration
Dim m As Integer
Dim y As Integer
Dim p As Integer
Dim r As Integer
'Initialization
m = 0
y = 0
p = 0
r = 0
'Process
m = intmonth - 2
y = intyear
If m < 0 Then
    m = m + 12
    y = y - 1
End If
p = y \ 100
r = y Mod 100
zeller = (intDay + (26 * m - 2) \ 10 + r + r \ 4 + p \ 4 + 5 * p) Mod 7
End Function
Public Function dayName(intZeller As Integer) As String
If intZeller = 0 Then
    dayName = "Sunday"
ElseIf intZeller = 1 Then
    dayName = "Monday"
ElseIf intZeller = 2 Then
    dayName = "Tuesday"
ElseIf intZeller = 3 Then
    dayName = "Wednesday"
ElseIf intZeller = 4 Then
    dayName = "Thursday"
ElseIf intZeller = 5 Then
    dayName = "Friday"
Else:
    dayName = "Saturday"
End If
End Function
Public Function monthName(intmonth As Integer) As String
If intmonth = 1 Then
    monthName = "January"
ElseIf intmonth = 2 Then
    monthName = "February"
ElseIf intmonth = 3 Then
    monthName = "March"
ElseIf intmonth = 4 Then
    monthName = "April"
ElseIf intmonth = 5 Then
    monthName = "May"
ElseIf intmonth = 6 Then
    monthName = "June"
ElseIf intmonth = 7 Then
    monthName = "July"
ElseIf intmonth = 8 Then
    monthName = "August"
ElseIf intmonth = 9 Then
    monthName = "September"
ElseIf intmonth = 10 Then
    monthName = "October"
ElseIf intmonth = 11 Then
    monthName = "November"
Else:
    monthName = "December"
End If
End Function

