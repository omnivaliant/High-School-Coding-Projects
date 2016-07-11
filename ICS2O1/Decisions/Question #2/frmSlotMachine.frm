VERSION 5.00
Begin VB.Form frmSlotMachine 
   Caption         =   "Slot Machine"
   ClientHeight    =   9120
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13320
   LinkTopic       =   "Form1"
   ScaleHeight     =   9120
   ScaleWidth      =   13320
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReturn 
      Caption         =   "Return money back to the bank."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   8400
      TabIndex        =   9
      Top             =   7440
      Width           =   4695
   End
   Begin VB.CommandButton cmdBorrow 
      Caption         =   "Borrow $20.00 from the bank."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   600
      TabIndex        =   6
      Top             =   7320
      Width           =   4575
   End
   Begin VB.CommandButton cmdPull 
      DownPicture     =   "frmSlotMachine.frx":0000
      Height          =   2655
      Left            =   5400
      Picture         =   "frmSlotMachine.frx":0E96
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4440
      Width           =   2655
   End
   Begin VB.Image imgPull2 
      Height          =   2535
      Left            =   8160
      Picture         =   "frmSlotMachine.frx":1D82
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   1575
   End
   Begin VB.Image imgPull1 
      Height          =   2535
      Left            =   3720
      Picture         =   "frmSlotMachine.frx":43B5
      Stretch         =   -1  'True
      Top             =   4440
      Width           =   1575
   End
   Begin VB.Label lblDebt 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   30
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5400
      TabIndex        =   8
      Top             =   8160
      Width           =   2775
   End
   Begin VB.Label lblDebtPrompt 
      Caption         =   "Debt:"
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
      Left            =   5400
      TabIndex        =   7
      Top             =   7440
      Width           =   2775
   End
   Begin VB.Label lblWin 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   """$""#,##0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   4105
         SubFormatType   =   2
      EndProperty
      BeginProperty Font 
         Name            =   "Impact"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   9840
      TabIndex        =   5
      Top             =   5760
      Width           =   3015
   End
   Begin VB.Label lblWinPrompt 
      Caption         =   "You win:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   9840
      TabIndex        =   4
      Top             =   4440
      Width           =   3015
   End
   Begin VB.Label lblBalance 
      Caption         =   "$20.00"
      BeginProperty DataFormat 
         Type            =   1
         Format          =   """$""#,##0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   4105
         SubFormatType   =   2
      EndProperty
      BeginProperty Font 
         Name            =   "Impact"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   600
      TabIndex        =   3
      Top             =   5760
      Width           =   3015
   End
   Begin VB.Label lblBalancePrompt 
      Caption         =   "Your current balance:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   600
      TabIndex        =   2
      Top             =   4440
      Width           =   3015
   End
   Begin VB.Label lblDescripton 
      Alignment       =   2  'Center
      BackColor       =   &H80000009&
      BackStyle       =   0  'Transparent
      Caption         =   "Roll the slot machine for a chance to win!"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   27.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   735
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   12375
   End
   Begin VB.Image imgSlot1 
      BorderStyle     =   1  'Fixed Single
      Height          =   3375
      Left            =   480
      Picture         =   "frmSlotMachine.frx":69E8
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3975
   End
   Begin VB.Image imgSlot3 
      BorderStyle     =   1  'Fixed Single
      Height          =   3375
      Left            =   8880
      Picture         =   "frmSlotMachine.frx":AA66
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3975
   End
   Begin VB.Image imgSlot2 
      BorderStyle     =   1  'Fixed Single
      Height          =   3375
      Left            =   4680
      Picture         =   "frmSlotMachine.frx":2C322
      Stretch         =   -1  'True
      Top             =   960
      Width           =   3975
   End
   Begin VB.Image imgBackground 
      Height          =   9135
      Left            =   0
      Picture         =   "frmSlotMachine.frx":4CC1E
      Stretch         =   -1  'True
      Top             =   0
      Width           =   13335
   End
