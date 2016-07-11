VERSION 5.00
Begin VB.Form frmLightBulbProject 
   BackColor       =   &H80000000&
   Caption         =   "The Light Bulb Project"
   ClientHeight    =   3195
   ClientLeft      =   1485
   ClientTop       =   1155
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.CommandButton cmdOff 
      Caption         =   "Off"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2880
      TabIndex        =   2
      Top             =   1200
      Width           =   1575
   End
   Begin VB.CommandButton cmdOn 
      Caption         =   "On"
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
      Left            =   2880
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
   Begin VB.Image imgDisplay 
      Height          =   1815
      Left            =   240
      Stretch         =   -1  'True
      Top             =   240
      Width           =   2415
   End
   Begin VB.Label lblMessage 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
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
      Left            =   240
      TabIndex        =   0
      Top             =   2160
      Width           =   4215
   End
End
Attribute VB_Name = "frmLightBulbProject"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: Feburary 21 2014
'Purpose: This was my first vb program;learning about
'         objects, properties, front end and back end.
Option Explicit

Private Sub cmdOff_Click()
imgDisplay.Picture = LoadPicture(App.Path _
                        & "\bulboff.jpg")
lblMessage.Caption = "The Light is Off!"
cmdOff.Enabled = False
cmdOn.Enabled = True
End Sub

Private Sub cmdOn_Click()
imgDisplay.Picture = LoadPicture(App.Path _
                        & "\bulbon.jpg")
lblMessage.Caption = "The Light is On!"
cmdOn.Enabled = False
cmdOff.Enabled = True

End Sub

Private Sub Form_Load()
cmdOn.Value = True
End Sub

Private Sub imgDisplay_Click()

End Sub
