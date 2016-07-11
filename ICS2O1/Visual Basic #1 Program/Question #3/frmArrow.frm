VERSION 5.00
Begin VB.Form frmArrow 
   BackColor       =   &H8000000D&
   Caption         =   "Arrow"
   ClientHeight    =   6645
   ClientLeft      =   870
   ClientTop       =   960
   ClientWidth     =   14880
   LinkTopic       =   "Form1"
   ScaleHeight     =   6645
   ScaleWidth      =   14880
   Begin VB.CommandButton cmdReset 
      BackColor       =   &H00FFFF00&
      Caption         =   "Reset"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   15.75
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   4800
      Width           =   3975
   End
   Begin VB.CommandButton cmdFire 
      BackColor       =   &H000000FF&
      Caption         =   "Fire!"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   15.75
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3360
      Width           =   3975
   End
   Begin VB.CommandButton cmdDown 
      BackColor       =   &H00FFFF00&
      Caption         =   "Down"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   15.75
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   360
      MaskColor       =   &H00FFFF00&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1920
      Width           =   3975
   End
   Begin VB.CommandButton cmdUp 
      BackColor       =   &H00FFFF00&
      Caption         =   "Up"
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   18
         Charset         =   0
         Weight          =   900
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   360
      MaskColor       =   &H0000FFFF&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   480
      Width           =   3975
   End
   Begin VB.Image imgArrow 
      Height          =   270
      Left            =   4440
      Picture         =   "frmArrow.frx":0000
      Top             =   480
      Width           =   2880
   End
   Begin VB.Shape shpInnerCircle 
      FillColor       =   &H0000FFFF&
      FillStyle       =   0  'Solid
      Height          =   855
      Left            =   12840
      Shape           =   3  'Circle
      Top             =   2640
      Width           =   735
   End
   Begin VB.Shape shpMiddleCircle 
      FillColor       =   &H000080FF&
      FillStyle       =   0  'Solid
      Height          =   1575
      Left            =   12360
      Shape           =   3  'Circle
      Top             =   2280
      Width           =   1695
   End
   Begin VB.Shape shpOuterCircle 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   2295
      Left            =   11880
      Shape           =   3  'Circle
      Top             =   1920
      Width           =   2655
   End
End
Attribute VB_Name = "frmArrow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: Feburary 26 2014
'Purpose: To shoot an arrow onto a target, in order to demonstrate the relationship between shapes and properties.
Option Explicit

Private Sub cmdDown_Click()
imgArrow.Top = imgArrow.Top + 25
End Sub

Private Sub cmdFire_Click()
imgArrow.Left = 10320
cmdFire.Enabled = False
cmdUp.Enabled = False
cmdDown.Enabled = False

End Sub

Private Sub cmdReset_Click()
imgArrow.Top = 480
imgArrow.Left = 4440
cmdFire.Enabled = True
cmdUp.Enabled = True
cmdDown.Enabled = True

End Sub

Private Sub cmdUp_Click()
imgArrow.Top = imgArrow.Top - 25

End Sub

