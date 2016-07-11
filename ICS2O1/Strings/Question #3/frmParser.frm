VERSION 5.00
Begin VB.Form lblFirstPart 
   Caption         =   "Parser"
   ClientHeight    =   3405
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6375
   LinkTopic       =   "Form1"
   ScaleHeight     =   3405
   ScaleWidth      =   6375
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picThirdPart 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4200
      ScaleHeight     =   555
      ScaleWidth      =   1995
      TabIndex        =   5
      Top             =   2640
      Width           =   2055
   End
   Begin VB.PictureBox picSecondPart 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2160
      ScaleHeight     =   555
      ScaleWidth      =   1875
      TabIndex        =   4
      Top             =   2640
      Width           =   1935
   End
   Begin VB.PictureBox picFirstPart 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      ScaleHeight     =   555
      ScaleWidth      =   1875
      TabIndex        =   3
      Top             =   2640
      Width           =   1935
   End
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
      Left            =   3360
      TabIndex        =   2
      Top             =   1200
      Width           =   2895
   End
   Begin VB.CommandButton cmdParse 
      Caption         =   "Parse!"
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
      Left            =   120
      TabIndex        =   1
      Top             =   1200
      Width           =   3135
   End
   Begin VB.TextBox txtInput 
      BeginProperty Font 
         Name            =   "Adobe Kaiti Std R"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   0
      Text            =   "Testing, A, Sentence"
      Top             =   120
      Width           =   6135
   End
   Begin VB.Label lblThirdPart 
      BackColor       =   &H80000009&
      Caption         =   "Third Part"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4200
      TabIndex        =   8
      Top             =   1920
      Width           =   2055
   End
   Begin VB.Label lblSecondPart 
      BackColor       =   &H80000009&
      Caption         =   "Second Part"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2160
      TabIndex        =   7
      Top             =   1920
      Width           =   1935
   End
   Begin VB.Label lblFirstPart 
      BackColor       =   &H80000009&
      Caption         =   "First Part"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   1935
   End
End
Attribute VB_Name = "lblFirstPart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: March 24 2014
'Purpose: To pull three strings apart from a "comma delimited" string.
Option Explicit

Private Sub cmdParse_Click()
cmdReset.Enabled = True
cmdParse.Enabled = False
txtInput.Enabled = False
'Declaration
Dim strInput As String
Dim intFirstComma As Integer
Dim strAfterFirstComma As String
Dim intSecondComma As Integer
Dim strFirstPart As String
Dim strSecondPart As String
Dim strThirdPart As String
'Initialization
strInput = ""
intFirstComma = 0
strAfterFirstComma = ""
intSecondComma = 0
strFirstPart = ""
strSecondPart = ""
strThirdPart = ""
'Input
strInput = txtInput.Text
'Process
intFirstComma = InStr(strInput, ",")
strAfterFirstComma = Mid(strInput, intFirstComma + 1)
intSecondComma = InStr(strAfterFirstComma, ",")
strFirstPart = Left(strInput, intFirstComma - 1)
strSecondPart = Mid(strInput, intFirstComma + 1, intSecondComma - 1)
strThirdPart = Mid(strAfterFirstComma, intSecondComma + 1)
'Output
picFirstPart.Cls
picSecondPart.Cls
picThirdPart.Cls
picFirstPart.Print strFirstPart
picSecondPart.Print strSecondPart
picThirdPart.Print strThirdPart
End Sub

Private Sub cmdReset_Click()
cmdReset.Enabled = False
cmdParse.Enabled = True
txtInput.Enabled = True
txtInput.Text = ""
picFirstPart.Cls
picSecondPart.Cls
picThirdPart.Cls
End Sub

Private Sub Form_Load()
cmdReset.Enabled = False
End Sub
