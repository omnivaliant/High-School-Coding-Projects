VERSION 5.00
Begin VB.Form frmSequence 
   Caption         =   "Sequence Creator"
   ClientHeight    =   7545
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5970
   LinkTopic       =   "Form1"
   ScaleHeight     =   7545
   ScaleWidth      =   5970
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstOutput 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2400
      Left            =   120
      TabIndex        =   25
      Top             =   5040
      Width           =   5655
   End
   Begin VB.Frame fraFibonacci 
      Caption         =   "Fibonacci"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   2520
      TabIndex        =   20
      Top             =   120
      Width           =   3255
      Begin VB.CommandButton cmdFiboSequence 
         Caption         =   "Sequence!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   240
         TabIndex        =   22
         Top             =   2520
         Width           =   2775
      End
      Begin VB.TextBox txtFiboNumberOfTerms 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   21
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label lblFiboNumberOfTerms 
         Caption         =   "Number of Terms:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   120
         TabIndex        =   23
         Top             =   600
         Width           =   1455
      End
   End
   Begin VB.Frame fraGeometric 
      Caption         =   "Geometric"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   2520
      TabIndex        =   12
      Top             =   120
      Width           =   3255
      Begin VB.TextBox txtGeoStartingNumber 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   16
         Top             =   570
         Width           =   1575
      End
      Begin VB.TextBox txtGeoCommonRatio 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   15
         Top             =   1200
         Width           =   1575
      End
      Begin VB.TextBox txtGeoNumberOfTerms 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   14
         Top             =   1800
         Width           =   1575
      End
      Begin VB.CommandButton cmdGeoSequence 
         Caption         =   "Sequence!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   240
         TabIndex        =   13
         Top             =   2520
         Width           =   2775
      End
      Begin VB.Label lblGeoStartingNumber 
         Caption         =   "Starting number:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label lbGeoCommonRatio 
         Caption         =   "Common ratio:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label lblGeoNumberOfTerms 
         Caption         =   "Number of Terms:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   17
         Top             =   1800
         Width           =   1455
      End
   End
   Begin VB.Frame fraArithmetic 
      Caption         =   "Arithmetic"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   2520
      TabIndex        =   4
      Top             =   120
      Width           =   3255
      Begin VB.CommandButton cmdArithSequence 
         Caption         =   "Sequence!"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   240
         TabIndex        =   11
         Top             =   2520
         Width           =   2775
      End
      Begin VB.TextBox txtArithNumberOfTerms 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   10
         Top             =   1800
         Width           =   1575
      End
      Begin VB.TextBox txtArithCommonDifference 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   8
         Top             =   1200
         Width           =   1575
      End
      Begin VB.TextBox txtArithStartingNumber 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   1560
         TabIndex        =   6
         Top             =   570
         Width           =   1575
      End
      Begin VB.Label lblArithNumberOfTerms 
         Caption         =   "Number of Terms:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   9
         Top             =   1800
         Width           =   1455
      End
      Begin VB.Label lblArithCommonDifference 
         Caption         =   "Common difference:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   1200
         Width           =   1455
      End
      Begin VB.Label lblArithStartingNumber 
         Caption         =   "Starting number:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   1455
      End
   End
   Begin VB.Frame fraSequences 
      Caption         =   "Sequences"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
      Begin VB.OptionButton optFibonacci 
         Caption         =   "Fibonacci Sequence"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   3
         Top             =   1680
         Width           =   1815
      End
      Begin VB.OptionButton optGeometric 
         Caption         =   "Geometric Sequence"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   2
         Top             =   1080
         Width           =   1815
      End
      Begin VB.OptionButton optArithmetic 
         Caption         =   "Arithmetic Sequence"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   1
         Top             =   480
         Width           =   1815
      End
   End
   Begin VB.Label lblSequence 
      Alignment       =   2  'Center
      BackColor       =   &H8000000B&
      Caption         =   "Fibonacci Sequence"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   24
      Top             =   4440
      Width           =   5535
   End
