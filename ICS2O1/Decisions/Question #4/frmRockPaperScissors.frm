VERSION 5.00
Begin VB.Form frmRockPaperScissors 
   Caption         =   "Rock Paper Scissors"
   ClientHeight    =   5640
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9585
   LinkTopic       =   "Form1"
   ScaleHeight     =   5640
   ScaleWidth      =   9585
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4200
      TabIndex        =   4
      Top             =   4560
      Width           =   2655
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Go!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2175
      Left            =   4200
      TabIndex        =   1
      Top             =   2280
      Width           =   2655
   End
   Begin VB.Label lblPick 
      Alignment       =   2  'Center
      Caption         =   "Pick:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   15
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Image imgCompChoice 
      Height          =   2055
      Left            =   7080
      Picture         =   "frmRockPaperScissors.frx":0000
      Stretch         =   -1  'True
      Top             =   2400
      Width           =   2415
   End
   Begin VB.Image imgChoice 
      Height          =   2175
      Left            =   1560
      Picture         =   "frmRockPaperScissors.frx":2A27
      Stretch         =   -1  'True
      Top             =   2280
      Width           =   2415
   End
   Begin VB.Image imgScissors 
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   120
      Picture         =   "frmRockPaperScissors.frx":544E
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   1215
   End
   Begin VB.Image imgPaper 
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   120
      Picture         =   "frmRockPaperScissors.frx":792C
      Stretch         =   -1  'True
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label lblCompScore 
      Caption         =   "Your opponent's score is: 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   7080
      TabIndex        =   6
      Top             =   4560
      Width           =   2415
   End
   Begin VB.Label lblScore 
      Caption         =   "Your score is: 0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1560
      TabIndex        =   5
      Top             =   4560
      Width           =   2415
   End
   Begin VB.Image imgResult 
      Height          =   1095
      Left            =   4200
      Picture         =   "frmRockPaperScissors.frx":1DF1E
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   2655
   End
   Begin VB.Label lblCompChoice 
      Caption         =   "Your opponent's choice:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   7080
      TabIndex        =   3
      Top             =   1080
      Width           =   2415
   End
   Begin VB.Label lblChoice 
      Caption         =   "Your choice:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   1560
      TabIndex        =   2
      Top             =   1200
      Width           =   2415
   End
   Begin VB.Image imgRock 
      BorderStyle     =   1  'Fixed Single
      Height          =   1095
      Left            =   120
      Picture         =   "frmRockPaperScissors.frx":20945
      Stretch         =   -1  'True
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label lblPrompt 
      Caption         =   "What will you choose to FIGHT?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   29.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   9375
   End
   Begin VB.Image imgArena 
      Height          =   5655
      Left            =   0
      Picture         =   "frmRockPaperScissors.frx":280E7
      Stretch         =   -1  'True
      Top             =   0
      Width           =   9615
   End
End
Attribute VB_Name = "frmRockPaperScissors"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: April 22 2014
'Purpose: To simulate a match of Rock Paper Scissors against the computer.
Option Explicit
Dim intScore As Integer
Dim intComputerScore As Integer
Dim intChoice As Integer
Private Sub cmdGo_Click()
cmdGo.Enabled = False
'Declaration
Dim intComputerChoice As Integer
'Initialization
'Input
intComputerChoice = Int(Rnd * 3) + 1
'Process
If intComputerChoice = 1 Then
    imgCompChoice.Picture = LoadPicture(App.Path & "\rock.gif")
    lblCompChoice.Caption = "Your opponent's choice: Rock"
ElseIf intComputerChoice = 2 Then
    imgCompChoice.Picture = LoadPicture(App.Path & "\paper.gif")
    lblCompChoice.Caption = "Your opponent's choice: Paper"
ElseIf intComputerChoice = 3 Then
    imgCompChoice.Picture = LoadPicture(App.Path & "\scissors.gif")
    lblCompChoice.Caption = "Your opponent's choice: Scissors"
End If
If intChoice = intComputerChoice Then
    imgResult.Picture = LoadPicture(App.Path & "\tie.gif")
ElseIf (intChoice = 1 And intComputerChoice = 3) Or (intChoice = 2 And intComputerChoice = 1) _
    Or (intChoice = 3 And intComputerChoice = 2) Then
    imgResult.Picture = LoadPicture(App.Path & "\win.gif")
    intScore = intScore + 1
Else:
    imgResult.Picture = LoadPicture(App.Path & "\lose.gif")
    intComputerScore = intComputerScore + 1
End If
'Output
lblScore.Caption = "Your score is: " & intScore
lblCompScore.Caption = "Your opponent's score is: " & intComputerScore

End Sub


Private Sub cmdReset_Click()
intScore = 0
intComputerScore = 0
intChoice = 0
cmdGo.Enabled = False
imgResult.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
imgCompChoice.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
imgChoice.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
lblScore.Caption = "Your score is: 0"
lblCompScore.Caption = "Your opponent's score is: 0"
lblChoice.Caption = "Your choice: "
lblCompChoice.Caption = "Your opponent's choice: "
End Sub

Private Sub Form_Load()
Randomize
intScore = 0
intComputerScore = 0
intChoice = 0
cmdGo.Enabled = False
imgResult.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
End Sub

Private Sub imgPaper_Click()
cmdGo.Enabled = True
imgChoice.Picture = LoadPicture(App.Path & "\paper.gif")
lblChoice.Caption = "Your choice: Paper"
imgResult.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
imgCompChoice.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
lblCompChoice.Caption = "Your opponent's choice: "
intChoice = 2
End Sub

Private Sub imgRock_Click()
cmdGo.Enabled = True
imgChoice.Picture = LoadPicture(App.Path & "\rock.gif")
lblChoice.Caption = "Your choice: Rock"
imgResult.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
imgCompChoice.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
lblCompChoice.Caption = "Your opponent's choice: "
intChoice = 1
End Sub

Private Sub imgScissors_Click()
cmdGo.Enabled = True
imgChoice.Picture = LoadPicture(App.Path & "\scissors.gif")
lblChoice.Caption = "Your choice: Scissors"
imgResult.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
imgCompChoice.Picture = LoadPicture(App.Path & "\QuestionMark.gif")
lblCompChoice.Caption = "Your opponent's choice: "
intChoice = 3
End Sub
