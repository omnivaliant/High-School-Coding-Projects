VERSION 5.00
Begin VB.Form frmVowelCounter 
   Caption         =   "Vowel Counter"
   ClientHeight    =   6735
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7290
   LinkTopic       =   "Form1"
   ScaleHeight     =   6735
   ScaleWidth      =   7290
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraVowel 
      Caption         =   "Vowels"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4335
      Left            =   240
      TabIndex        =   4
      Top             =   2280
      Width           =   6615
      Begin VB.TextBox txtVowels 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   20
         Top             =   3720
         Width           =   2895
      End
      Begin VB.TextBox txtConsonants 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   19
         Top             =   3240
         Width           =   2895
      End
      Begin VB.TextBox txtY 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   18
         Top             =   2760
         Width           =   2895
      End
      Begin VB.TextBox txtU 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   17
         Top             =   2280
         Width           =   2895
      End
      Begin VB.TextBox txtO 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   16
         Top             =   1800
         Width           =   2895
      End
      Begin VB.TextBox txtI 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   15
         Top             =   1320
         Width           =   2895
      End
      Begin VB.TextBox txtE 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   14
         Top             =   840
         Width           =   2895
      End
      Begin VB.TextBox txtA 
         Enabled         =   0   'False
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
         Left            =   3600
         TabIndex        =   13
         Top             =   360
         Width           =   2895
      End
      Begin VB.Label lblVowels 
         BackColor       =   &H80000005&
         Caption         =   "Number Of Vowels:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   3720
         Width           =   3375
      End
      Begin VB.Label lblConsonants 
         BackColor       =   &H80000005&
         Caption         =   "Number Of Consonants:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   11
         Top             =   3240
         Width           =   3375
      End
      Begin VB.Label lblY 
         BackColor       =   &H80000005&
         Caption         =   "Number Of Y:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   2760
         Width           =   3375
      End
      Begin VB.Label lblU 
         BackColor       =   &H80000005&
         Caption         =   "Number Of U:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   2280
         Width           =   3375
      End
      Begin VB.Label lblO 
         BackColor       =   &H80000005&
         Caption         =   "Number Of O:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   3375
      End
      Begin VB.Label lblI 
         BackColor       =   &H80000005&
         Caption         =   "Number Of I:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   1320
         Width           =   3375
      End
      Begin VB.Label lblE 
         BackColor       =   &H80000005&
         Caption         =   "Number Of E:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   6
         Top             =   840
         Width           =   3375
      End
      Begin VB.Label lblA 
         BackColor       =   &H80000005&
         Caption         =   "Number Of A:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   3375
      End
   End
   Begin VB.CheckBox chkYvowel 
      BackColor       =   &H80000005&
      Caption         =   "Include Y as a vowel."
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
      TabIndex        =   3
      Top             =   1440
      Width           =   3375
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate!"
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
      Left            =   3720
      TabIndex        =   2
      Top             =   1440
      Width           =   3135
   End
   Begin VB.TextBox txtPhrase 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   6615
   End
   Begin VB.Label lblPrompt 
      Alignment       =   2  'Center
      BackColor       =   &H80000005&
      Caption         =   "Please enter a word or a phrase."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   6495
   End
End
Attribute VB_Name = "frmVowelCounter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Author: Mohit Patel
'Date: May 5 2014
'Purpose: To create a program which can calculate the number of vowels and consonants.
Option Explicit

Private Sub chkYvowel_Click()
If chkYvowel.Value = vbChecked Then
    lblY.Visible = True
    txtY.Visible = True
ElseIf chkYvowel.Value = vbUnchecked Then
    lblY.Visible = False
    txtY.Visible = False
End If
End Sub

Private Sub cmdCalculate_Click()
fraVowel.Visible = True
chkYvowel.Enabled = False
'Declaration
Dim strPhrase As String
Dim strLetter As String
Dim intLocation As Integer
Dim intLetter As String
Dim intA As Integer
Dim intE As Integer
Dim intI As Integer
Dim intO As Integer
Dim intU As Integer
Dim intY As Integer
Dim intVowels As Integer
Dim intConsonants As Integer
'Initialization
strPhrase = ""
strLetter = ""
intLocation = 0
intLetter = 0
intA = 0
intE = 0
intI = 0
intO = 0
intU = 0
intY = 0
intVowels = 0
intConsonants = 0
'Input
strPhrase = LCase(txtPhrase.Text)
'Process
Do While InStr(strPhrase, "a") <> 0
    intLocation = InStr(strPhrase, "a")
    intA = intA + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
Loop
Do While InStr(strPhrase, "e") <> 0
    intLocation = InStr(strPhrase, "e")
    intE = intE + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
Loop
Do While InStr(strPhrase, "i") <> 0
    intLocation = InStr(strPhrase, "i")
    intI = intI + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
Loop
Do While InStr(strPhrase, "o") <> 0
    intLocation = InStr(strPhrase, "o")
    intO = intO + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
Loop
Do While InStr(strPhrase, "u") <> 0
    intLocation = InStr(strPhrase, "u")
    intU = intU + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
Loop
If chkYvowel.Value = vbChecked Then
    Do While InStr(strPhrase, "y") <> 0
    intLocation = InStr(strPhrase, "y")
    intY = intY + 1
    strPhrase = Trim(Mid(strPhrase, 1, intLocation - 1)) & Trim(Mid(strPhrase, intLocation + 1))
    Loop
End If
intLocation = 1
If chkYvowel.Value = vbUnchecked Then
    intVowels = intA + intE + intI + intO + intU
    Do While intLocation < Len(strPhrase) + 1
        strLetter = Mid(strPhrase, intLocation, 1)
        If strLetter = "a" Or strLetter = "e" Or strLetter = "i" Or strLetter = "o" Or strLetter = "u" _
        Or strLetter < "a" Or strLetter > "z" Then
        Else:
            intConsonants = intConsonants + 1
        End If
        intLocation = intLocation + 1
    Loop
ElseIf chkYvowel.Value = vbChecked Then
    intVowels = intA + intE + intI + intO + intU + intY
    Do While intLocation < Len(strPhrase) + 1
        strLetter = Mid(strPhrase, intLocation, 1)
        If strLetter = "a" Or strLetter = "e" Or strLetter = "i" Or strLetter = "o" Or strLetter = "u" _
        Or strLetter < "a" Or strLetter > "z" Then
        Else:
            intConsonants = intConsonants + 1
        End If
        intLocation = intLocation + 1
    Loop
End If
'Output
txtA.Text = intA
txtE.Text = intE
txtI.Text = intI
txtO.Text = intO
txtU.Text = intU
txtY.Text = intY
txtVowels.Text = intVowels
txtConsonants.Text = intConsonants
End Sub

Private Sub Form_Load()
fraVowel.Visible = False
chkYvowel.Value = vbUnchecked
lblY.Visible = False
txtY.Visible = False
End Sub
Private Sub txtPhrase_Change()
fraVowel.Visible = False
chkYvowel.Enabled = True
txtA.Text = ""
txtE.Text = ""
txtI.Text = ""
txtO.Text = ""
txtU.Text = ""
txtY.Text = ""
txtVowels.Text = ""
txtConsonants.Text = ""
End Sub

Private Sub txtPhrase_Click()
fraVowel.Visible = False
chkYvowel.Enabled = True
txtA.Text = ""
txtE.Text = ""
txtI.Text = ""
txtO.Text = ""
txtU.Text = ""
txtY.Text = ""
txtVowels.Text = ""
txtConsonants.Text = ""
End Sub
