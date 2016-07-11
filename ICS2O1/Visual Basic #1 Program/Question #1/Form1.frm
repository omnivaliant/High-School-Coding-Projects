VERSION 5.00
Begin VB.Form frmHelloWorld 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Hello World!"
   ClientHeight    =   4980
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7245
   LinkTopic       =   "Form1"
   ScaleHeight     =   4980
   ScaleWidth      =   7245
   Begin VB.Frame fraStyle 
      BackColor       =   &H00C0FFFF&
      Caption         =   "Style"
      Height          =   3015
      Left            =   4800
      TabIndex        =   3
      Top             =   1680
      Width           =   2245
      Begin VB.OptionButton optNormal 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Normal"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   2400
         Width           =   2055
      End
      Begin VB.OptionButton optItalic 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Italic"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1440
         Width           =   2055
      End
      Begin VB.OptionButton optBold 
         BackColor       =   &H00C0FFFF&
         Caption         =   "Bold"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   2055
      End
   End
   Begin VB.Frame fraCaption 
      BackColor       =   &H008080FF&
      Caption         =   "Caption"
      Height          =   3015
      Index           =   0
      Left            =   2400
      TabIndex        =   2
      Top             =   1680
      Width           =   2370
      Begin VB.OptionButton optWhat 
         BackColor       =   &H008080FF&
         Caption         =   "What's Up?"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   2400
         Width           =   2175
      End
      Begin VB.OptionButton optHow 
         BackColor       =   &H008080FF&
         Caption         =   "How's it Going?"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   1440
         Width           =   2175
      End
      Begin VB.OptionButton optHello 
         BackColor       =   &H008080FF&
         Caption         =   "Hello World!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   2175
      End
   End
   Begin VB.Frame fraFont 
      BackColor       =   &H00FFFF80&
      Caption         =   "Font"
      Height          =   3015
      Left            =   120
      TabIndex        =   1
      Top             =   1680
      Width           =   2245
      Begin VB.OptionButton optPap 
         BackColor       =   &H00FFFF80&
         Caption         =   "Papyrus"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   6
         Top             =   2280
         Width           =   2055
      End
      Begin VB.OptionButton optCal 
         BackColor       =   &H00FFFF80&
         Caption         =   "Calibri"
         BeginProperty Font 
            Name            =   "Calibri"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   1440
         Width           =   2055
      End
      Begin VB.OptionButton optMs 
         BackColor       =   &H00FFFF80&
         Caption         =   "MS Sans Serif"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   2055
      End
   End
   Begin VB.Label lblDisplay 
      Alignment       =   2  'Center
      BackColor       =   &H0080FF80&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   36
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   6735
   End
End
Attribute VB_Name = "frmHelloWorld"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Author: Mohit Patel
' Date: Febuary 21 2014
' Purpose: This program will display "Hello World" in a variety of fonts, captions, and style.
Option Explicit


Private Sub Form_Load()
optHello = True
optBold = True
optMs = True

End Sub

Private Sub optBold_Click()
lblDisplay.FontBold = True
lblDisplay.FontItalic = False

End Sub

Private Sub optCal_Click()
lblDisplay.Font = "Calibri"
End Sub

Private Sub optHello_Click()
lblDisplay.Caption = "Hello World!"

End Sub

Private Sub optHow_Click()
lblDisplay.Caption = "How's it going?"

End Sub

Private Sub optItalic_Click()
lblDisplay.FontBold = False
lblDisplay.FontItalic = True

End Sub

Private Sub optMs_Click()
lblDisplay.Font = "Ms Sans Serif"

End Sub

Private Sub optNormal_Click()
lblDisplay.FontBold = False
lblDisplay.FontItalic = False
End Sub

Private Sub optPap_Click()
lblDisplay.Font = "Papyrus"

End Sub

Private Sub optWhat_Click()
lblDisplay.Caption = "What's up?"

End Sub
