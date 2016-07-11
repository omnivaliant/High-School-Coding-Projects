VERSION 5.00
Begin VB.Form frmRandomWalk 
   BackColor       =   &H00004000&
   Caption         =   "Random Walk"
   ClientHeight    =   8430
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12915
   LinkTopic       =   "Form1"
   ScaleHeight     =   8430
   ScaleWidth      =   12915
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picStats 
      BackColor       =   &H0080FF80&
      FillColor       =   &H0080FF80&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1935
      Left            =   8280
      ScaleHeight     =   1875
      ScaleWidth      =   4515
      TabIndex        =   1
      Top             =   2520
      Width           =   4575
   End
   Begin VB.CommandButton cmdWalk 
      BackColor       =   &H0080FF80&
      Caption         =   "Start the random walk!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2175
      Left            =   8280
      MaskColor       =   &H0080FF80&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
   Begin VB.Frame fraSpeed 
      BackColor       =   &H0080FF80&
      Caption         =   "Choose your speed level!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   8280
      TabIndex        =   2
      Top             =   4680
      Width           =   4575
      Begin VB.OptionButton optInstant 
         BackColor       =   &H0080FF80&
         Caption         =   "Instant"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         TabIndex        =   7
         Top             =   1200
         Width           =   3015
      End
      Begin VB.OptionButton optFast 
         BackColor       =   &H0080FF80&
         Caption         =   "Fast"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2520
         TabIndex        =   5
         Top             =   600
         Width           =   2895
      End
      Begin VB.OptionButton optMedium 
         BackColor       =   &H0080FF80&
         Caption         =   "Medium"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   1200
         Width           =   4335
      End
      Begin VB.OptionButton optSlow 
         BackColor       =   &H0080FF80&
         Caption         =   "Slow"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   4335
      End
   End
   Begin VB.CommandButton cmdReset 
      BackColor       =   &H0080FF80&
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
      Height          =   1215
      Left            =   8280
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   6960
      Width           =   4575
   End
   Begin VB.Image imgPikachu 
      Height          =   855
      Left            =   7320
      Picture         =   "frmRandomWalk.frx":0000
      Stretch         =   -1  'True
      Top             =   7320
      Width           =   855
   End
   Begin VB.Image imgHoenn 
      Height          =   8055
      Left            =   120
      Picture         =   "frmRandomWalk.frx":0666
      Stretch         =   -1  'True
      Top             =   120
      Width           =   8055
   End
End
Attribute VB_Name = "frmRandomWalk"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 7 2014
'Purpose: To make a moving object.
Option Explicit
'Global Variables
Dim intSpeed As Integer
'Sleep
Private Declare Sub Sleep Lib "kernel32" (ByVal Milliseconds As Integer)

Private Sub cmdWalk_Click()
picStats.Cls
cmdWalk.Enabled = False
'Declaration
Dim intRnd As Integer
Dim intLeft As Integer
Dim intRight As Integer
Dim intUp As Integer
Dim intDown As Integer
Dim intTotal As Integer
'Initialization
intRnd = 0
intLeft = 0
intRight = 0
intUp = 0
intDown = 0
intTotal = 0
'Input & Process
Do While imgPikachu.Top > 0 And imgPikachu.Top < 7320 _
And imgPikachu.Left > 0 And imgPikachu.Left < 7320
    intRnd = Int(Rnd * 4) + 1
    If intRnd = 1 Then
        imgPikachu.Top = imgPikachu.Top + 120
        intDown = intDown + 1
    ElseIf intRnd = 2 Then
        imgPikachu.Top = imgPikachu.Top - 120
        intUp = intUp + 1
    ElseIf intRnd = 3 Then
        imgPikachu.Left = imgPikachu.Left + 120
        intRight = intRight + 1
    ElseIf intRnd = 4 Then
        imgPikachu.Left = imgPikachu.Left - 120
        intLeft = intLeft + 1
    End If
    Sleep intSpeed
    intTotal = intUp + intDown + intRight + intLeft
    'Output
    picStats.Cls
    picStats.Print "You have moved " & intUp & " steps up."
    picStats.Print "You have moved " & intDown & " steps down."
    picStats.Print "You have moved " & intLeft & " steps left."
    picStats.Print "You have moved " & intRight & " steps right."
    picStats.Print "You have moved " & intTotal & " steps total."
Loop
cmdReset.Enabled = True
End Sub

Private Sub cmdReset_Click()
cmdWalk.Enabled = True
picStats.Cls
cmdReset.Enabled = False
fraSpeed.Enabled = True
imgPikachu.Top = 3720
imgPikachu.Left = 3220

End Sub

Private Sub Form_Load()
Randomize
intSpeed = 1000
cmdReset.Enabled = False
optSlow.Value = True
imgPikachu.Top = 3720
imgPikachu.Left = 3220
End Sub

Private Sub optFast_Click()
intSpeed = 100
End Sub

Private Sub optInstant_Click()
intSpeed = 0
End Sub

Private Sub optMedium_Click()
intSpeed = 500
End Sub

Private Sub optSlow_Click()
intSpeed = 1000
End Sub
