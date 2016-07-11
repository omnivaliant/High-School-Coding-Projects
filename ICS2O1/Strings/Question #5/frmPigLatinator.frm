VERSION 5.00
Begin VB.Form frmPigLatinator 
   Caption         =   "Pig Latinator"
   ClientHeight    =   3615
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4440
   LinkTopic       =   "Form1"
   ScaleHeight     =   3615
   ScaleWidth      =   4440
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPigToNormalContinue 
      Caption         =   "Normalize!"
      Height          =   735
      Left            =   1560
      TabIndex        =   8
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmdNormalToPigContinue 
      Caption         =   "Pig Latinate!"
      Height          =   735
      Left            =   120
      TabIndex        =   7
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox txtLatin 
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   3000
      Width           =   4095
   End
   Begin VB.TextBox txtNormal 
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   4095
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
      Height          =   735
      Left            =   3000
      TabIndex        =   4
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton cmdPigToNormal 
      Caption         =   "Normalize!"
      Height          =   735
      Left            =   1560
      TabIndex        =   3
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton cmdNormalToPig 
      Caption         =   "Pig Latinate!"
      Height          =   735
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label lblPigLatin 
      BackColor       =   &H80000005&
      Caption         =   "Pig Latin"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   2400
      Width           =   4095
   End
   Begin VB.Label lblNormal 
      BackColor       =   &H80000005&
      Caption         =   "Normal"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "frmPigLatinator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: March 25 2014
'Purpose: To convert normal words into Pig Latin, and vice-versa.
Option Explicit
Dim strOld As String
Dim strOriginalNormal As String

Private Sub cmdNormalToPig_Click()
cmdReset.Enabled = True
cmdPigToNormal.Enabled = True
txtNormal.Enabled = True
txtLatin.Enabled = True
txtNormal.BackColor = &H80000005
txtLatin.BackColor = &H80000005
cmdNormalToPig.Visible = False
cmdNormalToPigContinue.Visible = True
cmdPigToNormal.Visible = False
cmdPigToNormalContinue.Visible = True
'Declaration
Dim strOldNormal As String
Dim strNewLatin As String
'Initialization
strOldNormal = ""
strNewLatin = ""
strOriginalNormal = ""
'Input
strOldNormal = txtNormal.Text
strOriginalNormal = strOldNormal
'Process
strNewLatin = Mid(strOldNormal, 2) & LCase((Left(strOldNormal, 1))) & "ay"
strOld = strNewLatin
'Output
txtNormal.Text = strOldNormal
txtLatin.Text = strNewLatin

End Sub

Private Sub cmdNormalToPigContinue_Click()
cmdReset.Enabled = True
txtNormal.Enabled = True
txtLatin.Enabled = True
txtNormal.BackColor = &H80000005
txtLatin.BackColor = &H80000005
'Declaration
Dim strOldNormal As String
Dim strNewLatin As String
'Initialization
strOldNormal = ""
strNewLatin = ""
'Input
strOldNormal = strOld
'Process
strNewLatin = Mid(strOldNormal, 2) & LCase((Left(strOldNormal, 1))) & "ay"
strOld = strNewLatin
'Output
txtNormal.Text = strOldNormal
txtLatin.Text = strNewLatin
If strOldNormal = strOriginalNormal Then
    cmdPigToNormal.Enabled = False
    cmdPigToNormalContinue.Enabled = False
Else:
    cmdPigToNormal.Enabled = True
    cmdPigToNormalContinue.Enabled = True
End If
End Sub

Private Sub cmdPigToNormal_Click()
cmdReset.Enabled = True
cmdNormalToPig.Enabled = True
txtNormal.Enabled = True
txtLatin.Enabled = True
txtNormal.BackColor = &H80000005
txtLatin.BackColor = &H80000005
cmdPigToNormal.Visible = False
cmdPigToNormalContinue.Visible = True
cmdPigToNormal.Visible = False
cmdPigToNormalContinue.Visible = True

'Declaration
Dim strOldLatin As String
Dim intLocationOfAy As Integer
Dim strFirstLetter As String
Dim strNewNormal As String
'Initialization
strOldLatin = ""
intLocationOfAy = 0
strFirstLetter = ""
strNewNormal = ""
'Input
strOldLatin = txtLatin.Text
'Process
intLocationOfAy = (Len(strOldLatin) - 1)
strFirstLetter = Mid(strOldLatin, intLocationOfAy - 1, 1)
strNewNormal = strFirstLetter & Mid(strOldLatin, 1, intLocationOfAy - 2)
strOld = strNewNormal
strOriginalNormal = strNewNormal
'Output
txtNormal.Text = strNewNormal
txtLatin.Text = strOldLatin
End Sub

Private Sub cmdPigToNormalContinue_Click()
cmdReset.Enabled = True
txtNormal.Enabled = True
txtLatin.Enabled = True
txtNormal.BackColor = &H80000005
txtLatin.BackColor = &H80000005

'Declaration
Dim strOldLatin As String
Dim intLocationOfAy As Integer
Dim strFirstLetter As String
Dim strNewNormal As String
'Initialization
strOldLatin = ""
intLocationOfAy = 0
strFirstLetter = ""
strNewNormal = ""
'Input
strOldLatin = strOld
'Process
intLocationOfAy = (Len(strOldLatin) - 1)
strFirstLetter = Mid(strOldLatin, intLocationOfAy - 1, 1)
strNewNormal = strFirstLetter & Mid(strOldLatin, 1, intLocationOfAy - 2)
strOld = strNewNormal
'Output
txtNormal.Text = strNewNormal
txtLatin.Text = strOldLatin
If strNewNormal = strOriginalNormal Then
    cmdPigToNormal.Enabled = False
    cmdPigToNormalContinue.Enabled = False
Else:
    cmdPigToNormal.Enabled = True
    cmdPigToNormalContinue.Enabled = True
End If
End Sub

Private Sub cmdReset_Click()
cmdReset.Enabled = False
cmdNormalToPig.Enabled = False
cmdPigToNormal.Enabled = False
txtNormal.Text = ""
txtLatin.Text = ""
txtNormal.Enabled = True
txtLatin.Enabled = True
txtNormal.BackColor = &H80000005
txtLatin.BackColor = &H80000005
End Sub

Private Sub Form_Load()
cmdReset.Enabled = False
cmdNormalToPig.Enabled = False
cmdPigToNormal.Enabled = False
End Sub

Private Sub txtLatin_Click()
cmdReset.Enabled = False
cmdNormalToPig.Enabled = False
cmdPigToNormal.Enabled = True
txtNormal.Enabled = False
txtNormal.BackColor = &H8000000A
End Sub

Private Sub txtNormal_Click()
cmdReset.Enabled = False
cmdNormalToPig.Enabled = True
cmdPigToNormal.Enabled = False
txtLatin.Enabled = False
txtLatin.BackColor = &H8000000A
End Sub
