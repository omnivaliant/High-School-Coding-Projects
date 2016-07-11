VERSION 5.00
Begin VB.Form frmCounter 
   BackColor       =   &H80000005&
   Caption         =   "2"
   ClientHeight    =   6660
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9930
   LinkTopic       =   "Form1"
   ScaleHeight     =   6660
   ScaleWidth      =   9930
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picNumber 
      BackColor       =   &H80000008&
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      FontTransparent =   0   'False
      Height          =   4095
      Left            =   120
      ScaleHeight     =   4035
      ScaleWidth      =   3435
      TabIndex        =   2
      Top             =   2520
      Width           =   3495
   End
   Begin VB.CommandButton cmdCount 
      BackColor       =   &H80000005&
      Caption         =   "Count!"
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
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   1200
      Width           =   3495
   End
   Begin VB.PictureBox picGraph 
      BackColor       =   &H80000005&
      ForeColor       =   &H000080FF&
      Height          =   6135
      Left            =   3720
      ScaleHeight     =   6075
      ScaleWidth      =   5865
      TabIndex        =   3
      Top             =   120
      Width           =   5925
      Begin VB.Label lblHeading 
         Alignment       =   2  'Center
         BackColor       =   &H8000000E&
         Caption         =   "Frequency Of Dice Sums"
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
         Left            =   0
         TabIndex        =   26
         Top             =   120
         Width           =   5895
      End
      Begin VB.Label lbl0 
         BackColor       =   &H8000000E&
         Caption         =   " 0-"
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
         TabIndex        =   25
         Top             =   5760
         Width           =   255
      End
      Begin VB.Label lbl200 
         BackColor       =   &H8000000E&
         Caption         =   "200-"
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
         Left            =   0
         TabIndex        =   24
         Top             =   960
         Width           =   375
      End
      Begin VB.Label lbl180 
         BackColor       =   &H8000000E&
         Caption         =   "180-"
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
         Left            =   0
         TabIndex        =   23
         Top             =   1440
         Width           =   375
      End
      Begin VB.Label lbl160 
         BackColor       =   &H8000000E&
         Caption         =   "160-"
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
         Left            =   0
         TabIndex        =   22
         Top             =   1920
         Width           =   375
      End
      Begin VB.Label lbl140 
         BackColor       =   &H8000000E&
         Caption         =   "140-"
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
         Left            =   0
         TabIndex        =   21
         Top             =   2400
         Width           =   375
      End
      Begin VB.Label lbl120 
         BackColor       =   &H8000000E&
         Caption         =   "120-"
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
         Left            =   0
         TabIndex        =   20
         Top             =   2880
         Width           =   375
      End
      Begin VB.Label lbl100 
         BackColor       =   &H8000000E&
         Caption         =   "100-"
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
         Left            =   0
         TabIndex        =   19
         Top             =   3360
         Width           =   375
      End
      Begin VB.Label lbl80 
         BackColor       =   &H8000000E&
         Caption         =   "80-"
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
         Top             =   3840
         Width           =   255
      End
      Begin VB.Label lbl60 
         BackColor       =   &H8000000E&
         Caption         =   "60-"
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
         TabIndex        =   17
         Top             =   4320
         Width           =   255
      End
      Begin VB.Label lbl40 
         BackColor       =   &H8000000E&
         Caption         =   "40-"
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
         TabIndex        =   16
         Top             =   4800
         Width           =   255
      End
      Begin VB.Label lbl20 
         BackColor       =   &H8000000E&
         Caption         =   "20-"
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
         TabIndex        =   15
         Top             =   5280
         Width           =   255
      End
      Begin VB.Shape shpTwelve 
         FillColor       =   &H0080FFFF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   5400
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpEleven 
         FillColor       =   &H0080C0FF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   4920
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpTen 
         FillColor       =   &H008080FF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   4440
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpNine 
         FillColor       =   &H00FF00FF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   3960
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpEight 
         FillColor       =   &H00FF8080&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   3480
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpSeven 
         FillColor       =   &H00FFFF00&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   3000
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpSix 
         FillColor       =   &H0000FF00&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   2520
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpFive 
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   2040
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpFour 
         FillColor       =   &H000080FF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   1560
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpThree 
         FillColor       =   &H000000FF&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   1080
         Top             =   6000
         Width           =   405
      End
      Begin VB.Shape shpTwo 
         FillColor       =   &H00C0C0C0&
         FillStyle       =   0  'Solid
         Height          =   15
         Left            =   600
         Top             =   6000
         Width           =   405
      End
   End
   Begin VB.Label lblTwelve 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080FFFF&
      Height          =   375
      Left            =   9120
      TabIndex        =   14
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblEleven 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "11"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0080C0FF&
      Height          =   375
      Left            =   8640
      TabIndex        =   13
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblTen 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H008080FF&
      Height          =   375
      Left            =   8160
      TabIndex        =   12
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblNine 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   375
      Left            =   7680
      TabIndex        =   11
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lnlEight 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   375
      Left            =   7200
      TabIndex        =   10
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblSeven 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   375
      Left            =   6720
      TabIndex        =   9
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblSix 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   6240
      TabIndex        =   8
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblFive 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Left            =   5760
      TabIndex        =   7
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblFour 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000080FF&
      Height          =   375
      Left            =   5280
      TabIndex        =   6
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblThree 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   4800
      TabIndex        =   5
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblTwo 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0C0C0&
      Height          =   375
      Left            =   4320
      TabIndex        =   4
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label lblPrompt 
      BackColor       =   &H80000005&
      Caption         =   "Press the button to count the sum of two numbers 1000 times!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3495
   End