End
Attribute VB_Name = "frmSequence"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 2 2014
'Purpose: To create a program which can do a variety of sequences.
Option Explicit

Private Sub cmdArithSequence_Click()
lstOutput.Clear
'Declaration
Dim intStartingNumber As Integer
Dim intCommonDifference As Integer
Dim intNumberOfTerms As Integer
Dim intCurrentTerm As Integer
'Initialization
intStartingNumber = 0
intCommonDifference = 0
intNumberOfTerms = 0
intCurrentTerm = 1
'Input
intStartingNumber = Val(txtArithStartingNumber.Text)
intCommonDifference = Val(txtArithCommonDifference.Text)
intNumberOfTerms = Val(txtArithNumberOfTerms.Text)
'Process and Output
lstOutput.AddItem intStartingNumber
Do:
intStartingNumber = intStartingNumber + intCommonDifference
intCurrentTerm = intCurrentTerm + 1
lstOutput.AddItem intStartingNumber
Loop While intNumberOfTerms > intCurrentTerm
End Sub

Private Sub cmdFiboSequence_Click()
lstOutput.Clear
'Declaration
Dim intNumber As Integer
Dim intNumberOfTerms As Integer
Dim intCurrentTerm As Integer
Dim intPreviousNumber As Integer
'Initialization
intNumber = 1
intCurrentTerm = 0
intPreviousNumber = 0
'Input
intNumberOfTerms = Val(txtFiboNumberOfTerms.Text)
'Process
Do While intNumberOfTerms > intCurrentTerm
    lstOutput.AddItem intNumber
    intNumber = intNumber + intPreviousNumber
    intPreviousNumber = intNumber - intPreviousNumber
    intCurrentTerm = intCurrentTerm + 1
Loop
'Output
End Sub

Private Sub cmdGeoSequence_Click()
lstOutput.Clear
'Declaration
Dim lngStartingNumber As Long
Dim intCommonRatio As Integer
Dim intNumberOfTerms As Integer
Dim intCurrentTerm As Integer
'Initialization
lngStartingNumber = 0
intCommonRatio = 0
intNumberOfTerms = 0
intCurrentTerm = 1
'Input
lngStartingNumber = Val(txtGeoStartingNumber.Text)
intCommonRatio = Val(txtGeoCommonRatio.Text)
intNumberOfTerms = Val(txtGeoNumberOfTerms.Text)
'Process and Output
lstOutput.AddItem lngStartingNumber
Do:
lngStartingNumber = lngStartingNumber * intCommonRatio
intCurrentTerm = intCurrentTerm + 1
lstOutput.AddItem lngStartingNumber
Loop While intNumberOfTerms > intCurrentTerm
End Sub

Private Sub Form_Load()
optArithmetic.Value = True
End Sub

Private Sub optArithmetic_Click()
lstOutput.Clear
lblSequence.Caption = "Arithmetic Sequence."
fraArithmetic.Visible = True
fraFibonacci.Visible = False
fraGeometric.Visible = False
txtArithCommonDifference.Text = ""
txtArithStartingNumber.Text = ""
txtArithNumberOfTerms.Text = ""
End Sub
Private Sub optFibonacci_Click()
lstOutput.Clear
lblSequence.Caption = "Fibonacci Sequence."
fraArithmetic.Visible = False
fraFibonacci.Visible = True
fraGeometric.Visible = False
txtFiboNumberOfTerms.Text = ""
End Sub
Private Sub optGeometric_Click()
lstOutput.Clear
lblSequence.Caption = "Geometric Sequence."
fraArithmetic.Visible = False
fraFibonacci.Visible = False
fraGeometric.Visible = True
txtGeoCommonRatio.Text = ""
txtGeoStartingNumber.Text = ""
txtGeoNumberOfTerms.Text = ""
End Sub
