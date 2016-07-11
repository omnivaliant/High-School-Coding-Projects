VERSION 5.00
Begin VB.Form frmDecomposition 
   Caption         =   "Decomposition"
   ClientHeight    =   8670
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7425
   LinkTopic       =   "Form1"
   ScaleHeight     =   8670
   ScaleWidth      =   7425
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
      Height          =   615
      Left            =   3840
      TabIndex        =   23
      Top             =   1920
      Width           =   3375
   End
   Begin VB.CommandButton cmdDecompose 
      Caption         =   "Decompose!"
      Height          =   615
      Left            =   120
      TabIndex        =   22
      Top             =   1920
      Width           =   3375
   End
   Begin VB.PictureBox picAllButLast3 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   20
      Top             =   8040
      Width           =   3375
   End
   Begin VB.PictureBox picThird 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   19
      Top             =   7440
      Width           =   3375
   End
   Begin VB.PictureBox picFifth 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   18
      Top             =   6840
      Width           =   3375
   End
   Begin VB.PictureBox pic2From4 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   17
      Top             =   6240
      Width           =   3375
   End
   Begin VB.PictureBox pic4From3 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   16
      Top             =   5640
      Width           =   3375
   End
   Begin VB.PictureBox picAllButFirst5 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   15
      Top             =   5040
      Width           =   3375
   End
   Begin VB.PictureBox picLast2 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   14
      Top             =   4440
      Width           =   3375
   End
   Begin VB.PictureBox picFirst3 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   13
      Top             =   3840
      Width           =   3375
   End
   Begin VB.PictureBox picLast 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   12
      Top             =   3240
      Width           =   3375
   End
   Begin VB.PictureBox picFirst 
      BackColor       =   &H80000005&
      Height          =   375
      Left            =   3840
      ScaleHeight     =   315
      ScaleWidth      =   3315
      TabIndex        =   11
      Top             =   2640
      Width           =   3375
   End
   Begin VB.TextBox txtString 
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   24
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   915
      Left            =   1200
      TabIndex        =   0
      Top             =   720
      Width           =   5055
   End
   Begin VB.Label lblEnter10 
      BackColor       =   &H80000005&
      Caption         =   "Please enter 10 letters."
      Height          =   375
      Left            =   120
      TabIndex        =   21
      Top             =   120
      Width           =   7095
   End
   Begin VB.Label lblAllButLast3 
      BackColor       =   &H80000005&
      Caption         =   "All but last 3 letters"
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   8040
      Width           =   3375
   End
   Begin VB.Label lblThird 
      BackColor       =   &H80000005&
      Caption         =   "3rd letter"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   7440
      Width           =   3375
   End
   Begin VB.Label lblFifth 
      BackColor       =   &H80000005&
      Caption         =   "5th letter"
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   6840
      Width           =   3375
   End
   Begin VB.Label lbl2From4 
      BackColor       =   &H80000005&
      Caption         =   "First 2 letters starting from 4th place."
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   6240
      Width           =   3375
   End
   Begin VB.Label lbl4From3 
      BackColor       =   &H80000005&
      Caption         =   "First 4 letters starting from 3rd place."
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   5640
      Width           =   3375
   End
   Begin VB.Label lblAllButFirst5 
      BackColor       =   &H80000005&
      Caption         =   "All but first 5 letters."
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   5040
      Width           =   3375
   End
   Begin VB.Label lblLast2 
      BackColor       =   &H80000005&
      Caption         =   "Last 2 Letters"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   4440
      Width           =   3375
   End
   Begin VB.Label lblFirst3 
      BackColor       =   &H80000005&
      Caption         =   "First 3 Letters"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3840
      Width           =   3375
   End
   Begin VB.Label lblLast 
      BackColor       =   &H80000005&
      Caption         =   "Last Letter"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   3240
      Width           =   3375
   End
   Begin VB.Label lblFirst 
      BackColor       =   &H80000005&
      Caption         =   "First Letter"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2640
      Width           =   3375
   End
End
Attribute VB_Name = "frmDecomposition"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: March 24 2014
'Purpose: To break down a word into various parts.
Option Explicit

Private Sub cmdDecompose_Click()
'Declaration
Dim strString As String
Dim strFirst As String
Dim strLast As String
Dim strFirst3 As String
Dim strLast2 As String
Dim strAllButFirst5 As String
Dim str4From3 As String
Dim str2From4 As String
Dim strFifth As String
Dim strThird As String
Dim strAllButLast3 As String
'Initialization
strString = " "
strFirst = " "
strLast = " "
strFirst3 = " "
strLast2 = " "
strAllButFirst5 = " "
str4From3 = " "
str2From4 = " "
strFifth = " "
strThird = " "
strAllButLast3 = " "
'Input
strString = txtString.Text
Trim (strString)
If InStr(strString, " ") Then
    MsgBox "Please enter 10 proper characters! No spaces!"
ElseIf Len(strString) < 10 Then
    MsgBox "Please enter 10 proper characters! No spaces!"
End If
'Process
strFirst = Left(strString, 1)
strLast = Right(strString, 1)
strFirst3 = Mid(strString, 1, 3)
strLast2 = Right(strString, 2)
strAllButFirst5 = Mid(strString, 6)
str4From3 = Mid(strString, 3, 4)
str2From4 = Mid(strString, 4, 2)
strFifth = Mid(strString, 5, 1)
strThird = Mid(strString, 3, 1)
strAllButLast3 = Mid(strString, 1, 7)
'Output
picFirst.Cls
picLast.Cls
picFirst3.Cls
picLast2.Cls
picAllButFirst5.Cls
pic4From3.Cls
pic2From4.Cls
picFifth.Cls
picThird.Cls
picAllButLast3.Cls
picFirst.Print strFirst
picLast.Print strLast
picFirst3.Print strFirst3
picLast2.Print strLast2
picAllButFirst5.Print strAllButFirst5
pic4From3.Print str4From3
pic2From4.Print str2From4
picFifth.Print strFifth
picThird.Print strThird
picAllButLast3.Print strAllButLast3

cmdDecompose.Enabled = False
txtString.Enabled = False
cmdReset.Enabled = True
End Sub

Private Sub cmdReset_Click()
txtString.Text = ""
picFirst.Cls
picLast.Cls
picFirst3.Cls
picLast2.Cls
picAllButFirst5.Cls
pic4From3.Cls
pic2From4.Cls
picFifth.Cls
picThird.Cls
picAllButLast3.Cls

txtString.Enabled = True
cmdReset.Enabled = False
End Sub

Private Sub Form_Load()
cmdDecompose.Enabled = False
cmdReset.Enabled = False
txtString.Enabled = True
End Sub

Private Sub txtString_Change()
If Len(txtString.Text) = 10 Then
    cmdDecompose.Enabled = True
Else: cmdDecompose.Enabled = False
End If


End Sub