End
Attribute VB_Name = "frmSlotMachine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: April 17 2014
'Purpose: To have fun and make money through a slot machine.
Option Explicit
Dim intMoney As Integer
Dim intDebt As Integer
Private Sub cmdBorrow_Click()
cmdBorrow.Visible = False
intMoney = intMoney + 20
intDebt = intDebt + 20
cmdPull.Enabled = True
imgPull1.Visible = True
imgPull2.Visible = True
lblBalance.Caption = FormatCurrency(intMoney)
lblDebt.Caption = FormatCurrency(intDebt)
End Sub

Private Sub cmdPull_Click()
intMoney = intMoney - 1
'Declaration
Dim intSlot1 As Integer
Dim intSlot2 As Integer
Dim intSlot3 As Integer
Dim intEarnings As Integer
'Initialiation
intSlot1 = Int(Rnd * 3) + 1
intSlot2 = Int(Rnd * 3) + 1
intSlot3 = Int(Rnd * 3) + 1
'Process
If intSlot1 = 1 And intSlot2 = 1 And intSlot3 = 1 Then
    intMoney = intMoney + 4
    lblWin.Caption = FormatCurrency(4)
    lblWin.BackColor = &HC0C0FF
ElseIf intSlot1 = 2 And intSlot2 = 2 And intSlot3 = 2 Then
    intMoney = intMoney + 8
    lblWin.Caption = FormatCurrency(8)
    lblWin.BackColor = &HFF8080
ElseIf intSlot1 = 3 And intSlot2 = 3 And intSlot3 = 3 Then
    intMoney = intMoney + 12
    lblWin.Caption = FormatCurrency(12)
    lblWin.BackColor = &H80FF80
Else:
    lblWin.Caption = "$0.00"
    lblWin.BackColor = &H8000000F
End If
'Output
If intSlot1 = 1 Then
    imgSlot1.Picture = LoadPicture(App.Path & "\torchic.gif")
ElseIf intSlot1 = 2 Then
    imgSlot1.Picture = LoadPicture(App.Path & "\mudkip.gif")
ElseIf intSlot1 = 3 Then
    imgSlot1.Picture = LoadPicture(App.Path & "\treeko.gif")
End If

If intSlot2 = 1 Then
    imgSlot2.Picture = LoadPicture(App.Path & "\torchic.gif")
ElseIf intSlot2 = 2 Then
    imgSlot2.Picture = LoadPicture(App.Path & "\mudkip.gif")
ElseIf intSlot2 = 3 Then
    imgSlot2.Picture = LoadPicture(App.Path & "\treeko.gif")
End If

If intSlot3 = 1 Then
    imgSlot3.Picture = LoadPicture(App.Path & "\torchic.gif")
ElseIf intSlot3 = 2 Then
    imgSlot3.Picture = LoadPicture(App.Path & "\mudkip.gif")
ElseIf intSlot3 = 3 Then
    imgSlot3.Picture = LoadPicture(App.Path & "\treeko.gif")
End If
lblBalance.Caption = FormatCurrency(intMoney)
If intMoney = 0 Then
    cmdPull.Enabled = False
    imgPull1.Visible = False
    imgPull2.Visible = False
    cmdBorrow.Visible = True
    lblDebtPrompt.Visible = True
    lblDebt.Visible = True
ElseIf intMoney > 20 And intDebt > 0 Then
    cmdReturn.Visible = True
Else
    cmdReturn.Visible = False
End If
End Sub

Private Sub cmdReturn_Click()
cmdReturn.Visible = False
'Declaration
Dim intAbove20 As Integer
'Initialization
intAbove20 = 0
'Input, Process, & Output
intAbove20 = intMoney - 20
If intDebt >= intAbove20 Then
    intDebt = intDebt - intAbove20
    intMoney = intMoney - intAbove20
    lblDebt.Caption = FormatCurrency(intDebt)
    lblBalance.Caption = FormatCurrency(intMoney)
End If
End Sub

Private Sub Form_Load()
Randomize
intMoney = 20
intDebt = 0
cmdReturn.Visible = False
cmdBorrow.Visible = False
lblDebtPrompt.Visible = False
lblDebt.Visible = False
End Sub

