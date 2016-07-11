VERSION 5.00
Begin VB.Form frmLoginCreator 
   Caption         =   "Login Creator"
   ClientHeight    =   8475
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4215
   LinkTopic       =   "Form1"
   ScaleHeight     =   8475
   ScaleWidth      =   4215
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraFourthLoginOutput 
      Caption         =   "Fourth Login Requested"
      Height          =   1215
      Left            =   120
      TabIndex        =   18
      Top             =   6720
      Width           =   3975
      Begin VB.PictureBox picFourthLogin 
         Height          =   735
         Left            =   2160
         ScaleHeight     =   675
         ScaleWidth      =   1635
         TabIndex        =   20
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblFourthLogin 
         BackColor       =   &H80000009&
         Caption         =   "Fourth Login"
         Height          =   735
         Left            =   120
         TabIndex        =   19
         Top             =   360
         Width           =   1695
      End
   End
   Begin VB.Frame fraLoginOutputs 
      Caption         =   "Logins"
      Height          =   2775
      Left            =   2160
      TabIndex        =   11
      Top             =   3840
      Width           =   1935
      Begin VB.PictureBox picThirdLogin 
         Height          =   735
         Left            =   120
         ScaleHeight     =   675
         ScaleWidth      =   1635
         TabIndex        =   17
         Top             =   1920
         Width           =   1695
      End
      Begin VB.PictureBox picSecondLogin 
         Height          =   615
         Left            =   120
         ScaleHeight     =   555
         ScaleWidth      =   1635
         TabIndex        =   16
         Top             =   1200
         Width           =   1695
      End
      Begin VB.PictureBox picFirstLogin 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   120
         ScaleHeight     =   555
         ScaleWidth      =   1635
         TabIndex        =   15
         Top             =   480
         Width           =   1695
      End
   End
   Begin VB.Frame fraLoginLabels 
      Caption         =   "Logins Requested"
      Height          =   2775
      Left            =   120
      TabIndex        =   10
      Top             =   3840
      Width           =   1935
      Begin VB.Label lblThirdLogin 
         BackColor       =   &H80000005&
         Caption         =   "Third Login"
         Height          =   735
         Left            =   120
         TabIndex        =   14
         Top             =   1920
         Width           =   1695
      End
      Begin VB.Label lblSecondLogin 
         BackColor       =   &H80000005&
         Caption         =   "Second Login"
         Height          =   615
         Left            =   120
         TabIndex        =   13
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label lblFirstLogin 
         BackColor       =   &H80000005&
         Caption         =   "First Login"
         Height          =   615
         Left            =   120
         TabIndex        =   12
         Top             =   480
         Width           =   1695
      End
   End
   Begin VB.Frame fraFourthLoginInput 
      Caption         =   "Fourth Login"
      Height          =   1455
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   3975
      Begin VB.TextBox txtFirstNameNumber 
         Height          =   495
         Left            =   2160
         TabIndex        =   9
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtLastNameNumber 
         Height          =   495
         Left            =   2160
         TabIndex        =   7
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label lblFirstNameNumber 
         BackColor       =   &H80000005&
         Caption         =   "Number of letters of your first  name?"
         Height          =   495
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   1935
      End
      Begin VB.Label lblLastNameNumber 
         BackColor       =   &H80000005&
         Caption         =   "Number of letters of your last name?"
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   840
         Width           =   1935
      End
   End
   Begin VB.CheckBox chkFourthLogin 
      Caption         =   "Create 4 Logins instead of 3."
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   3975
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset."
      Height          =   615
      Left            =   2160
      TabIndex        =   3
      Top             =   3120
      Width           =   1935
   End
   Begin VB.CommandButton cmdCreateLogin 
      Caption         =   "Create your Login!"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   3120
      Width           =   1935
   End
   Begin VB.TextBox txtFullName 
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3975
   End
   Begin VB.Label lblEnterName 
      Caption         =   "Please enter your name."
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "frmLoginCreator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: March 24 2014
'Purpose: To create 4 different logins form a first name and a last name.
Option Explicit

Private Sub chkFourthLogin_Click()
If chkFourthLogin.Value = vbChecked Then
    fraFourthLoginInput.Visible = True
    fraFourthLoginOutput.Enabled = True
ElseIf chkFourthLogin.Value = vbUnchecked Then
    fraFourthLoginInput.Visible = False
    fraFourthLoginOutput.Enabled = False
txtFirstNameNumber.Text = ""
txtLastNameNumber.Text = ""
End If
End Sub

Private Sub cmdCreateLogin_Click()
'Declaration
fraLoginLabels.Visible = True
fraLoginOutputs.Visible = True
fraFourthLoginOutput.Visible = True
cmdCreateLogin.Enabled = False
cmdReset.Enabled = True
chkFourthLogin.Enabled = False
fraFourthLoginInput.Enabled = False
txtFirstNameNumber.BackColor = &H8000000F
txtLastNameNumber.BackColor = &H8000000F

Dim strFullName As String
Dim intSpace As Integer
Dim strFirstName As String
Dim strLastName As String
Dim intFirstNameNumber As Integer
Dim intLastNameNumber As Integer
Dim strFirstLogin As String
Dim strSecondLogin As String
Dim strThirdLogin As String
Dim strFourthLogin As String
'Initialization
strFullName = " "
intSpace = 0
strFirstName = " "
strLastName = " "
intFirstNameNumber = 0
intLastNameNumber = 0
strFirstLogin = " "
strSecondLogin = " "
strThirdLogin = " "
strFourthLogin = " "
'Input
strFullName = txtFullName.Text
intFirstNameNumber = Val(txtFirstNameNumber.Text)
intLastNameNumber = Val(txtLastNameNumber.Text)
'Process
intSpace = InStr(strFullName, " ")
strFirstName = Mid(strFullName, 1, intSpace - 1)
strLastName = Mid(strFullName, intSpace + 1)
strFirstLogin = Left(strFirstName, 4) & Left(strLastName, 3)
strSecondLogin = Mid(strLastName, 2) & Mid(strFirstName, 1, 1)
strThirdLogin = Mid(strFirstName, 1, 1) & Right(strLastName, 4)
strFourthLogin = Left(strFirstName, intFirstNameNumber) & Left(strLastName, intLastNameNumber)
'Output
picFirstLogin.Cls
picSecondLogin.Cls
picThirdLogin.Cls
picFourthLogin.Cls
picFirstLogin.Print strFirstLogin
picSecondLogin.Print strSecondLogin
picThirdLogin.Print strThirdLogin
picFourthLogin.Print strFourthLogin
End Sub

Private Sub cmdReset_Click()
fraLoginLabels.Visible = False
fraLoginOutputs.Visible = False
fraFourthLoginInput.Visible = False
fraFourthLoginOutput.Visible = False
cmdCreateLogin.Enabled = True
cmdReset.Enabled = False
chkFourthLogin.Value = vbUnchecked
chkFourthLogin.Enabled = True
fraFourthLoginInput.Enabled = True
txtFirstNameNumber.BackColor = &H80000005
txtLastNameNumber.BackColor = &H80000005
End Sub

Private Sub Form_Load()
fraLoginLabels.Visible = False
fraLoginOutputs.Visible = False
fraFourthLoginInput.Visible = False
fraFourthLoginOutput.Visible = False
cmdReset.Enabled = False
chkFourthLogin.Value = vbUnchecked
End Sub

