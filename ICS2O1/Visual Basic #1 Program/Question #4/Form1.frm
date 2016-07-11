VERSION 5.00
Begin VB.Form frmRbc 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   Caption         =   "RBC Financial Group"
   ClientHeight    =   7845
   ClientLeft      =   525
   ClientTop       =   675
   ClientWidth     =   12675
   LinkTopic       =   "Form1"
   ScaleHeight     =   7845
   ScaleWidth      =   12675
   Begin VB.OptionButton optDisagree 
      BackColor       =   &H00FFFFFF&
      Caption         =   "I Disagree"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6720
      MaskColor       =   &H00FFFFFF&
      TabIndex        =   6
      Top             =   5400
      Width           =   2295
   End
   Begin VB.OptionButton optAgree 
      BackColor       =   &H00FFFFFF&
      Caption         =   "I Agree"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   5
      Top             =   5400
      Width           =   2175
   End
   Begin VB.CommandButton cmdContinue 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Continue"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4200
      MaskColor       =   &H00FFFFFF&
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   5880
      Width           =   2535
   End
   Begin VB.CommandButton cmdRestart 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Restart"
      BeginProperty Font 
         Name            =   "Trebuchet MS"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4200
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   4800
      Width           =   2535
   End
   Begin VB.TextBox txtPassword 
      Height          =   405
      IMEMode         =   3  'DISABLE
      Left            =   4200
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   2880
      Width           =   2415
   End
   Begin VB.TextBox txtUsername 
      Height          =   405
      Left            =   4200
      TabIndex        =   0
      Top             =   1920
      Width           =   2415
   End
   Begin VB.Image imgGoButton 
      Height          =   420
      Left            =   4200
      Picture         =   "Form1.frx":0000
      Stretch         =   -1  'True
      Top             =   4200
      Width           =   1170
   End
   Begin VB.Image imgSignin 
      Height          =   8295
      Left            =   -120
      Stretch         =   -1  'True
      Top             =   0
      Width           =   12255
   End
   Begin VB.Image imgTerms 
      Height          =   6015
      Left            =   960
      Stretch         =   -1  'True
      Top             =   360
      Width           =   9375
   End
   Begin VB.Label lblThank 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Thank you!"
      BeginProperty Font 
         Name            =   "Script"
         Size            =   72
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3555
      Left            =   2880
      TabIndex        =   2
      Top             =   1080
      Width           =   5115
   End
End
Attribute VB_Name = "frmRbc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: February 27 2014
'Purpose: To simulate the user into signing in to an RBC website.
Option Explicit


Private Sub cmdContinue_Click()
imgTerms.Visible = False
imgGoButton.Visible = False
imgGoButton.Visible = False
txtUsername.Visible = False
txtPassword.Visible = False
optAgree.Visible = False
optDisagree.Visible = False
cmdContinue.Visible = False
lblThank.Visible = True
cmdRestart.Visible = True

End Sub

Private Sub cmdRestart_Click()
imgGoButton.Visible = True
imgGoButton.Enabled = True
imgTerms.Visible = False
imgSignin.Visible = True
optAgree.Visible = False
optDisagree.Visible = False
cmdRestart.Visible = False
cmdContinue.Visible = False
lblThank.Visible = False
txtUsername.Visible = True
txtPassword.Visible = True
End Sub
Private Sub imgGoButton_Click()
imgTerms.Visible = True
imgSignin.Visible = False
imgGoButton.Visible = False
imgGoButton.Enabled = False
txtUsername.Visible = False
txtUsername.Text = ""
txtPassword.Visible = False
txtPassword.Text = ""
optAgree.Visible = True
optDisagree.Visible = True
cmdContinue.Visible = True
End Sub

Private Sub Form_Load()
imgTerms.Picture = LoadPicture(App.Path & "\agreement.jpg")
imgTerms.Visible = False
imgSignin.Picture = LoadPicture(App.Path & "\rbc copy.jpg")
imgSignin.Visible = True
imgGoButton.Enabled = False
optAgree.Visible = False
optDisagree.Visible = False
cmdRestart.Visible = False
cmdContinue.Visible = False
lblThank.Visible = False
cmdRestart.Visible = False

End Sub


Private Sub optAgree_Click()
cmdContinue.Enabled = True
End Sub

Private Sub optDisagree_Click()
cmdContinue.Enabled = False
End Sub

Private Sub txtPassword_Change()
imgGoButton.Enabled = True
End Sub
