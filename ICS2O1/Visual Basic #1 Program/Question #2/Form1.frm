VERSION 5.00
Begin VB.Form frmVacation 
   BackColor       =   &H8000000D&
   Caption         =   "Vacation Viewer"
   ClientHeight    =   4905
   ClientLeft      =   555
   ClientTop       =   660
   ClientWidth     =   9795
   LinkTopic       =   "Form1"
   ScaleHeight     =   4905
   ScaleWidth      =   9795
   Begin VB.CommandButton cmdExit 
      BackColor       =   &H000000FF&
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   3960
      Width           =   2775
   End
   Begin VB.CommandButton cmdClear 
      BackColor       =   &H00C0C000&
      Caption         =   "Clear"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   3000
      Width           =   2775
   End
   Begin VB.CommandButton cmdGrandCanyon 
      BackColor       =   &H00C0C000&
      Caption         =   "Grand Canyon"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2040
      Width           =   2775
   End
   Begin VB.CommandButton cmdFujiTemple 
      BackColor       =   &H00C0C000&
      Caption         =   "Fuji Temple"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1080
      Width           =   2775
   End
   Begin VB.CommandButton cmdHawaii 
      BackColor       =   &H00C0C000&
      Caption         =   "Hawaii"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   120
      Width           =   2775
   End
   Begin VB.Label lblDisplay 
      BackColor       =   &H00C0C000&
      Caption         =   "Click a destination to see it's environment!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3240
      TabIndex        =   5
      Top             =   4080
      Width           =   6255
   End
   Begin VB.Image imgDisplay 
      Height          =   3855
      Left            =   3240
      Stretch         =   -1  'True
      Top             =   120
      Width           =   6255
   End
End
Attribute VB_Name = "frmVacation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: Feb 24 2014
'Purpose: To create an themed graphic viewer to see pictures of 3 different vacation locations.
Option Explicit

Private Sub cmdClear_Click()
imgDisplay.Picture = LoadPicture
cmdClear.Enabled = False
lblDisplay.Caption = "Click a destination to see it's environment!"

End Sub

Private Sub cmdExit_Click()
End
End Sub

Private Sub cmdFujiTemple_Click()
imgDisplay.Picture = LoadPicture(App.Path & "\FujiTemple.JPG")
cmdClear.Enabled = True
lblDisplay.Caption = "Fuji Temple, located in Japan, showing cherry blossom trees and a mountain."
End Sub

Private Sub cmdGrandCanyon_Click()
imgDisplay.Picture = LoadPicture(App.Path & "\GrandCanyon.JPG")
cmdClear.Enabled = True
lblDisplay.Caption = "The Grand Canyon, located in Arizona, at it's finest."

End Sub

Private Sub cmdHawaii_Click()
imgDisplay.Picture = LoadPicture(App.Path & "\Hawaii.JPG")
cmdClear.Enabled = True
lblDisplay.Caption = "Hawaii, located on the Hawaiian islands, showing it's exotic beaches."

End Sub

Private Sub Form_Load()
cmdClear.Enabled = False

End Sub