End
Attribute VB_Name = "frmCounter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 10 2014
'Purpose: To count two numbers 1000 times, and display their sums.
Option Explicit
Private Sub cmdCount_Click()
'Declaration
Dim intNumber1 As Integer
Dim intNumber2 As Integer
Dim intCount As Integer
Dim intTwoCount As Integer
Dim intThreeCount As Integer
Dim intFourCount As Integer
Dim intFiveCount As Integer
Dim intSixCount As Integer
Dim intSevenCount As Integer
Dim intEightCount As Integer
Dim intNineCount As Integer
Dim intTenCount As Integer
Dim intElevenCount As Integer
Dim intTwelveCount As Integer
'Initialization
intNumber1 = 0
intNumber2 = 0
intCount = 1
intTwoCount = 0
intThreeCount = 0
intFourCount = 0
intFiveCount = 0
intSixCount = 0
intSevenCount = 0
intEightCount = 0
intNineCount = 0
intTenCount = 0
intElevenCount = 0
intTwelveCount = 0
'Process
For intCount = 1 To 1000
    intNumber1 = Int(Rnd * 6) + 1
    intNumber2 = Int(Rnd * 6) + 1
    If intNumber1 + intNumber2 = 2 Then
        intTwoCount = intTwoCount + 1
    ElseIf intNumber1 + intNumber2 = 3 Then
        intThreeCount = intThreeCount + 1
    ElseIf intNumber1 + intNumber2 = 4 Then
        intFourCount = intFourCount + 1
    ElseIf intNumber1 + intNumber2 = 5 Then
        intFiveCount = intFiveCount + 1
    ElseIf intNumber1 + intNumber2 = 6 Then
        intSixCount = intSixCount + 1
    ElseIf intNumber1 + intNumber2 = 7 Then
        intSevenCount = intSevenCount + 1
    ElseIf intNumber1 + intNumber2 = 8 Then
        intEightCount = intEightCount + 1
    ElseIf intNumber1 + intNumber2 = 9 Then
        intNineCount = intNineCount + 1
    ElseIf intNumber1 + intNumber2 = 10 Then
        intTenCount = intTenCount + 1
    ElseIf intNumber1 + intNumber2 = 11 Then
        intElevenCount = intElevenCount + 1
    Else:
        intTwelveCount = intTwelveCount + 1
    End If
Next intCount
'Output
picNumber.Cls
picNumber.ForeColor = &HC0C0C0
picNumber.Print "2: " & intTwoCount & " or " & intTwoCount / 10 & "%."
picNumber.ForeColor = &HFF&
picNumber.Print "3: " & intThreeCount & " or " & intThreeCount / 10 & "%."
picNumber.ForeColor = &H80FF&
picNumber.Print "4: " & intFourCount & " or " & intFourCount / 10 & "%."
picNumber.ForeColor = &HFFFF&
picNumber.Print "5: " & intFiveCount & " or " & intFiveCount / 10 & "%."
picNumber.ForeColor = &HFF00&
picNumber.Print "6: " & intSixCount & " or " & intSixCount / 10 & "%."
picNumber.ForeColor = &HFFFF00
picNumber.Print "7: " & intSevenCount & " or " & intSevenCount / 10 & "%."
picNumber.ForeColor = &HFF8080
picNumber.Print "8: " & intEightCount & " or " & intEightCount / 10 & "%."
picNumber.ForeColor = &HFF00FF
picNumber.Print "9: " & intNineCount & " or " & intNineCount / 10 & "%."
picNumber.ForeColor = &H8080FF
picNumber.Print "10: " & intTenCount & " or " & intTenCount / 10 & "%."
picNumber.ForeColor = &H80C0FF
picNumber.Print "11: " & intElevenCount & " or " & intElevenCount / 10 & "%."
picNumber.ForeColor = &H80FFFF
picNumber.Print "12: " & intTwelveCount & " or " & intTwelveCount / 10 & "%."
shpTwo.Height = intTwoCount * 24
shpTwo.Top = 5880 - (intTwoCount * 24)
shpThree.Height = intThreeCount * 24
shpThree.Top = 5880 - (intThreeCount * 24)
shpFour.Height = intFourCount * 24
shpFour.Top = 5880 - (intFourCount * 24)
shpFive.Height = intFiveCount * 24
shpFive.Top = 5880 - (intFiveCount * 24)
shpSix.Height = intSixCount * 24
shpSix.Top = 5880 - (intSixCount * 24)
shpSeven.Height = intSevenCount * 24
shpSeven.Top = 5880 - (intSevenCount * 24)
shpEight.Height = intEightCount * 24
shpEight.Top = 5880 - (intEightCount * 24)
shpNine.Height = intNineCount * 24
shpNine.Top = 5880 - (intNineCount * 24)
shpTen.Height = intTenCount * 24
shpTen.Top = 5880 - (intTenCount * 24)
shpEleven.Height = intElevenCount * 24
shpEleven.Top = 5880 - (intElevenCount * 24)
shpTwelve.Height = intTwelveCount * 24
shpTwelve.Top = 5880 - (intTwelveCount * 24)
End Sub

Private Sub Form_Load()
Randomize
End Sub

