VERSION 5.00
Begin VB.Form frmStatistics 
   Caption         =   "Statistic Functions"
   ClientHeight    =   6570
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4425
   LinkTopic       =   "Form1"
   ScaleHeight     =   6570
   ScaleWidth      =   4425
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2520
      TabIndex        =   6
      Top             =   3480
      Width           =   1815
   End
   Begin VB.PictureBox picOutput 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   120
      ScaleHeight     =   2235
      ScaleWidth      =   4155
      TabIndex        =   5
      Top             =   4200
      Width           =   4215
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   4
      Top             =   3480
      Width           =   2295
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2880
      TabIndex        =   3
      Top             =   240
      Width           =   1335
   End
   Begin VB.TextBox txtInput 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   240
      Width           =   975
   End
   Begin VB.ListBox lstNumbers 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2220
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   4215
   End
   Begin VB.Label lblPrompt 
      Caption         =   "Please enter a number."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   1575
   End
End
Attribute VB_Name = "frmStatistics"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 27 2014
'Purpose: To create a statistic calculator.
Option Explicit
Private Sub cmdAdd_Click()
'Declaration
Dim intInput As Integer
'Initialization
intInput = 0
'Input
intInput = Val(txtInput.Text)
'Process
If intInput > 0 And intInput <= 100 Then
    lstNumbers.AddItem intInput
Else:
    intInput = MsgBox("Please enter a number from 1 to 100.", vbOKOnly, "Invalid number!")
End If
picOutput.Cls
End Sub

Private Sub cmdCalculate_Click()
'Declaration
Dim intListNumber As Integer
Dim intSmallest As Integer
Dim intLargest As Integer
Dim intTotal As Integer
Dim sglAverage As Single
'Initialization
intListNumber = 0
intSmallest = 0
intLargest = 0
intTotal = 0
sglAverage = 0
'Input & Process
intListNumber = (lstNumbers.ListCount) - 1
intSmallest = findSmallest(intListNumber)
intLargest = findLargest(intListNumber)
intTotal = findTotal(intListNumber)
sglAverage = findAverage(intListNumber, intTotal)
'Output
picOutput.Cls
picOutput.Print "The smallest number is " & intSmallest & "."
picOutput.Print "The largest number is " & intLargest & "."
picOutput.Print "The total is " & intTotal & "."
picOutput.Print "The average is " & sglAverage & "."
End Sub
Private Sub cmdReset_Click()
lstNumbers.Clear
picOutput.Cls
txtInput.Text = ""
End Sub
Public Function findSmallest(intListNumber As Integer) As Integer
Dim intCount As Integer
findSmallest = Val(lstNumbers.List(intCount))
For intCount = 0 To intListNumber
    If findSmallest > Val(lstNumbers.List(intCount)) Then
        findSmallest = Val(lstNumbers.List(intCount))
    End If
Next intCount
End Function
Public Function findLargest(intListNumber As Integer) As Integer
Dim intCount As Integer
findLargest = Val(lstNumbers.List(intCount))
For intCount = 0 To intListNumber
    If findLargest < Val(lstNumbers.List(intCount)) Then
        findLargest = Val(lstNumbers.List(intCount))
    End If
Next intCount
End Function

Public Function findTotal(intListNumber As Integer) As Integer
Dim intCount As Integer
findTotal = 0
For intCount = 0 To intListNumber
    findTotal = findTotal + Val(lstNumbers.List(intCount))
Next intCount
End Function
Public Function findAverage(intListNumber As Integer, intTotal As Integer) As Single
findAverage = intTotal / (intListNumber + 1)
End Function



